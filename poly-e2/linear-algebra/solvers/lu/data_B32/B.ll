; ModuleID = 'A.ll'
source_filename = "lu.c"
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

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %cmp72 = icmp sgt i32 %n, 0
  br i1 %cmp72, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %call143 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %n, -2
  %1 = zext i32 %0 to i64
  %2 = sext i32 %n to i64
  %wide.trip.count139 = zext i32 %n to i64
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %for.cond1.preheader.lr.ph
  %indvars.iv137 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next138, %for.inc23 ]
  %indvars.iv135 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next136, %for.inc23 ]
  %3 = sub i64 %1, %indvars.iv137
  %4 = shl i64 %3, 3
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %cmp970 = icmp slt i64 %indvars.iv.next138, %2
  br i1 %cmp970, label %for.inc23.loopexit, label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv119 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next120, %for.inc ]
  %5 = sub nsw i64 0, %indvars.iv119
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv137, i64 %indvars.iv119
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next120, %indvars.iv135
  br i1 %exitcond125, label %for.cond8.preheader, label %for.inc

for.inc23.loopexit:                               ; preds = %for.cond8.preheader
  %7 = and i64 %4, 34359738360
  %8 = add nuw nsw i64 %indvars.iv137, 1
  %9 = add nuw nsw i64 %7, 8
  %scevgep132 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %8
  %10 = mul nuw nsw i64 %indvars.iv137, 2000
  %scevgep133 = getelementptr double, double* %scevgep132, i64 %10
  %scevgep133134 = bitcast double* %scevgep133 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep133134, i8 0, i64 %9, i32 8, i1 false)
  br label %for.inc23

for.inc23:                                        ; preds = %for.cond8.preheader, %for.inc23.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  br i1 %exitcond140, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %11 = icmp sgt i32 %n, 0
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br i1 %11, label %for.cond30.preheader.us.preheader, label %for.end99

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %12 = add i32 %n, -1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 3
  %15 = add nuw nsw i64 %14, 8
  %16 = zext i32 %n to i64
  %17 = add nsw i64 %16, -1
  %xtraiter196 = and i64 %wide.trip.count139, 7
  %lcmp.mod197 = icmp eq i64 %xtraiter196, 0
  br i1 %lcmp.mod197, label %for.inc41.us.prol.loopexit, label %for.inc41.us.prol.preheader

for.inc41.us.prol.preheader:                      ; preds = %for.cond30.preheader.us.preheader
  br label %for.inc41.us.prol

for.inc41.us.prol:                                ; preds = %for.inc41.us.prol, %for.inc41.us.prol.preheader
  %indvars.iv115.prol = phi i64 [ 0, %for.inc41.us.prol.preheader ], [ %indvars.iv.next116.prol, %for.inc41.us.prol ]
  %prol.iter198 = phi i64 [ %xtraiter196, %for.inc41.us.prol.preheader ], [ %prol.iter198.sub, %for.inc41.us.prol ]
  %18 = mul nuw nsw i64 %indvars.iv115.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next116.prol = add nuw nsw i64 %indvars.iv115.prol, 1
  %prol.iter198.sub = add nsw i64 %prol.iter198, -1
  %prol.iter198.cmp = icmp eq i64 %prol.iter198.sub, 0
  br i1 %prol.iter198.cmp, label %for.inc41.us.prol.loopexit.unr-lcssa, label %for.inc41.us.prol, !llvm.loop !1

for.inc41.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc41.us.prol
  br label %for.inc41.us.prol.loopexit

for.inc41.us.prol.loopexit:                       ; preds = %for.cond30.preheader.us.preheader, %for.inc41.us.prol.loopexit.unr-lcssa
  %indvars.iv115.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %xtraiter196, %for.inc41.us.prol.loopexit.unr-lcssa ]
  %19 = icmp ult i64 %17, 7
  br i1 %19, label %for.cond44.preheader, label %for.cond30.preheader.us.preheader.new

for.cond30.preheader.us.preheader.new:            ; preds = %for.inc41.us.prol.loopexit
  br label %for.inc41.us

