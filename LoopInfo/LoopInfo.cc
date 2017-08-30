#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstVisitor.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Dominators.h"
#include "llvm/Analysis/DependenceAnalysis.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/CodeExtractor.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FileUtilities.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/IR/Instruction.def"
#include "llvm/IR/CFG.h"

#include <stdlib.h>
#include <iostream>
#include <map>
#include <set>
#include <unordered_set>
#include <cxxabi.h>
#include <fstream>
#define myassert(cond) \
        do { \
        if (!(cond)) \
        { \
            cerr<< "\nassertion failed ("<<#cond <<"), File \"" << __FILE__ <<"\", Function \""<<__func__<<"\", Line "<< __LINE__<<"\n\n"; \
            exit(1); \
        } \
        } while (0)
        
#define RATIO(a, b) (a==0? "0": (b==0? "INF" :to_string(a/b)))
#define PERC(a, b) (a==0? 0: (b==0? 100 :a*100/b))
#define log(i) fd<<"num of "<<#i<<" insts = "<<instCnt[AddrSpaceCastInst::i]<<"\n";
#define instMax 128
#define binOp 127
#define BBSI 50 //basic block size interval
#define ll long long
#define DP(x) if(debugMode) printf(x);
using namespace std;
using namespace llvm;

 
static cl::opt<bool> hotpath("hotpath", cl::init(false), cl::Hidden, 
  cl::desc("check which counter is used for each loop, use with -fprofile-generate"));
 
static cl::opt<string> hotpath_file("hotpath-file", cl::init(""), cl::Hidden, 
  cl::desc("specify the hotpath file obtained at runtime"));
 
static cl::opt<bool> debug("debug", cl::init(false), cl::Hidden, 
  cl::desc("print debug info"));


namespace {
struct myPass : FunctionPass, InstVisitor<myPass>
{
  Module *M = 0;
  DataLayout *DL = 0;
  static char ID;
  myPass() : FunctionPass(ID) {}

  StringRef getPassName() const override {
    return "Loop IR info collect ++";
  }
  
  LLVMContext *C = 0;
  Type* int64Ty = 0;
  Type* int32Ty = 0;
  Type* boolTy = 0;
  Type* voidTy = 0;
  Type* boolPtrTy = 0;
  
  
  ScalarEvolution *SE;
  DependenceInfo *DI;
  LoopInfo *LI;
  DominatorTree *DT; 
  
  
  int instCnt[instMax];
  vector<CallInst*> CallInsts;
  vector<StoreInst*> StoreInsts;
  vector<LoadInst*> LoadInsts;
  
  error_code EC;
  string fileName = "IRinfo.txt";
  string hotpathFileName = "";
  bool checkCounter = false;
  bool debugMode = false;
  
  typedef struct profileInfo {
    string functionName;
    int numCounters;
    ll* counters;
  } profileInfo;
  
 
	void getAnalysisUsage(AnalysisUsage &AU) const override {
		AU.addRequired<LoopInfoWrapperPass>();
		AU.addRequired<DominatorTreeWrapperPass>();
		AU.addRequired<ScalarEvolutionWrapperPass>();
		AU.addRequired<DependenceAnalysisWrapperPass>();
	}

	
  bool doInitialization(Module &Mod) override {
    M = &Mod;
    if (DL)
      delete DL;
    DL = new DataLayout(M);
    C = &(M->getContext());
    int32Ty = Type::getInt32Ty(*C);
    int64Ty = Type::getInt64Ty(*C);
    boolTy = Type::getInt1Ty(*C);
    voidTy = Type::getVoidTy(*C);
    boolPtrTy = Type::getInt1PtrTy(*C);
    
    if (hotpath.getNumOccurrences() > 0)
      checkCounter = hotpath;
      
    if (hotpath_file.getNumOccurrences() > 0)
      hotpathFileName = hotpath_file;
      
    if (debug.getNumOccurrences() > 0)
      debugMode = true;
    
    if(checkCounter) fileName = "IRinfo_profile.txt";
    return false;
  }
  
  
	//test if a value is a constant, return the value if yes, -1 otherwise
  int getConstant(Value *v)
  {
  	if(ConstantInt *c = dyn_cast<ConstantInt>(v)) 
  		return c->getValue().getLimitedValue();
  	else return -1;	
	}
	
