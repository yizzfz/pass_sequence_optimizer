; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  %cmp16 = icmp sgt i32 %n, 0
  br i1 %cmp16, label %for.body.preheader, label %for.cond3.preheader

for.body.preheader:                               ; preds = %entry
  %xtraiter28 = and i32 %n, 1
  %lcmp.mod29 = icmp eq i32 %xtraiter28, 0
  br i1 %lcmp.mod29, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader
  %div.prol = fdiv double 0.000000e+00, %conv
  %add.prol = fadd double %div.prol, 1.000000e+00
  store double %add.prol, double* %x, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader, %for.body.prol
  %indvars.iv24.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol ]
  %0 = icmp eq i32 %n, 1
  br i1 %0, label %for.cond3.preheader, label %for.body.preheader30

for.body.preheader30:                             ; preds = %for.body.prol.loopexit
  %wide.trip.count26.1 = zext i32 %n to i64
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv, i32 1
  br label %for.body

for.cond3.preheader.loopexit:                     ; preds = %for.body
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.loopexit, %for.body.prol.loopexit, %entry
  %cmp413 = icmp sgt i32 %m, 0
  br i1 %cmp413, label %for.cond7.preheader.lr.ph, label %for.end24

for.cond7.preheader.lr.ph:                        ; preds = %for.cond3.preheader
  %mul = mul nsw i32 %m, 5
  %conv13 = sitofp i32 %mul to double
  br i1 %cmp16, label %for.cond7.preheader.us.preheader, label %for.end24

for.cond7.preheader.us.preheader:                 ; preds = %for.cond7.preheader.lr.ph
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count22 = zext i32 %m to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %div14.us.v.i1.1 = insertelement <2 x double> undef, double %conv13, i32 0
  %div14.us.v.i1.2 = insertelement <2 x double> %div14.us.v.i1.1, double %conv13, i32 1
  br label %for.cond7.preheader.us

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body10.us.prol.loopexit, label %for.body10.us.prol

for.body10.us.prol:                               ; preds = %for.cond7.preheader.us
  %2 = trunc i64 %indvars.iv20 to i32
  %rem.us.prol = srem i32 %2, %n
  %conv12.us.prol = sitofp i32 %rem.us.prol to double
  %div14.us.prol = fdiv double %conv12.us.prol, %conv13
  %arrayidx18.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv20, i64 0
  store double %div14.us.prol, double* %arrayidx18.us.prol, align 8
  br label %for.body10.us.prol.loopexit

for.body10.us.prol.loopexit:                      ; preds = %for.body10.us.prol, %for.cond7.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body10.us.prol ], [ 0, %for.cond7.preheader.us ]
  br i1 %1, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us.preheader

for.body10.us.preheader:                          ; preds = %for.body10.us.prol.loopexit
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us.preheader, %for.body10.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body10.us ], [ %indvars.iv.unr.ph, %for.body10.us.preheader ]
  %3 = add nuw nsw i64 %indvars.iv, %indvars.iv20
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv12.us = sitofp i32 %rem.us to double
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = add nuw nsw i64 %indvars.iv.next, %indvars.iv20
  %6 = trunc i64 %5 to i32
  %rem.us.1 = srem i32 %6, %n
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.v.i0.1 = insertelement <2 x double> undef, double %conv12.us, i32 0
  %div14.us.v.i0.2 = insertelement <2 x double> %div14.us.v.i0.1, double %conv12.us.1, i32 1
  %div14.us = fdiv <2 x double> %div14.us.v.i0.2, %div14.us.v.i1.2
  %7 = bitcast double* %arrayidx18.us to <2 x double>*
  store <2 x double> %div14.us, <2 x double>* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.loopexit, label %for.body10.us

for.cond7.for.inc22_crit_edge.us.loopexit:        ; preds = %for.body10.us
  br label %for.cond7.for.inc22_crit_edge.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.cond7.for.inc22_crit_edge.us.loopexit, %for.body10.us.prol.loopexit
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond, label %for.end24.loopexit, label %for.cond7.preheader.us

for.body:                                         ; preds = %for.body.preheader30, %for.body
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.body ], [ %indvars.iv24.unr, %for.body.preheader30 ]
  %8 = trunc i64 %indvars.iv24 to i32
  %conv2 = sitofp i32 %8 to double
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv24
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %9 = trunc i64 %indvars.iv.next25 to i32
  %conv2.1 = sitofp i32 %9 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv2, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv2.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %add = fadd <2 x double> %div, <double 1.000000e+00, double 1.000000e+00>
  %10 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %add, <2 x double>* %10, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25.1, %wide.trip.count26.1
  br i1 %exitcond27.1, label %for.cond3.preheader.loopexit, label %for.body