for.inc41.us:                                     ; preds = %for.inc41.us, %for.cond30.preheader.us.preheader.new
  %indvars.iv115 = phi i64 [ %indvars.iv115.unr, %for.cond30.preheader.us.preheader.new ], [ %indvars.iv.next116.7, %for.inc41.us ]
  %20 = mul nuw nsw i64 %indvars.iv115, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %15, i32 8, i1 false)
  %21 = mul i64 %indvars.iv115, 16000
  %22 = add i64 %21, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %15, i32 8, i1 false)
  %23 = mul i64 %indvars.iv115, 16000
  %24 = add i64 %23, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %15, i32 8, i1 false)
  %25 = mul i64 %indvars.iv115, 16000
  %26 = add i64 %25, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %15, i32 8, i1 false)
  %27 = mul i64 %indvars.iv115, 16000
  %28 = add i64 %27, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %15, i32 8, i1 false)
  %29 = mul i64 %indvars.iv115, 16000
  %30 = add i64 %29, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %15, i32 8, i1 false)
  %31 = mul i64 %indvars.iv115, 16000
  %32 = add i64 %31, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %15, i32 8, i1 false)
  %indvars.iv.next116.6 = add nsw i64 %indvars.iv115, 7
  %33 = mul nuw nsw i64 %indvars.iv.next116.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %15, i32 8, i1 false)
  %exitcond142.7 = icmp eq i64 %indvars.iv.next116.6, %17
  %indvars.iv.next116.7 = add nsw i64 %indvars.iv115, 8
  br i1 %exitcond142.7, label %for.cond44.preheader.unr-lcssa, label %for.inc41.us

for.cond44.preheader.unr-lcssa:                   ; preds = %for.inc41.us
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.inc41.us.prol.loopexit, %for.cond44.preheader.unr-lcssa
  %34 = icmp sgt i32 %n, 0
  br i1 %34, label %for.cond48.preheader.lr.ph, label %for.end99

for.cond48.preheader.lr.ph:                       ; preds = %for.cond44.preheader
  %35 = zext i32 %n to i64
  %36 = add nsw i64 %35, -1
  %wide.trip.count105 = zext i32 %n to i64
  %wide.trip.count109 = zext i32 %n to i64
  %37 = shl nuw nsw i64 %wide.trip.count139, 3
  %38 = add nsw i64 %wide.trip.count139, -1
  %min.iters.check = icmp ult i32 %n, 4
  %39 = bitcast i8* %call to [2000 x [2000 x double]]*
  %40 = bitcast i8* %call to [2000 x [2000 x double]]*
  %41 = bitcast i8* %call to [2000 x [2000 x double]]*
  %42 = and i32 %n, 3
  %n.mod.vf = zext i32 %42 to i64
  %n.vec = sub nsw i64 %wide.trip.count139, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n = icmp eq i32 %42, 0
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph
  %indvars.iv107 = phi i64 [ 0, %for.cond48.preheader.lr.ph ], [ %indvars.iv.next108, %for.inc75.us ]
  %scevgep153 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv107
  %scevgep153154 = bitcast double* %scevgep153 to i8*
  %44 = add nsw i64 %indvars.iv107, -1999
  %scevgep155 = getelementptr [2000 x double], [2000 x double]* %A, i64 %wide.trip.count139, i64 %44
  %scevgep155156 = bitcast double* %scevgep155 to i8*
  br label %for.cond52.preheader.us.us

for.inc75.us:                                     ; preds = %for.inc72.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, %wide.trip.count109
  br i1 %exitcond110, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.inc72.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv103 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next104, %for.inc72.us.us ]
  %45 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep151 = getelementptr i8, i8* %call, i64 %45
  %46 = add i64 %37, %45
  %scevgep152 = getelementptr i8, i8* %call, i64 %46
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv107
  br i1 %min.iters.check, label %for.inc69.us.us.preheader, label %min.iters.checked

for.inc69.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond52.preheader.us.us
  %indvars.iv99.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond52.preheader.us.us ], [ %n.vec, %middle.block ]
  %47 = sub nsw i64 %wide.trip.count139, %indvars.iv99.ph
  %xtraiter194 = and i64 %47, 1
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  br i1 %lcmp.mod195, label %for.inc69.us.us.prol.loopexit.unr-lcssa, label %for.inc69.us.us.prol.preheader

for.inc69.us.us.prol.preheader:                   ; preds = %for.inc69.us.us.preheader
  br label %for.inc69.us.us.prol