	//get the return instruction of a function
	ReturnInst* getRetInst(Function* F)
	{
		if(F->doesNotReturn()) return nullptr;
		for(auto& bb:F->getBasicBlockList()){
			TerminatorInst* term = bb.getTerminator();
			if(!term) continue;
			if(ReturnInst* ret = dyn_cast<ReturnInst>(term)) return ret;
		}
		return nullptr;
	}
	
	
	int numInst(Function* F)
	{
		int sum = 0;
		for(auto& bb: *F)
			sum+=numInst(&bb);
		return sum;
	}
	
	int numInst(BasicBlock* B)
	{
		return B->size();
	}
	
	int numInst(Loop* lp)
	{
		int sum = 0;
		for(auto& bb: lp->getBlocks())
			sum+=numInst(bb);
		return sum;
	}
	
	void dumpLoop(Loop* lp, string str = "a loop")
	{
		assert(lp && "dumping a non-exist loop");
		cout<<"-------------------- "<<str<<" START --------------------\n";
		for(auto bb: lp->getBlocks())
			bb->dump();
		cout<<"-------------------- "<<str<<" END   --------------------\n";
	}
	
	int floatCnt = 0;
	int intCnt=0;
	int floatVecCnt = 0;
	int intVecCnt = 0;
	
	void visitAllocaInst(AllocaInst &I) {
    instCnt[AddrSpaceCastInst::MemoryOps::Alloca]++;
  }
  
	void visitStoreInst(StoreInst &I) {
    instCnt[AddrSpaceCastInst::MemoryOps::Store]++;
    StoreInsts.push_back(&I);
  }
  
	void visitLoadInst(LoadInst &I) {
    instCnt[AddrSpaceCastInst::MemoryOps::Load]++;
    LoadInsts.push_back(&I);
  }
  
	void visitCallInst(CallInst &I) {
    instCnt[AddrSpaceCastInst::OtherOps::Call]++;
    CallInsts.push_back(&I);
  }
  
  
  void visitBinaryOperator(BinaryOperator &I) {
    instCnt[binOp]++;
    Type* ty = I.getOperand(0)->getType();
    if(ty->isFloatingPointTy()) floatCnt++;
    else if(ty->isIntegerTy()) intCnt++;
    else if(ty->isVectorTy())
    {
    	Type* tys = ty->getScalarType();
    	if(tys->isFloatingPointTy()) floatVecCnt++;
  		else if(tys->isIntegerTy()) intVecCnt++;
    }
    else ty->dump();
  }

	int* basicBlockRange(Function &F)
	{
		int res[3] = {0,0,0};
		for(auto& bb: F)
		{
		  int s = bb.size();
		  if(s<BBSI) res[0]++;
		  else if(s<BBSI*2) res[1]++;
		  else res[2]++;
		}
		return &res[0];
	}  
	
	int* basicBlockRange(Loop* lp)
	{
		int res[3] = {0,0,0};
		for(auto bb: lp->getBlocks())
		{
		  int s = bb->size();
		  if(s<BBSI) res[0]++;
		  else if(s<BBSI*2) res[1]++;
		  else res[2]++;
		}
		return &res[0];
	}  
	
	bool isRecursive(Function &F)
	{
	  for(CallInst* ci:CallInsts)
	    if(ci->getCalledFunction() == &F) return true;
	    
    return false;
	}
	
	void instStat(BasicBlock* BB, int& allocInsts, int& storeInsts, int& loadInsts, int& arithInsts, int& vecArithInsts, int& GEPInsts)
	{
	  for(auto it = BB->begin();it!=BB->end();it++)
	    if(isa<AllocaInst>(it)) allocInsts++;
	    else if(isa<LoadInst>(it)) loadInsts++;
	    else if(isa<StoreInst>(it)) storeInsts++;
	    else if(isa<GEPOperator>(it)) GEPInsts++;
      else if(isa<BinaryOperator>(it)) {
        arithInsts++;
        Type* ty = (*it).getOperand(0)->getType();
        if(ty->isVectorTy()) vecArithInsts++;
      }      
    return;
	} 
	