for.end24.loopexit:                               ; preds = %for.cond7.for.inc22_crit_edge.us
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %for.cond7.preheader.lr.ph, %for.cond3.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* %A, double* %x, double* %y, double* %tmp) unnamed_addr #2 {
entry:
  %tmp78 = bitcast double* %tmp to i8*
  %cmp60 = icmp sgt i32 %n, 0
  br i1 %cmp60, label %for.cond3.preheader.loopexit, label %for.cond3.preheader

for.cond3.preheader.loopexit:                     ; preds = %entry
  %y83 = bitcast double* %y to i8*
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  call void @llvm.memset.p0i8.i64(i8* %y83, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.loopexit, %entry
  %cmp428 = icmp sgt i32 %m, 0
  br i1 %cmp428, label %for.body5.lr.ph, label %for.end44

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  br i1 %cmp60, label %for.body5.us.preheader, label %for.end44.loopexit62

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp eq i32 %n, 1
  %wide.trip.count65.1 = zext i32 %n to i64
  %wide.trip.count72 = zext i32 %m to i64
  %5 = add nsw i64 %wide.trip.count65.1, -2
  %scevgep87 = getelementptr double, double* %y, i64 2
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.inc42.us, %for.body5.us.preheader
  %indvars.iv70 = phi i64 [ 0, %for.body5.us.preheader ], [ %indvars.iv.next71, %for.inc42.us ]
  %scevgep93 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 2
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv70
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  br i1 %lcmp.mod, label %for.body10.us.prol.loopexit, label %for.body10.us.prol

for.body10.us.prol:                               ; preds = %for.body5.us
  %arrayidx16.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 0
  %6 = load double, double* %arrayidx16.us.prol, align 8
  %7 = load double, double* %x, align 8
  %mul.us.prol = fmul double %6, %7
  %add.us.prol = fadd double %mul.us.prol, 0.000000e+00
  store double %add.us.prol, double* %arrayidx7.us, align 8
  br label %for.body10.us.prol.loopexit

for.body10.us.prol.loopexit:                      ; preds = %for.body10.us.prol, %for.body5.us
  %8 = phi double [ %add.us.prol, %for.body10.us.prol ], [ 0.000000e+00, %for.body5.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body10.us.prol ], [ 0, %for.body5.us ]
  br i1 %4, label %for.cond8.for.cond24.preheader_crit_edge.us, label %for.body10.us.preheader

for.body10.us.preheader:                          ; preds = %for.body10.us.prol.loopexit
  br label %for.body10.us

for.inc42.us.loopexit:                            ; preds = %for.body26.us
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge, %for.inc42.us.loopexit, %middle.block, %for.body26.us.prol.loopexit
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond, label %for.end44.loopexit, label %for.body5.us

for.body26.us:                                    ; preds = %for.body26.us.preheader104, %for.body26.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %for.body26.us ], [ %indvars.iv63.ph, %for.body26.us.preheader104 ]
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv63
  %9 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv63
  %10 = load double, double* %arrayidx32.us, align 8
  %11 = load double, double* %arrayidx7.us, align 8
  %mul35.us = fmul double %10, %11
  %add36.us = fadd double %9, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next64
  %12 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv.next64
  %13 = load double, double* %arrayidx32.us.1, align 8
  %14 = load double, double* %arrayidx7.us, align 8
  %mul35.us.1 = fmul double %13, %14
  %add36.us.1 = fadd double %12, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond.169 = icmp eq i64 %indvars.iv.next64.1, %wide.trip.count65.1
  br i1 %exitcond.169, label %for.inc42.us.loopexit, label %for.body26.us, !llvm.loop !1

