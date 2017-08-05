; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* nocapture %sum) local_unnamed_addr #0 {
entry:
  %cmp48 = icmp sgt i32 %nr, 0
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %wide.trip.count = zext i32 %np to i64
  %wide.trip.count65 = zext i32 %np to i64
  %wide.trip.count72 = zext i32 %nq to i64
  %wide.trip.count76 = zext i32 %nr to i64
  %scevgep82 = getelementptr double, double* %sum, i64 %wide.trip.count65
  %0 = add nsw i64 %wide.trip.count, -1
  %cmp214.not = icmp slt i32 %nq, 1
  %cmp57.not = icmp slt i32 %np, 1
  %brmerge = or i1 %cmp214.not, %cmp57.not
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %1 = icmp eq i32 %np, 1
  %sunkaddr92 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %min.iters.check = icmp ult i32 %np, 4
  %2 = and i32 %np, 3
  %n.mod.vf = zext i32 %2 to i64
  %n.vec = sub nsw i64 %wide.trip.count65, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %2, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv74 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next75, %for.inc42 ]
  br i1 %brmerge, label %for.inc42, label %for.body6.us.us.preheader.preheader

for.body6.us.us.preheader.preheader:              ; preds = %for.cond1.preheader
  br label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.preheader.preheader, %for.inc39.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %for.inc39.us ], [ 0, %for.body6.us.us.preheader.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 0
  %scevgep79 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %wide.trip.count65
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.inc36.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.inc36.us.prol.loopexit, %middle.block
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %for.inc42.loopexit, label %for.body6.us.us.preheader

for.inc36.us:                                     ; preds = %for.inc36.us, %for.inc36.us.preheader86.new
  %indvars.iv63 = phi i64 [ %indvars.iv63.unr, %for.inc36.us.preheader86.new ], [ %indvars.iv.next64.3, %for.inc36.us ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv63
  %3 = bitcast double* %arrayidx29.us to i64*
  %4 = load i64, i64* %3, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %indvars.iv63
  %5 = bitcast double* %arrayidx35.us to i64*
  store i64 %4, i64* %5, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next64
  %6 = bitcast double* %arrayidx29.us.1 to i64*
  %7 = load i64, i64* %6, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %indvars.iv.next64
  %8 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %7, i64* %8, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next64.1
  %9 = bitcast double* %arrayidx29.us.2 to i64*
  %10 = load i64, i64* %9, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %indvars.iv.next64.1
  %11 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %10, i64* %11, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next64.2
  %12 = bitcast double* %arrayidx29.us.3 to i64*
  %13 = load i64, i64* %12, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %indvars.iv.next64.2
  %14 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %13, i64* %14, align 8
  %indvars.iv.next64.3 = add nsw i64 %indvars.iv63, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next64.3, %wide.trip.count65
  br i1 %exitcond66.3, label %for.inc39.us.loopexit, label %for.inc36.us, !llvm.loop !1

for.body6.us.us:                                  ; preds = %for.cond7.for.inc22_crit_edge.us.us, %for.body6.us.us.preheader
  %indvars.iv58 = phi i64 [ 0, %for.body6.us.us.preheader ], [ %indvars.iv.next59, %for.cond7.for.inc22_crit_edge.us.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv58
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body6.us.us
  %15 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv58
  %16 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %15, %16
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr89 = mul i64 %indvars.iv58, 8
  %sunkaddr90 = add i64 %sunkaddr, %sunkaddr89
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to double*
  store double %add.us.us.prol, double* %sunkaddr91, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.body6.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  %.unr.ph = phi double [ %add.us.us.prol, %for.inc.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  br i1 %1, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body6.us.us.new

for.body6.us.us.new:                              ; preds = %for.inc.us.us.prol.loopexit
  %sunkaddr93 = mul i64 %indvars.iv58, 8
  %sunkaddr94 = add i64 %sunkaddr92, %sunkaddr93
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  br label %for.inc.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next.lcssa = phi i64 [ 1, %for.inc.us.us.prol.loopexit ], [ %indvars.iv.next.1, %for.cond7.for.inc22_crit_edge.us.us.loopexit ]
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %indvars.iv.next.lcssa
  br i1 %exitcond61, label %for.inc36.us.preheader, label %for.body6.us.us

for.inc36.us.preheader:                           ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %min.iters.check, label %for.inc36.us.preheader86, label %min.iters.checked

for.inc36.us.preheader86:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc36.us.preheader
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.inc36.us.preheader ], [ %n.vec, %middle.block ]
  %17 = sub nsw i64 %wide.trip.count, %indvars.iv63.ph
  %18 = sub nsw i64 %0, %indvars.iv63.ph
  %xtraiter87 = and i64 %17, 3
  %lcmp.mod88 = icmp eq i64 %xtraiter87, 0
  br i1 %lcmp.mod88, label %for.inc36.us.prol.loopexit, label %for.inc36.us.prol.preheader

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.us.preheader86
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol, %for.inc36.us.prol.preheader
  %indvars.iv63.prol = phi i64 [ %indvars.iv.next64.prol, %for.inc36.us.prol ], [ %indvars.iv63.ph, %for.inc36.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc36.us.prol ], [ %xtraiter87, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv63.prol
  %19 = bitcast double* %arrayidx29.us.prol to i64*
  %20 = load i64, i64* %19, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %indvars.iv63.prol
  %21 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %20, i64* %21, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc36.us.prol.loopexit.loopexit, label %for.inc36.us.prol, !llvm.loop !4

for.inc36.us.prol.loopexit.loopexit:              ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.us.prol.loopexit.loopexit, %for.inc36.us.preheader86
  %indvars.iv63.unr = phi i64 [ %indvars.iv63.ph, %for.inc36.us.preheader86 ], [ %indvars.iv.next64.prol, %for.inc36.us.prol.loopexit.loopexit ]
  %22 = icmp ult i64 %18, 3
  br i1 %22, label %for.inc39.us, label %for.inc36.us.preheader86.new

for.inc36.us.preheader86.new:                     ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

min.iters.checked:                                ; preds = %for.inc36.us.preheader
  br i1 %cmp.zero, label %for.inc36.us.preheader86, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep82
  %bound1 = icmp ugt double* %scevgep79, %sum
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc36.us.preheader86, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %23 = getelementptr inbounds double, double* %sum, i64 %index
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %24, align 8, !alias.scope !6
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x i64>*
  %wide.load85 = load <2 x i64>, <2 x i64>* %26, align 8, !alias.scope !6
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %index
  %28 = bitcast double* %27 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %28, align 8, !alias.scope !9, !noalias !6
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  store <2 x i64> %wide.load85, <2 x i64>* %30, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %31 = icmp eq i64 %index.next, %n.vec
  br i1 %31, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc39.us, label %for.inc36.us.preheader86

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body6.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.us.us.new ], [ %indvars.iv.next.1, %for.inc.us.us ]
  %32 = phi double [ %.unr.ph, %for.body6.us.us.new ], [ %add.us.us.1, %for.inc.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %indvars.iv
  %33 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv, i64 %indvars.iv58
  %34 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %33, %34
  %add.us.us = fadd double %mul.us.us, %32
  store double %add.us.us, double* %sunkaddr95, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv74, i64 %indvars.iv70, i64 %indvars.iv.next
  %35 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next, i64 %indvars.iv58
  %36 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %35, %36
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %sunkaddr95, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.inc.us.us

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count76
  br i1 %exitcond77, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc15_crit_edge.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.cond1.for.inc15_crit_edge.us ], [ 0, %entry ]
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 150
  br i1 %exitcond69, label %for.cond22.preheader.us.preheader, label %for.cond1.preheader.us

for.cond22.preheader.us.preheader:                ; preds = %for.cond1.for.inc15_crit_edge.us
  br label %for.cond22.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond1.preheader.us, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv61, %indvars.iv66
  br label %for.inc.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next62, 140
  br i1 %exitcond65, label %for.cond1.for.inc15_crit_edge.us, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv56 = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next57.1, %for.inc.us.us ]
  %1 = add nuw nsw i64 %0, %indvars.iv56
  %2 = trunc i64 %1 to i32
  %rem.us.us = srem i32 %2, 160
  %conv.us.us = sitofp i32 %rem.us.us to double
  %div.us.us = fdiv double %conv.us.us, 1.600000e+02
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv66, i64 %indvars.iv61, i64 %indvars.iv56
  store double %div.us.us, double* %arrayidx11.us.us, align 8
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %3 = add nuw nsw i64 %0, %indvars.iv.next57
  %4 = trunc i64 %3 to i32
  %rem.us.us.1 = srem i32 %4, 160
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.1 = fdiv double %conv.us.us.1, 1.600000e+02
  %arrayidx11.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv66, i64 %indvars.iv61, i64 %indvars.iv.next57
  store double %div.us.us.1, double* %arrayidx11.us.us.1, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next57.1, 160
  br i1 %exitcond60.1, label %for.cond4.for.inc12_crit_edge.us.us, label %for.inc.us.us

for.cond22.preheader.us:                          ; preds = %for.cond22.preheader.us.preheader, %for.cond22.for.inc38_crit_edge.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond22.for.inc38_crit_edge.us ], [ 0, %for.cond22.preheader.us.preheader ]
  br label %for.inc35.us

for.inc35.us:                                     ; preds = %for.inc35.us, %for.cond22.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader.us ], [ %indvars.iv.next.1, %for.inc35.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv51
  %6 = trunc i64 %5 to i32
  %rem27.us = srem i32 %6, 160
  %conv28.us = sitofp i32 %rem27.us to double
  %div30.us = fdiv double %conv28.us, 1.600000e+02
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv51, i64 %indvars.iv
  store double %div30.us, double* %arrayidx34.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv51
  %8 = trunc i64 %7 to i32
  %rem27.us.1 = srem i32 %8, 160
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.1 = fdiv double %conv28.us.1, 1.600000e+02
  %arrayidx34.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv51, i64 %indvars.iv.next
  store double %div30.us.1, double* %arrayidx34.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us, label %for.inc35.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.inc35.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, 160
  br i1 %exitcond54, label %for.end40, label %for.cond22.preheader.us

for.end40:                                        ; preds = %for.cond22.for.inc38_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc21_crit_edge.us, %entry
  %indvars.iv52 = phi i64 [ 0, %entry ], [ %indvars.iv.next53, %for.cond2.for.inc21_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv52, 140
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next53, 150
  br i1 %exitcond56, label %for.end23, label %for.cond2.preheader.us

for.cond5.preheader.us.us:                        ; preds = %for.cond2.preheader.us, %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond2.preheader.us ]
  %mul83.us.us = add i64 %indvars.iv48, %3
  %add.us.us = mul i64 %mul83.us.us, 160
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 140
  br i1 %exitcond51, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %for.inc.us.us ]
  %4 = add i64 %add.us.us, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us.us = srem i32 %5, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %for.body7.us.us, %if.then.us.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv52, i64 %indvars.iv48, i64 %indvars.iv
  %8 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23:                                        ; preds = %for.cond2.for.inc21_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !2, !3}