	void instStat(Loop* lp,  int& allocInsts, int& storeInsts, int& loadInsts, int& arithInsts, int& vecArithInsts, int& GEPInsts)
	{
	  for(auto& bb: lp->getBlocks())
			instStat(bb, allocInsts, storeInsts, loadInsts, arithInsts, vecArithInsts, GEPInsts);
		return;
	}
	
	void brStat(Loop* lp, int& uncondiBr, int& condiBr, int& undirectBr)
	{
	  for(auto& bb: lp->getBlocks())
	  {
	    auto ti = bb->getTerminator();
	    if(isa<IndirectBrInst>(ti)) undirectBr++;
	    else if(BranchInst* bi = dyn_cast<BranchInst>(ti)) {
	      if(bi->isConditional()) condiBr++;
	      else uncondiBr++;
	    }
	  }
	  return;
	}
	
	
	void collectInst(Loop* lp, set<LoadInst*> *ldInsts, set<StoreInst*> *stInsts)
	{
		auto bbs = lp->getBlocks();
		for(auto bb: bbs)
			for(auto it = bb->begin();it!=bb->end();it++)
			{
				if(StoreInst *SI = dyn_cast<StoreInst>(it))
					stInsts->insert(SI);
				else if(LoadInst *LI = dyn_cast<LoadInst>(it))
					ldInsts->insert(LI);
			}
		return;
	}
	
	bool primaryDepCheck(Loop* lp)
 	{
 		set<Instruction*> ldInsts, stInsts;
		
		auto bbs = lp->getBlocks();
		for(auto bb: bbs)
			for(auto it = bb->begin();it!=bb->end();it++)
			{
				if(isa<StoreInst>(it))
					stInsts.insert(&*it);
				else if(isa<LoadInst>(it))
					ldInsts.insert(&*it);
			}
			
		bool hasDep = false;
		cout<<ldInsts.size()<<" "<<stInsts.size()<<endl;
		for(auto ld:ldInsts)
			for(auto st:stInsts)
			{
				auto d = DI->depends(ld, st, true);     //sometime error
				if(d==nullptr) continue;
				int lvls = d->getLevels ();
				if(lvls==0) continue;
				else hasDep=1;
			}
		ldInsts.clear();
		stInsts.clear();
		return hasDep;
 	}
 	
 	int getCounterID(BasicBlock* bb)
 	{
 	  int id = -1;
		for(auto it = bb->begin();it!=bb->end();it++)
		{
			if(LoadInst *LI = dyn_cast<LoadInst>(it)) {
				Value* pointer = LI->getPointerOperand();
				if(GEPOperator *GEP = dyn_cast<GEPOperator>(pointer) ){
				  if( GEP->getNumOperands()==3) {
				    if(GEP->getOperand(0)->getName().str().find("__prof")!=string::npos) {
				      Value* cntID = GEP->getOperand(2);
				      id = getConstant(cntID);
			      }
				  }
				}
			}
		}
 	  return id;
 	}
 	
 	set<BasicBlock*> getLoopExclusiveBBs(Loop* lp)
 	{
 	  set<BasicBlock*> BBs;
 	  for(auto bb: lp->getBlocks())
 	    BBs.insert(bb);
 	    
    for(auto subloop: lp->getSubLoops())
      for(auto bb:subloop->getBlocks())
        BBs.erase(bb);
    
    return BBs;
 	}
 	
