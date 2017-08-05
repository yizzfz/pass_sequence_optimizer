; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %arraydecay = bitcast i8* %call to [2100 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
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
  tail call fastcc void @print_array(i32 2100, double* %arraydecay7)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [2100 x double]* %A, double* %x) unnamed_addr #2 {
entry:
  %conv = sitofp i32 %n to double
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.inc.lr.ph, label %for.cond3.preheader

for.inc.lr.ph:                                    ; preds = %entry
  br label %for.inc

for.cond.for.cond3.preheader_crit_edge:           ; preds = %for.inc
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond.for.cond3.preheader_crit_edge, %entry
  %cmp46 = icmp sgt i32 %m, 0
  br i1 %cmp46, label %for.cond7.preheader.lr.ph, label %for.end24

for.cond7.preheader.lr.ph:                        ; preds = %for.cond3.preheader
  %mul = mul nsw i32 %m, 5
  %conv13 = sitofp i32 %mul to double
  br i1 %cmp9, label %for.cond7.preheader.us.preheader, label %for.cond3.for.end24_crit_edge.loopexit13

for.cond7.preheader.us.preheader:                 ; preds = %for.cond7.preheader.lr.ph
  %0 = sext i32 %m to i64
  %wide.trip.count = zext i32 %n to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %div14.us.v.i1.1 = insertelement <2 x double> undef, double %conv13, i32 0
  %div14.us.v.i1.2 = insertelement <2 x double> %div14.us.v.i1.1, double %conv13, i32 1
  br label %for.cond7.preheader.us

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv16 = phi i64 [ 0, %for.cond7.preheader.us.preheader ], [ %indvars.iv.next17, %for.cond7.for.inc22_crit_edge.us ]
  br i1 %lcmp.mod, label %for.inc19.us.prol.loopexit.unr-lcssa, label %for.inc19.us.prol.preheader

for.inc19.us.prol.preheader:                      ; preds = %for.cond7.preheader.us
  %2 = trunc i64 %indvars.iv16 to i32
  %rem.us.prol = srem i32 %2, %n
  %conv12.us.prol = sitofp i32 %rem.us.prol to double
  %div14.us.prol = fdiv double %conv12.us.prol, %conv13
  %arrayidx18.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv16, i64 0
  store double %div14.us.prol, double* %arrayidx18.us.prol, align 8
  br label %for.inc19.us.prol.loopexit.unr-lcssa

for.inc19.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond7.preheader.us, %for.inc19.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc19.us.prol.preheader ], [ 0, %for.cond7.preheader.us ]
  br i1 %1, label %for.cond7.for.inc22_crit_edge.us, label %for.cond7.preheader.us.new

for.cond7.preheader.us.new:                       ; preds = %for.inc19.us.prol.loopexit.unr-lcssa
  br label %for.inc19.us

for.inc19.us:                                     ; preds = %for.inc19.us, %for.cond7.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond7.preheader.us.new ], [ %indvars.iv.next.1, %for.inc19.us ]
  %3 = add nsw i64 %indvars.iv16, %indvars.iv
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv12.us = sitofp i32 %rem.us to double
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = add nsw i64 %indvars.iv16, %indvars.iv.next
  %6 = trunc i64 %5 to i32
  %rem.us.1 = srem i32 %6, %n
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.v.i0.1 = insertelement <2 x double> undef, double %conv12.us, i32 0
  %div14.us.v.i0.2 = insertelement <2 x double> %div14.us.v.i0.1, double %conv12.us.1, i32 1
  %div14.us = fdiv <2 x double> %div14.us.v.i0.2, %div14.us.v.i1.2
  %7 = bitcast double* %arrayidx18.us to <2 x double>*
  store <2 x double> %div14.us, <2 x double>* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.unr-lcssa, label %for.inc19.us

for.cond7.for.inc22_crit_edge.us.unr-lcssa:       ; preds = %for.inc19.us
  br label %for.cond7.for.inc22_crit_edge.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.inc19.us.prol.loopexit.unr-lcssa, %for.cond7.for.inc22_crit_edge.us.unr-lcssa
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next17, %0
  br i1 %cmp4.us, label %for.cond7.preheader.us, label %for.cond3.for.end24_crit_edge.loopexit