for.inc69.us.us.prol:                             ; preds = %for.inc69.us.us.prol.preheader
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99.ph, i64 %indvars.iv107
  %49 = load double, double* %arrayidx63.us.us.prol, align 8
  %mul.us.us.prol = fmul double %48, %49
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv103, i64 %indvars.iv99.ph
  %50 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %50, %mul.us.us.prol
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  %indvars.iv.next100.prol = add nuw nsw i64 %indvars.iv99.ph, 1
  br label %for.inc69.us.us.prol.loopexit.unr-lcssa

for.inc69.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.inc69.us.us.preheader, %for.inc69.us.us.prol
  %indvars.iv99.unr.ph = phi i64 [ %indvars.iv.next100.prol, %for.inc69.us.us.prol ], [ %indvars.iv99.ph, %for.inc69.us.us.preheader ]
  br label %for.inc69.us.us.prol.loopexit

for.inc69.us.us.prol.loopexit:                    ; preds = %for.inc69.us.us.prol.loopexit.unr-lcssa
  %51 = icmp eq i64 %38, %indvars.iv99.ph
  br i1 %51, label %for.inc72.us.us.loopexit, label %for.inc69.us.us.preheader.new

for.inc69.us.us.preheader.new:                    ; preds = %for.inc69.us.us.prol.loopexit
  br label %for.inc69.us.us

min.iters.checked:                                ; preds = %for.cond52.preheader.us.us
  br i1 %cmp.zero, label %for.inc69.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep151, %scevgep155156
  %bound1 = icmp ult i8* %scevgep153154, %scevgep152
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bc157 = bitcast double* %arrayidx59.us.us to i8*
  %bound0158 = icmp ult i8* %scevgep151, %bc157
  %bound1159 = icmp ult i8* %bc, %scevgep152
  %found.conflict160 = and i1 %bound0158, %bound1159
  %conflict.rdx = or i1 %found.conflict, %found.conflict160
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %52 = or i64 %index, 1
  %53 = or i64 %index, 2
  %54 = or i64 %index, 3
  %55 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = insertelement <2 x double> undef, double %55, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv107
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %52, i64 %indvars.iv107
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %53, i64 %indvars.iv107
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %54, i64 %indvars.iv107
  %64 = load double, double* %60, align 8, !alias.scope !6
  %65 = load double, double* %61, align 8, !alias.scope !6
  %66 = load double, double* %62, align 8, !alias.scope !6
  %67 = load double, double* %63, align 8, !alias.scope !6
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = fmul <2 x double> %57, %69
  %73 = fmul <2 x double> %59, %71
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv103, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !8, !noalias !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !8, !noalias !10
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load162, %73
  %80 = bitcast double* %74 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !8, !noalias !10
  %81 = bitcast double* %76 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, %n.vec
  br i1 %82, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc72.us.us, label %for.inc69.us.us.preheader

for.inc72.us.us.loopexit.unr-lcssa:               ; preds = %for.inc69.us.us
  br label %for.inc72.us.us.loopexit

for.inc72.us.us.loopexit:                         ; preds = %for.inc69.us.us.prol.loopexit, %for.inc72.us.us.loopexit.unr-lcssa
  br label %for.inc72.us.us

for.inc72.us.us:                                  ; preds = %for.inc72.us.us.loopexit, %middle.block
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, %wide.trip.count105
  br i1 %exitcond106, label %for.inc75.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader.new
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr.ph, %for.inc69.us.us.preheader.new ], [ %indvars.iv.next100.1, %for.inc69.us.us ]
  %83 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv107
  %84 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %83, %84
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv103, i64 %indvars.iv99
  %85 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %85, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %86 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next100, i64 %indvars.iv107
  %87 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %86, %87
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next100
  %88 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %88, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next100, %36
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  br i1 %exitcond.1, label %for.inc72.us.us.loopexit.unr-lcssa, label %for.inc69.us.us, !llvm.loop !14