 	profileInfo readProfileInfo(string fileName, string funcName)
 	{
 	  profileInfo pi;
 	  pi.functionName = funcName;
 	  ifstream fs(fileName);
 	  if(fs.fail()) {pi.numCounters = -1; return pi; }
 	  string line;
 	  while(getline(fs, line))
 	  {
 	    if(line.find(funcName)!=string::npos)
 	    {
 	      string line1, numCounters, counters;
 	      getline(fs, line1);
 	      getline(fs, line1);
 	      numCounters = line1.substr(line1.find(": ")+2);
 	      //getline(fs, numCounters);
 	      pi.numCounters = stoi(numCounters);
 	      pi.counters = (ll*) malloc (sizeof(ll)*pi.numCounters);
 	      getline(fs, line1, '[');
 	      getline(fs, line1, ']');
 	      int s = 0;
 	      for(int i=0;i<pi.numCounters;i++)
 	      {
 	        int n = line1.find(", ", s);
 	        counters = line1.substr(s, n-s);
 	        s+=n-s+2;
 	        pi.counters[i] = stoll(counters);
 	      }
 	    }
 	  }
 	  return pi;
 	}

  int getNumCountersInLoop(Loop* lp)
	{
	  int res = 0;
	  for(auto bb: lp->getBlocks())
	    if(getCounterID(bb)!=-1) res++;
	    
    return res;
	}
	
	int countCritEdges(Loop* lp)
	{
	  int res = 0;
	  for(auto bb: lp->getBlocks())
	  {
	    if(distance(succ_begin(bb), succ_end(bb))==1) continue;
	    for (BasicBlock *succ : successors(bb)) {
        if((++pred_begin(succ))!=pred_end(succ)) {
          res++;
        }
      }
	  }
    return res;
	}
	
	int countPHI(Loop* lp)
	{
	  int res = 0;
	  for(auto bb: lp->getBlocks())
	  {
	    for(auto it = bb->begin();it!=bb->end();it++)
	    {
	      if(isa<PHINode>(it)) res++;
	    }
	  }
    return res;
	}
	
	int countCallInst(Loop* lp)
	{
	  int res = 0;
	  for(auto bb: lp->getBlocks())
	  {
	    for(auto it = bb->begin();it!=bb->end();it++)
	    {
	      if(isa<CallInst>(it)) res++;
	    }
	  }
    return res;
	}
	
	
	bool hasVectorInsts(Loop* lp)
	{
	  bool res = 0;
	  for(auto bb: lp->getBlocks())
	  {
	    for(auto it = bb->begin();it!=bb->end();it++)
	    {
	      if(isa<ExtractElementInst>(it) || isa<ShuffleVectorInst>(it) || isa<InsertElementInst>(it) ) 
	        return 1;
	    }
	  }
    return res;
	
	}
	
