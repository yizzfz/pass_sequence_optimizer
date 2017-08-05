; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_lu([2000 x double]* %arraydecay)
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
  tail call void @print_array([2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([2000 x double]* nocapture %A) #0 {
entry:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %entry
  %indvars.iv3 = phi i3 [ %indvars.iv.next4, %for.inc23 ], [ -1, %entry ]
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc23 ], [ 2, %entry ]
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %for.inc23 ], [ 0, %entry ]
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %for.inc23 ], [ 1, %entry ]
  %0 = zext i3 %indvars.iv3 to i64
  %1 = add nuw nsw i64 %0, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = add i64 %indvars.iv1, %2
  %4 = sub nuw nsw i64 2007, %indvars.iv136
  %5 = sub nsw i64 1998, %indvars.iv136
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %6 = trunc i64 %5 to i32
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %cmp971 = icmp slt i64 %indvars.iv.next137, 2000
  br i1 %cmp971, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %7 = trunc i64 %4 to i32
  %xtraiter161 = and i32 %7, 7
  %lcmp.mod162 = icmp eq i32 %xtraiter161, 0
  br i1 %lcmp.mod162, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol.preheader, %for.inc16.prol
  %indvars.iv130.prol = phi i64 [ %indvars.iv.next131.prol, %for.inc16.prol ], [ %indvars.iv134, %for.inc16.prol.preheader ]
  %prol.iter163 = phi i32 [ %prol.iter163.sub, %for.inc16.prol ], [ %xtraiter161, %for.inc16.prol.preheader ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv130.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next131.prol = add nuw nsw i64 %indvars.iv130.prol, 1
  %prol.iter163.sub = add nsw i32 %prol.iter163, -1
  %prol.iter163.cmp = icmp eq i32 %prol.iter163.sub, 0
  br i1 %prol.iter163.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv130.unr = phi i64 [ %indvars.iv134, %for.inc16.lr.ph ], [ %3, %for.inc16.prol.loopexit.loopexit ]
  %8 = icmp ult i32 %6, 7
  br i1 %8, label %for.inc23, label %for.inc16.preheader

for.inc16.preheader:                              ; preds = %for.inc16.prol.loopexit
  %9 = sub i64 1992, %indvars.iv130.unr
  %10 = lshr i64 %9, 3
  %11 = add nuw nsw i64 %10, 1
  %min.iters.check = icmp ult i64 %11, 2
  br i1 %min.iters.check, label %for.inc16.preheader5, label %min.iters.checked

for.inc16.preheader5:                             ; preds = %middle.block, %min.iters.checked, %for.inc16.preheader
  %indvars.iv130.ph = phi i64 [ %indvars.iv130.unr, %min.iters.checked ], [ %indvars.iv130.unr, %for.inc16.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc16

min.iters.checked:                                ; preds = %for.inc16.preheader
  %n.mod.vf = and i64 %11, 1
  %n.vec = sub nsw i64 %11, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %12 = add i64 %indvars.iv130.unr, 8
  %13 = shl nuw i64 %10, 3
  %14 = add i64 %12, %13
  %15 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %14, %15
  br i1 %cmp.zero, label %for.inc16.preheader5, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %16 = shl i64 %index, 3
  %offset.idx = add i64 %indvars.iv130.unr, %16
  %17 = add nsw i64 %offset.idx, 7
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %17
  %19 = getelementptr double, double* %18, i64 -7
  %20 = bitcast double* %19 to <16 x double>*
  store <16 x double> zeroinitializer, <16 x double>* %20, align 8
  %index.next = add i64 %index, 2
  %21 = icmp eq i64 %index.next, %n.vec
  br i1 %21, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc23, label %for.inc16.preheader5

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv121 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next122, %for.inc ]
  %22 = sub nsw i64 0, %indvars.iv121
  %23 = trunc i64 %22 to i32
  %rem = srem i32 %23, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv121
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next122, %indvars.iv134
  br i1 %exitcond127, label %for.cond8.preheader, label %for.inc

for.inc16:                                        ; preds = %for.inc16.preheader5, %for.inc16
  %indvars.iv130 = phi i64 [ %indvars.iv.next131.7, %for.inc16 ], [ %indvars.iv130.ph, %for.inc16.preheader5 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv130
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next131
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next131.1 = add nsw i64 %indvars.iv130, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next131.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next131.2 = add nsw i64 %indvars.iv130, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next131.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next131.3 = add nsw i64 %indvars.iv130, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next131.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next131.4 = add nsw i64 %indvars.iv130, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next131.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next131.5 = add nsw i64 %indvars.iv130, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next131.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next131.6 = add nsw i64 %indvars.iv130, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv.next131.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next131.7 = add nsw i64 %indvars.iv130, 8
  %exitcond133.7 = icmp eq i64 %indvars.iv.next131.7, 2000
  br i1 %exitcond133.7, label %for.inc23.loopexit, label %for.inc16, !llvm.loop !6

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %middle.block, %for.inc16.prol.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv136, i64 %indvars.iv136
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond164 = icmp eq i64 %indvars.iv.next137, 2000
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next4 = add i3 %indvars.iv3, -1
  br i1 %exitcond164, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %24 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.inc41_crit_edge.us.3

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond150, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.cond82.preheader.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv103 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next104, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv107
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.inc69.us.us
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond149 = icmp eq i64 %indvars.iv.next104, 2000
  br i1 %exitcond149, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.cond52.preheader.us.us, %for.inc69.us.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %for.inc69.us.us ], [ 0, %for.cond52.preheader.us.us ]
  %25 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv107
  %26 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %25, %26
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv103, i64 %indvars.iv99
  %27 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %27
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next100 = or i64 %indvars.iv99, 1
  %28 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next100, i64 %indvars.iv107
  %29 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %28, %29
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv103, i64 %indvars.iv.next100
  %30 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %30
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next100.1, 2000
  br i1 %exitcond102.1, label %for.cond52.for.inc72_crit_edge.us.us, label %for.inc69.us.us

for.cond82.preheader.us:                          ; preds = %for.cond82.preheader.us.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %for.cond82.for.inc97_crit_edge.us ], [ 0, %for.cond82.preheader.us.preheader ]
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.cond82.preheader.us, %for.inc94.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc94.us ], [ 0, %for.cond82.preheader.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv93, i64 %indvars.iv
  %31 = bitcast double* %arrayidx89.us to i64*
  %32 = load i64, i64* %31, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv
  %33 = bitcast double* %arrayidx93.us to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next
  %34 = bitcast double* %arrayidx89.us.1 to i64*
  %35 = load i64, i64* %34, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv.next
  %36 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %35, i64* %36, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %37 = bitcast double* %arrayidx89.us.2 to i64*
  %38 = load i64, i64* %37, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv.next.1
  %39 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %40 = bitcast double* %arrayidx89.us.3 to i64*
  %41 = load i64, i64* %40, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv.next.2
  %42 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %41, i64* %42, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us, label %for.inc94.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.inc94.us
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3, %for.end25
  %indvars.iv116 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next117.3.1, %for.cond30.for.inc41_crit_edge.us.3 ]
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv116, i64 0
  %scevgep154 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next117, i64 0
  %scevgep154.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1 = or i64 %indvars.iv116, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next117.1, i64 0
  %scevgep154.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2 = or i64 %indvars.iv116, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next117.2, i64 0
  %scevgep154.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %scevgep.16 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next117.3, i64 0
  %scevgep154.17 = bitcast double* %scevgep.16 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154.17, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.18 = or i64 %indvars.iv116, 5
  %scevgep.1.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next117.18, i64 0
  %scevgep154.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154.1.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1.1 = or i64 %indvars.iv116, 6
  %scevgep.2.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next117.1.1, i64 0
  %scevgep154.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154.2.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2.1 = or i64 %indvars.iv116, 7
  %scevgep.3.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv.next117.2.1, i64 0
  %scevgep154.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep154.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3.1 = add nsw i64 %indvars.iv116, 8
  %exitcond119.3.1 = icmp eq i64 %indvars.iv.next117.3.1, 2000
  br i1 %exitcond119.3.1, label %for.cond52.preheader.us.us.preheader.preheader, label %for.cond30.for.inc41_crit_edge.us.3

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond30.for.inc41_crit_edge.us.3
  br label %for.cond52.preheader.us.us.preheader
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_lu([2000 x double]* nocapture %A) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %entry
  %indvars.iv58 = phi i64 [ 0, %entry ], [ %indvars.iv.next59, %for.inc54 ]
  %0 = add nuw nsw i64 %indvars.iv58, 4294967295
  %1 = trunc i64 %0 to i32
  %cmp211 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp211, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.inc25
  %xtraiter6266 = and i64 %indvars.iv58, 1
  %lcmp.mod63 = icmp eq i64 %xtraiter6266, 0
  %2 = icmp eq i32 %1, 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv58, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv52
  %.pre31 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %lcmp.mod63, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.cond31.preheader.us
  %3 = load double, double* %arrayidx8.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv52
  %4 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %3, %4
  %sub47.us.prol = fsub double %.pre31, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.cond31.preheader.us
  %indvars.iv43.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr64.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre31, %for.cond31.preheader.us ]
  br i1 %2, label %for.cond31.for.inc51_crit_edge.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %for.inc48.us ], [ %indvars.iv43.unr.ph, %for.inc48.us.preheader ]
  %5 = phi double [ %sub47.us.1, %for.inc48.us ], [ %.unr64.ph, %for.inc48.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv43
  %6 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv52
  %7 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %6, %7
  %sub47.us = fsub double %5, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next44
  %8 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next44, i64 %indvars.iv52
  %9 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %8, %9
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next44.1 = add nuw nsw i64 %indvars.iv43, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next44.1, %indvars.iv58
  br i1 %exitcond49.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %10 = add nuw nsw i64 %indvars.iv36, 4294967295
  %11 = trunc i64 %10 to i32
  %cmp57 = icmp sgt i64 %indvars.iv36, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv36
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %xtraiter67 = and i64 %indvars.iv36, 1
  %lcmp.mod = icmp eq i64 %xtraiter67, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %12 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv36
  %13 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %12, %13
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.lr.ph ]
  %14 = icmp eq i32 %11, 0
  br i1 %14, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ %indvars.iv.unr.ph, %for.inc.preheader ]
  %15 = phi double [ %sub.1, %for.inc ], [ %.unr.ph, %for.inc.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv
  %16 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv36
  %17 = load double, double* %arrayidx12, align 8
  %mul = fmul double %16, %17
  %sub = fsub double %15, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv36
  %19 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %18, %19
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv36
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader, %for.inc.prol.loopexit
  %20 = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %.pre, %for.cond4.preheader ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv36
  %21 = load double, double* %arrayidx20, align 8
  %div = fdiv double %20, %21
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next37, %indvars.iv58
  br i1 %exitcond41, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next59, 2000
  br i1 %exitcond65, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2000 x double]* nocapture readonly %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv12, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond19, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