for.cond78.preheader:                             ; preds = %for.inc75.us
  %89 = icmp sgt i32 %n, 0
  br i1 %89, label %for.cond82.preheader.us.preheader, label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %90 = zext i32 %n to i64
  %91 = add nsw i64 %90, -1
  %wide.trip.count97 = zext i32 %n to i64
  %92 = shl nuw nsw i64 %wide.trip.count139, 3
  %93 = add nsw i64 %wide.trip.count139, -1
  %min.iters.check166 = icmp ult i32 %n, 4
  %94 = bitcast i8* %call to [2000 x [2000 x double]]*
  %95 = bitcast i8* %call to [2000 x [2000 x double]]*
  %96 = bitcast i8* %call to [2000 x [2000 x double]]*
  %97 = bitcast i8* %call to [2000 x [2000 x double]]*
  %98 = bitcast i8* %call to [2000 x [2000 x double]]*
  %99 = and i32 %n, 3
  %n.mod.vf168 = zext i32 %99 to i64
  %n.vec169 = sub nsw i64 %wide.trip.count139, %n.mod.vf168
  %cmp.zero170 = icmp eq i64 %n.vec169, 0
  %100 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n187 = icmp eq i32 %99, 0
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.inc97.us, %for.cond82.preheader.us.preheader
  %indvars.iv95 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next96, %for.inc97.us ]
  %scevgep172 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 0
  %scevgep172173 = bitcast double* %scevgep172 to i8*
  %scevgep174 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %wide.trip.count139
  %scevgep174175 = bitcast double* %scevgep174 to i8*
  %101 = mul nuw nsw i64 %indvars.iv95, 16000
  %scevgep176 = getelementptr i8, i8* %call, i64 %101
  %102 = add i64 %92, %101
  %scevgep177 = getelementptr i8, i8* %call, i64 %102
  br i1 %min.iters.check166, label %for.inc94.us.preheader, label %min.iters.checked167

min.iters.checked167:                             ; preds = %for.cond82.preheader.us
  br i1 %cmp.zero170, label %for.inc94.us.preheader, label %vector.memcheck182

vector.memcheck182:                               ; preds = %min.iters.checked167
  %bound0178 = icmp ult i8* %scevgep172173, %scevgep177
  %bound1179 = icmp ult i8* %scevgep176, %scevgep174175
  %memcheck.conflict181 = and i1 %bound0178, %bound1179
  br i1 %memcheck.conflict181, label %for.inc94.us.preheader, label %vector.body163.preheader

vector.body163.preheader:                         ; preds = %vector.memcheck182
  br label %vector.body163

vector.body163:                                   ; preds = %vector.body163.preheader, %vector.body163
  %index184 = phi i64 [ %index.next185, %vector.body163 ], [ 0, %vector.body163.preheader ]
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv95, i64 %index184
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !15
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load193 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !15
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %index184
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load192, <2 x i64>* %108, align 8, !alias.scope !18, !noalias !15
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load193, <2 x i64>* %110, align 8, !alias.scope !18, !noalias !15
  %index.next185 = add i64 %index184, 4
  %111 = icmp eq i64 %index.next185, %n.vec169
  br i1 %111, label %middle.block164, label %vector.body163, !llvm.loop !20

middle.block164:                                  ; preds = %vector.body163
  br i1 %cmp.n187, label %for.inc97.us, label %for.inc94.us.preheader

for.inc94.us.preheader:                           ; preds = %middle.block164, %vector.memcheck182, %min.iters.checked167, %for.cond82.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck182 ], [ 0, %min.iters.checked167 ], [ 0, %for.cond82.preheader.us ], [ %n.vec169, %middle.block164 ]
  %112 = sub nsw i64 %wide.trip.count139, %indvars.iv.ph
  %113 = sub nsw i64 %93, %indvars.iv.ph
  %xtraiter = and i64 %112, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc94.us.prol.loopexit, label %for.inc94.us.prol.preheader

for.inc94.us.prol.preheader:                      ; preds = %for.inc94.us.preheader
  br label %for.inc94.us.prol

for.inc94.us.prol:                                ; preds = %for.inc94.us.prol, %for.inc94.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc94.us.prol ], [ %indvars.iv.ph, %for.inc94.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc94.us.prol ], [ %xtraiter, %for.inc94.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %98, i64 0, i64 %indvars.iv95, i64 %indvars.iv.prol
  %114 = bitcast double* %arrayidx89.us.prol to i64*
  %115 = load i64, i64* %114, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.prol
  %116 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %115, i64* %116, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc94.us.prol.loopexit.unr-lcssa, label %for.inc94.us.prol, !llvm.loop !21

for.inc94.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc94.us.prol
  %117 = add nsw i64 %indvars.iv.ph, %xtraiter
  br label %for.inc94.us.prol.loopexit

for.inc94.us.prol.loopexit:                       ; preds = %for.inc94.us.preheader, %for.inc94.us.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc94.us.preheader ], [ %117, %for.inc94.us.prol.loopexit.unr-lcssa ]
  %118 = icmp ult i64 %113, 3
  br i1 %118, label %for.inc97.us.loopexit, label %for.inc94.us.preheader.new