	void binStat(Loop* lp, int& intInsts, int& fpInsts, Type** dataTy)
	{
	  map<Type*, int> mp;
	  auto bbs = lp->getBlocks();
		for(auto bb: bbs)
			for(auto it = bb->begin();it!=bb->end();it++)
			{
				if(isa<BinaryOperator>(it)) {
          Type* ty = (*it).getOperand(0)->getType();
          if(ty->isFloatingPointTy()) fpInsts++;
          else intInsts++;
          mp[ty]++;
        }      
			}
		int lmax = 0;
		for(auto pr:mp)
		{
		  if(pr.second>lmax) {
		    *dataTy = pr.first;
		    lmax = pr.second;
	    }
		}
	  return;
	  
	}
	
	
	ll analyseLoop(Loop* lp, raw_fd_ostream& fd, int funcSize, string funcName, string loopID)
	{
	  ll sumInsts = 0;
	  ll res = 0;
	  int sub = 0;
    for(auto sublp: lp->getSubLoops()) {
	    sub++;
	    sumInsts += analyseLoop(sublp, fd, funcSize, funcName, loopID+to_string(sub));	
	  }
	  int depth = lp->getLoopDepth();
	  int numBB = lp->getNumBlocks();
	  fd<<"loop ID = "<<funcName<<"_D"<<depth<<"N"<<loopID<<"\n";
	  DP("loop ID generated\n");
	  
    set<BasicBlock*> ebbs = getLoopExclusiveBBs(lp);
	  int einst = 0;
	  for(auto bb:ebbs)
	    einst+=bb->size();
    
	    
    set<int> cnts;
    if(checkCounter) {
	    SmallVector<BasicBlock*, 8> latches;
	    lp->getLoopLatches(latches);
      BasicBlock* latch = *latches.begin();
      
      int latchCnt = getCounterID(latch);
      
      if(latchCnt!=-1)
        cnts.insert(latchCnt);
      else {
        for(BasicBlock* bb: ebbs) {
          int cntID = getCounterID(bb);
          if(cntID!=-1) cnts.insert(cntID);
        }
      }
      if(cnts.size()==0) cout<<"error\n";
      
      DP("found counters\n");
    }
    //int numCounters = getNumCountersInLoop(lp);
    int numInsts = numInst(lp);
     
    int allocInsts = 0, loadInsts = 0, storeInsts = 0, arithInsts = 0, vecArithInsts = 0, GEPInsts = 0;
    int uncBr = 0, cBr = 0, undirect = 0;
    int intInsts = 0, fpInsts = 0;
    Type* dataTy = nullptr;
    
    
    if(!checkCounter) {
      instStat(lp, allocInsts, storeInsts, loadInsts, arithInsts, vecArithInsts, GEPInsts);
      binStat(lp, intInsts, fpInsts, &dataTy);
      brStat(lp, uncBr, cBr, undirect);
      DP("statistic done\n");
	    BasicBlock *Exiting = lp->getExitingBlock();
      int tripCnt = SE->getSmallConstantTripCount(lp, Exiting);
      
      DP("printing .");
	    fd<<"loop at depth = "<<depth<<"\nbasic blocks = "<< numBB<<"\ninst = "<< numInsts <<"\ncoverage wrt function = "<<numInsts*100/funcSize<<"%\n";
	    
	    fd<<"load = "<<loadInsts<<"\n";
	    fd<<"store = "<<storeInsts<<"\n";
	    fd<<"load/store ratio = "<<RATIO(loadInsts, storeInsts)<<"\n";
	    fd<<"memory allocation = "<<allocInsts<<"\n";
	    fd<<"GEP instructions = "<<GEPInsts<<"\n";
	    
      DP(".");
	    
	    int allMem = loadInsts+storeInsts+allocInsts+GEPInsts;
	    fd<<"all memory instructions = "<<allMem<<"\n";
	    fd<<"all memory instructions (%) = "<<PERC(allMem, numInsts)<<"%\n";
	    fd<<"binary instructions = "<<arithInsts<<"\n";
	    fd<<"binary instructions (%) = "<<PERC(arithInsts, numInsts)<<"%\n";
	    fd<<"integer = "<<intInsts<<"\n";
	    fd<<"floating point = "<<fpInsts<<"\n";
	    fd<<"int/fp ratio = "<<RATIO(intInsts, fpInsts)<<"\n";
	    fd<<"most common data type = ";
	    if(dataTy==nullptr) fd<<" unknown";
	    else dataTy->print(fd);
	    fd<<"\n";
	    
      DP(".");
	    
	    fd<<"contain vector instructions = "<<(hasVectorInsts(lp) || vecArithInsts>0)<<"\n";
	    fd<<"%vector instructions = "<< PERC(vecArithInsts, arithInsts) <<"%\n";
      fd<<"trip count = "<<(tripCnt==0?-1:tripCnt)<<"\n";
      
      //fd<<"cross-iteration dependency detected = "<<(primaryDepCheck(lp)?1:0)<<"\n";
		  
		  fd<<"exlusive basic blocks = "<<ebbs.size()<<"\nexlusive inst = "<<einst<<"\n";
		  fd<<"exlusive ratio = "<<PERC(einst, numInsts)<<"%\n";
		  fd<<"critical edges = "<< countCritEdges(lp)<<"\n";
		  fd<<"unconditonal branch = "<<uncBr<<"\nconditional branch = "<<cBr<<"\nundirect branch = "<<undirect<<"\n";
		  fd<<"PHI node = "<<countPHI(lp)<<"\n";
		  fd<<"function call = "<<countCallInst(lp)<<"\n";
		  
      DP(".");
	    
		  /*int* bbr = basicBlockRange(lp);
		  fd<<"#basic block with <"<<BBSI <<" insts = "<<bbr[0]<<"\n";
		  fd<<"#basic block with "<< BBSI <<"-"<<BBSI*2 <<" insts = "<<bbr[1]<<"\n";
		  fd<<"#basic block with >"<< BBSI*2 <<" insts = "<<bbr[2]<<"\n";
		  fd<<"\n\n";*/
      DP(". done\n\n");
		}
		
    else {
      if(hotpathFileName=="") {
        fd<<"counters used by this loop: ";
        for(int c: cnts)
          fd<<c<<" ";
        fd<<"\n";
      }
      else {
        profileInfo pi = readProfileInfo(hotpathFileName, funcName);
        if (pi.numCounters!=-1) {
          ll sumCounter = 0;
          for(int c: cnts) sumCounter += pi.counters[c];
          fd<<"loop execution count = "<<sumCounter<<" times\n";
          fd<<"number of instructions executed here (excluding subloops) = "<<einst*sumCounter<<"\n";
          res = einst*sumCounter + sumInsts;
          fd<<"number of instructions executed here = "<<res<<"\n";
        }
      }
    }
    fd<<"\n\n";
    
	  
    
    return res;		
	}
	

	
	