for.inc:                                          ; preds = %for.inc.lr.ph, %for.inc
  %inc12 = phi i32 [ 0, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %storemerge10 = phi i32 [ 0, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %conv2 = sitofp i32 %storemerge10 to double
  %div = fdiv double %conv2, %conv
  %add = fadd double %div, 1.000000e+00
  %idxprom = sext i32 %storemerge10 to i64
  %arrayidx = getelementptr inbounds double, double* %x, i64 %idxprom
  store double %add, double* %arrayidx, align 8
  %inc = add nsw i32 %inc12, 1
  %cmp = icmp slt i32 %inc, %n
  br i1 %cmp, label %for.inc, label %for.cond.for.cond3.preheader_crit_edge

for.cond3.for.end24_crit_edge.loopexit:           ; preds = %for.cond7.for.inc22_crit_edge.us
  br label %for.cond3.for.end24_crit_edge

for.cond3.for.end24_crit_edge.loopexit13:         ; preds = %for.cond7.preheader.lr.ph
  br label %for.cond3.for.end24_crit_edge

for.cond3.for.end24_crit_edge:                    ; preds = %for.cond3.for.end24_crit_edge.loopexit13, %for.cond3.for.end24_crit_edge.loopexit
  br label %for.end24

for.end24:                                        ; preds = %for.cond3.for.end24_crit_edge, %for.cond3.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* %A, double* %x, double* %y, double* %tmp) unnamed_addr #2 {
entry:
  %cmp56 = icmp sgt i32 %n, 0
  br i1 %cmp56, label %for.inc.lr.ph, label %for.cond3.preheader

for.inc.lr.ph:                                    ; preds = %entry
  br label %for.inc

for.cond.for.cond3.preheader_crit_edge:           ; preds = %for.inc
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond.for.cond3.preheader_crit_edge, %entry
  %cmp411 = icmp sgt i32 %m, 0
  br i1 %cmp411, label %for.body5.lr.ph, label %for.end44

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  br i1 %cmp56, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  br label %for.body5

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %0 = sext i32 %n to i64
  %1 = sext i32 %m to i64
  %2 = icmp sgt i64 %0, 1
  %smax = select i1 %2, i64 %0, i64 1
  %scevgep = getelementptr double, double* %y, i64 %smax
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %smax, %n.vec
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.inc42.us
  %indvar = phi i64 [ 0, %for.body5.us.preheader ], [ %indvar.next, %for.inc42.us ]
  %indvars.iv65 = phi i64 [ 0, %for.body5.us.preheader ], [ %indvars.iv.next66, %for.inc42.us ]
  %storemerge112.us = phi i64 [ 0, %for.body5.us.preheader ], [ %indvars.iv.next66, %for.inc42.us ]
  %scevgep78 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvar, i64 0
  %scevgep80 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvar, i64 %smax
  %sext71 = shl i64 %storemerge112.us, 32
  %idxprom6.us = ashr exact i64 %sext71, 32
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %idxprom6.us
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv65
  %.pre = load double, double* %arrayidx12.us, align 8
  br label %for.inc21.us

for.inc42.us.loopexit:                            ; preds = %for.inc39.us
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge, %for.inc42.us.loopexit, %middle.block
  %indvars.iv.next66 = add nsw i64 %indvars.iv65, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next66, %1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp4.us, label %for.body5.us, label %for.cond3.for.end44_crit_edge.loopexit

for.inc39.us:                                     ; preds = %for.inc39.us.preheader, %for.inc39.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc39.us ], [ %indvars.iv63.ph, %for.inc39.us.preheader ]
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv63
  %3 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv63
  %4 = load double, double* %arrayidx32.us, align 8
  %5 = load double, double* %arrayidx12.us, align 8
  %mul35.us = fmul double %4, %5
  %add36.us = fadd double %3, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %cmp25.us = icmp slt i64 %indvars.iv.next64, %0
  br i1 %cmp25.us, label %for.inc39.us, label %for.inc42.us.loopexit, !llvm.loop !1