for.inc94.us.preheader.new:                       ; preds = %for.inc94.us.prol.loopexit
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc94.us.preheader.new ], [ %indvars.iv.next.3, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %94, i64 0, i64 %indvars.iv95, i64 %indvars.iv
  %119 = bitcast double* %arrayidx89.us to i64*
  %120 = load i64, i64* %119, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv
  %121 = bitcast double* %arrayidx93.us to i64*
  store i64 %120, i64* %121, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %95, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next
  %122 = bitcast double* %arrayidx89.us.1 to i64*
  %123 = load i64, i64* %122, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next
  %124 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %123, i64* %124, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %96, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %125 = bitcast double* %arrayidx89.us.2 to i64*
  %126 = load i64, i64* %125, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next.1
  %127 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %126, i64* %127, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %97, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %128 = bitcast double* %arrayidx89.us.3 to i64*
  %129 = load i64, i64* %128, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv.next.2
  %130 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %129, i64* %130, align 8
  %exitcond141.3 = icmp eq i64 %indvars.iv.next.2, %91
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond141.3, label %for.inc97.us.loopexit.unr-lcssa, label %for.inc94.us, !llvm.loop !22

for.inc97.us.loopexit.unr-lcssa:                  ; preds = %for.inc94.us
  br label %for.inc97.us.loopexit

for.inc97.us.loopexit:                            ; preds = %for.inc94.us.prol.loopexit, %for.inc97.us.loopexit.unr-lcssa
  br label %for.inc97.us

for.inc97.us:                                     ; preds = %for.inc97.us.loopexit, %middle.block164
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  br i1 %exitcond98, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.inc97.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.end25.thread, %for.end25, %for.cond44.preheader, %for.cond78.preheader
  %call144146149 = phi i8* [ %call, %for.cond78.preheader ], [ %call, %for.cond44.preheader ], [ %call, %for.end25 ], [ %call143, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call144146149) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp39 = icmp sgt i32 %n, 0
  br i1 %cmp39, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count63 = zext i32 %n to i64
  %wide.trip.count67 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc54
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc54 ], [ 0, %for.cond1.preheader.preheader ]
  %cmp233 = icmp sgt i64 %indvars.iv65, 0
  br i1 %cmp233, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  %0 = icmp sgt i64 %indvars.iv65, 0
  br i1 %0, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter69 = and i64 %indvars.iv65, 1
  %lcmp.mod70 = icmp eq i64 %xtraiter69, 0
  %1 = icmp eq i64 %indvars.iv65, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.inc51.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.inc51.us ], [ %indvars.iv65, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv61
  %.pre43 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod70, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %2 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv61
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %.pre43, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr71.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre43, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %1, label %for.inc51.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next55.1, %for.inc48.us ]
  %4 = phi double [ %.unr71.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv54
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv61
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next55
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv61
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, %indvars.iv65
  br i1 %exitcond58.1, label %for.inc51.us.unr-lcssa, label %for.inc48.us

for.inc51.us.unr-lcssa:                           ; preds = %for.inc48.us
  br label %for.inc51.us

for.inc51.us:                                     ; preds = %for.inc48.us.prol.loopexit, %for.inc51.us.unr-lcssa
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp531 = icmp sgt i64 %indvars.iv47, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv47
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp531, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv47, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv47
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %11 = icmp eq i64 %indvars.iv47, 1
  br i1 %11, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %12 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv47
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv47
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv47
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %17 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv47
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next48, %indvars.iv65
  br i1 %exitcond52, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.inc51.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader, %for.cond31.preheader.lr.ph
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %for.end56.loopexit, label %for.cond1.preheader

for.end56.loopexit:                               ; preds = %for.inc54
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count17 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next15, %for.inc10.us ]
  %4 = mul nsw i64 %indvars.iv14, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, %wide.trip.count17
  br i1 %exitcond18, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