  bool runOnFunction(Function &F) override {
   	SE = &getAnalysis<ScalarEvolutionWrapperPass>().getSE();
		DI = &getAnalysis<DependenceAnalysisWrapperPass>().getDI();
		DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
		LI = &getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
		myassert(LI!=0 && "error loop info");
		if(F.isIntrinsic()) return false;
		//cout<<"function: "<<F.getName().str()<<endl;
    if(F.getName().str()=="__cxx_global_var_init" || F.getName().str().find("_GLOBAL__sub_I")!=string::npos)	return false;
    	
    raw_fd_ostream fd(fileName, EC, sys::fs::F_Append);
    myassert(EC.value()==0 && "error opening file");
    visit(F);
    
		int loopID = 1;
		if(!LI->empty()) {
      for (LoopInfo::iterator LIT = LI->begin(), LEND = LI->end(); LIT != LEND; ++LIT) {
			  analyseLoop(*LIT, fd, numInst(&F), F.getName().str(), to_string(loopID));
			  loopID++;
      }
    }
    
    if(0) {
      fd<<"function ID = "<<F.getName().str()<<"\n";
      log(MemoryOps::Alloca);
		  log(MemoryOps::Store);
		  log(MemoryOps::Load);
		  log(OtherOps::Call);
		  fd<<"#binary op = "<<instCnt[binOp]<<"\n";
		  fd<<"#floating point = "<<floatCnt<<"\n";
		  fd<<"#fp vector = "<<floatVecCnt<<"\n";
		  fd<<"#int = "<<intCnt<<"\n";
		  fd<<"#int vector = "<<intVecCnt<<"\n";
		  int* bbr = basicBlockRange(F);
		  fd<<"number of basic blocks = "<<F.getBasicBlockList().size()<<"\n";
		  fd<<"#basic block with <"<<BBSI <<" insts = "<<bbr[0]<<"\n";
		  fd<<"#basic block with "<< BBSI <<"-"<<BBSI*2 <<" insts = "<<bbr[1]<<"\n";
		  fd<<"#basic block with >"<< BBSI*2 <<" insts = "<<bbr[2]<<"\n";
		  fd<<"\n\n";
		}
    return false;
  }
};
char myPass::ID;


void addmyPass(const PassManagerBuilder &Builder, legacy::PassManagerBase &PM) {
  PM.add(new myPass());
}

/// Register the pass with the pass manager builder.  This instructs the
/// builder to call the `addSimplePass` function at the end of adding other
/// optimisations, so that we can insert the pass.  See the
/// `PassManagerBuilder` documentation for other extension points.
RegisterStandardPasses X(PassManagerBuilder::EP_EnabledOnOptLevel0,
                         addmyPass);
} // anonymous namespace