for.inc21.us:                                     ; preds = %for.body5.us, %for.inc21.us
  %6 = phi double [ %.pre, %for.body5.us ], [ %add.us, %for.inc21.us ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next, %for.inc21.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv
  %7 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %8 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %7, %8
  %add.us = fadd double %6, %mul.us
  store double %add.us, double* %arrayidx12.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp9.us = icmp slt i64 %indvars.iv.next, %0
  br i1 %cmp9.us, label %for.inc21.us, label %for.cond8.for.cond24.preheader_crit_edge.us

for.cond8.for.cond24.preheader_crit_edge.us:      ; preds = %for.inc21.us
  br i1 true, label %for.inc39.lr.ph.us, label %for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge

for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge: ; preds = %for.cond8.for.cond24.preheader_crit_edge.us
  br label %for.inc42.us

for.inc39.lr.ph.us:                               ; preds = %for.cond8.for.cond24.preheader_crit_edge.us
  br i1 %min.iters.check, label %for.inc39.us.preheader, label %min.iters.checked

for.inc39.us.preheader:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc39.lr.ph.us
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.inc39.lr.ph.us ], [ %n.vec, %middle.block ]
  br label %for.inc39.us

min.iters.checked:                                ; preds = %for.inc39.lr.ph.us
  br i1 %cmp.zero, label %for.inc39.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ugt double* %scevgep80, %y
  %bound1 = icmp ult double* %scevgep78, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  %bound083 = icmp ugt double* %arrayidx12.us, %y
  %bound184 = icmp ult double* %arrayidx12.us, %scevgep
  %found.conflict85 = and i1 %bound083, %bound184
  %conflict.rdx = or i1 %found.conflict, %found.conflict85
  br i1 %conflict.rdx, label %for.inc39.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %9 = phi double [ %.pre92, %vector.body.vector.body_crit_edge ], [ %add.us, %vector.body.preheader ]
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %10 = getelementptr inbounds double, double* %y, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !4, !noalias !7
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !4, !noalias !7
  %14 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !10
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !10
  %18 = insertelement <2 x double> undef, double %9, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = fmul <2 x double> %wide.load88, %19
  %21 = fmul <2 x double> %wide.load89, %19
  %22 = fadd <2 x double> %wide.load, %20
  %23 = fadd <2 x double> %wide.load87, %21
  store <2 x double> %22, <2 x double>* %11, align 8, !alias.scope !4, !noalias !7
  store <2 x double> %23, <2 x double>* %13, align 8, !alias.scope !4, !noalias !7
  %index.next = add i64 %index, 4
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !11

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %.pre92 = load double, double* %arrayidx12.us, align 8, !alias.scope !12
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc42.us, label %for.inc39.us.preheader

for.inc:                                          ; preds = %for.inc.lr.ph, %for.inc
  %inc59 = phi i32 [ 0, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %storemerge57 = phi i32 [ 0, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %idxprom = sext i32 %storemerge57 to i64
  %arrayidx = getelementptr inbounds double, double* %y, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  %inc = add nsw i32 %inc59, 1
  %cmp = icmp slt i32 %inc, %n
  br i1 %cmp, label %for.inc, label %for.cond.for.cond3.preheader_crit_edge

for.body5:                                        ; preds = %for.body5.preheader, %for.body5
  %inc4313 = phi i32 [ %inc43, %for.body5 ], [ 0, %for.body5.preheader ]
  %storemerge112 = phi i32 [ %inc43, %for.body5 ], [ 0, %for.body5.preheader ]
  %idxprom6 = sext i32 %storemerge112 to i64
  %arrayidx7 = getelementptr inbounds double, double* %tmp, i64 %idxprom6
  store double 0.000000e+00, double* %arrayidx7, align 8
  %inc43 = add nsw i32 %inc4313, 1
  %cmp4 = icmp slt i32 %inc43, %m
  br i1 %cmp4, label %for.body5, label %for.cond3.for.end44_crit_edge.loopexit90

for.cond3.for.end44_crit_edge.loopexit:           ; preds = %for.inc42.us
  br label %for.cond3.for.end44_crit_edge

for.cond3.for.end44_crit_edge.loopexit90:         ; preds = %for.body5
  br label %for.cond3.for.end44_crit_edge

for.cond3.for.end44_crit_edge:                    ; preds = %for.cond3.for.end44_crit_edge.loopexit90, %for.cond3.for.end44_crit_edge.loopexit
  br label %for.end44

for.end44:                                        ; preds = %for.cond3.for.end44_crit_edge, %for.cond3.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %storemerge2 = phi i32 [ 0, %for.body.lr.ph ], [ %7, %for.inc ]
  %rem = srem i32 %storemerge2, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  %7 = trunc i64 %indvars.iv.next to i32
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8, !9}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = !{!8}
!11 = distinct !{!11, !2, !3}
!12 = !{!9}