for.body10.us:                                    ; preds = %for.body10.us.preheader, %for.body10.us
  %15 = phi double [ %add.us.1, %for.body10.us ], [ %8, %for.body10.us.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body10.us ], [ %indvars.iv.unr.ph, %for.body10.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv
  %16 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %17 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %16, %17
  %add.us = fadd double %15, %mul.us
  store double %add.us, double* %arrayidx7.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %18, %19
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx7.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count65.1
  br i1 %exitcond.1, label %for.cond8.for.cond24.preheader_crit_edge.us.loopexit, label %for.body10.us

for.cond8.for.cond24.preheader_crit_edge.us.loopexit: ; preds = %for.body10.us
  br label %for.cond8.for.cond24.preheader_crit_edge.us

for.cond8.for.cond24.preheader_crit_edge.us:      ; preds = %for.cond8.for.cond24.preheader_crit_edge.us.loopexit, %for.body10.us.prol.loopexit
  %20 = phi double [ %add.us.1, %for.cond8.for.cond24.preheader_crit_edge.us.loopexit ], [ %8, %for.body10.us.prol.loopexit ]
  br i1 true, label %for.body26.us.preheader, label %for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge

for.cond8.for.cond24.preheader_crit_edge.us.for.inc42.us_crit_edge: ; preds = %for.cond8.for.cond24.preheader_crit_edge.us
  br label %for.inc42.us

for.body26.us.preheader:                          ; preds = %for.cond8.for.cond24.preheader_crit_edge.us
  br i1 %lcmp.mod, label %for.body26.us.prol.loopexit, label %for.body26.us.prol

for.body26.us.prol:                               ; preds = %for.body26.us.preheader
  %21 = load double, double* %y, align 8
  %arrayidx32.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 0
  %22 = load double, double* %arrayidx32.us.prol, align 8
  %mul35.us.prol = fmul double %22, %20
  %add36.us.prol = fadd double %21, %mul35.us.prol
  store double %add36.us.prol, double* %y, align 8
  br label %for.body26.us.prol.loopexit

for.body26.us.prol.loopexit:                      ; preds = %for.body26.us.prol, %for.body26.us.preheader
  %indvars.iv63.unr.ph = phi i64 [ 1, %for.body26.us.prol ], [ 0, %for.body26.us.preheader ]
  br i1 %4, label %for.inc42.us, label %for.body26.us.preheader85

for.body26.us.preheader85:                        ; preds = %for.body26.us.prol.loopexit
  %23 = sub nsw i64 %5, %indvars.iv63.unr.ph
  %24 = lshr i64 %23, 1
  %25 = add nuw i64 %24, 1
  %min.iters.check = icmp ult i64 %25, 2
  br i1 %min.iters.check, label %for.body26.us.preheader104, label %min.iters.checked

for.body26.us.preheader104:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body26.us.preheader85
  %indvars.iv63.ph = phi i64 [ %indvars.iv63.unr.ph, %vector.memcheck ], [ %indvars.iv63.unr.ph, %min.iters.checked ], [ %indvars.iv63.unr.ph, %for.body26.us.preheader85 ], [ %ind.end, %middle.block ]
  br label %for.body26.us

min.iters.checked:                                ; preds = %for.body26.us.preheader85
  %n.mod.vf = and i64 %25, 1
  %n.vec = sub i64 %25, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body26.us.preheader104, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %y, i64 %indvars.iv63.unr.ph
  %26 = and i64 %23, -2
  %27 = or i64 %indvars.iv63.unr.ph, %26
  %scevgep88 = getelementptr double, double* %scevgep87, i64 %27
  %scevgep91 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv63.unr.ph
  %scevgep94 = getelementptr double, double* %scevgep93, i64 %27
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep91, %scevgep88
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %arrayidx7.us
  %bound198 = icmp ult double* %arrayidx7.us, %scevgep88
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  %28 = or i64 %indvars.iv63.unr.ph, 2
  %29 = shl nuw i64 %24, 1
  %30 = add i64 %28, %29
  %31 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %30, %31
  br i1 %conflict.rdx, label %for.body26.us.preheader104, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %32 = load double, double* %arrayidx7.us, align 8, !alias.scope !4
  %33 = insertelement <2 x double> undef, double %32, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %35 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv63.unr.ph, %35
  %36 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %37 = bitcast double* %36 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %37, align 8, !alias.scope !7, !noalias !9
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec100 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %38 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %offset.idx
  %39 = bitcast double* %38 to <4 x double>*
  %wide.vec101 = load <4 x double>, <4 x double>* %39, align 8, !alias.scope !11
  %strided.vec102 = shufflevector <4 x double> %wide.vec101, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec103 = shufflevector <4 x double> %wide.vec101, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %40 = fmul <2 x double> %strided.vec102, %34
  %41 = fadd <2 x double> %strided.vec, %40
  %42 = add nuw nsw i64 %offset.idx, 1
  %43 = getelementptr inbounds double, double* %y, i64 %42
  %44 = fmul <2 x double> %strided.vec103, %34
  %45 = fadd <2 x double> %strided.vec100, %44
  %46 = getelementptr double, double* %43, i64 -1
  %47 = bitcast double* %46 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %41, <2 x double> %45, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %47, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 2
  %48 = icmp eq i64 %index.next, %n.vec
  br i1 %48, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc42.us, label %for.body26.us.preheader104

for.end44.loopexit62:                             ; preds = %for.body5.lr.ph
  %49 = add i32 %m, -1
  %50 = zext i32 %49 to i64
  %51 = shl nuw nsw i64 %50, 3
  %52 = add nuw nsw i64 %51, 8
  call void @llvm.memset.p0i8.i64(i8* %tmp78, i8 0, i64 %52, i32 8, i1 false)
  br label %for.end44

for.end44.loopexit:                               ; preds = %for.inc42.us
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %for.end44.loopexit62, %for.cond3.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10, !5}
!10 = distinct !{!10, !6}
!11 = !{!10}
!12 = distinct !{!12, !2, !3}
