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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32 %m, i32 %n, [2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  %conv = sitofp i32 %n to double
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.body.preheader, label %for.cond3.preheader

for.body.preheader:                               ; preds = %entry
  %xtraiter18 = and i32 %n, 1
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  br i1 %lcmp.mod19, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader
  %div.prol = fdiv double 0.000000e+00, %conv
  %add.prol = fadd double %div.prol, 1.000000e+00
  store double %add.prol, double* %x, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader, %for.body.prol
  %indvars.iv14.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol ]
  %0 = icmp eq i32 %n, 1
  br i1 %0, label %for.cond3.preheader, label %for.body.preheader20

for.body.preheader20:                             ; preds = %for.body.prol.loopexit
  %wide.trip.count16.1 = zext i32 %n to i64
  br label %for.body

for.cond3.preheader.loopexit:                     ; preds = %for.body
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.loopexit, %for.body.prol.loopexit, %entry
  %cmp43 = icmp sgt i32 %m, 0
  br i1 %cmp43, label %for.cond7.preheader.lr.ph, label %for.end24

for.cond7.preheader.lr.ph:                        ; preds = %for.cond3.preheader
  %cmp81 = icmp sgt i32 %n, 0
  %mul = mul nsw i32 %m, 5
  %conv13 = sitofp i32 %mul to double
  br i1 %cmp81, label %for.cond7.preheader.us.preheader, label %for.end24

for.cond7.preheader.us.preheader:                 ; preds = %for.cond7.preheader.lr.ph
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count12 = zext i32 %m to i64
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.cond7.preheader.us

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body10.us.prol.loopexit, label %for.body10.us.prol

for.body10.us.prol:                               ; preds = %for.cond7.preheader.us
  %2 = trunc i64 %indvars.iv10 to i32
  %rem.us.prol = srem i32 %2, %n
  %conv12.us.prol = sitofp i32 %rem.us.prol to double
  %div14.us.prol = fdiv double %conv12.us.prol, %conv13
  %arrayidx18.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv10, i64 0
  store double %div14.us.prol, double* %arrayidx18.us.prol, align 8
  br label %for.body10.us.prol.loopexit

for.body10.us.prol.loopexit:                      ; preds = %for.body10.us.prol, %for.cond7.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body10.us.prol ], [ 0, %for.cond7.preheader.us ]
  br i1 %1, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us.preheader

for.body10.us.preheader:                          ; preds = %for.body10.us.prol.loopexit
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us.preheader, %for.body10.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body10.us ], [ %indvars.iv.unr.ph, %for.body10.us.preheader ]
  %3 = add nuw nsw i64 %indvars.iv, %indvars.iv10
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv12.us = sitofp i32 %rem.us to double
  %div14.us = fdiv double %conv12.us, %conv13
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  store double %div14.us, double* %arrayidx18.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = add nuw nsw i64 %indvars.iv.next, %indvars.iv10
  %6 = trunc i64 %5 to i32
  %rem.us.1 = srem i32 %6, %n
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.1 = fdiv double %conv12.us.1, %conv13
  %arrayidx18.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv.next
  store double %div14.us.1, double* %arrayidx18.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.loopexit, label %for.body10.us

for.cond7.for.inc22_crit_edge.us.loopexit:        ; preds = %for.body10.us
  br label %for.cond7.for.inc22_crit_edge.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.cond7.for.inc22_crit_edge.us.loopexit, %for.body10.us.prol.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond, label %for.end24.loopexit, label %for.cond7.preheader.us

for.body:                                         ; preds = %for.body.preheader20, %for.body
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.1, %for.body ], [ %indvars.iv14.unr, %for.body.preheader20 ]
  %7 = trunc i64 %indvars.iv14 to i32
  %conv2 = sitofp i32 %7 to double
  %div = fdiv double %conv2, %conv
  %add = fadd double %div, 1.000000e+00
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv14
  store double %add, double* %arrayidx, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %8 = trunc i64 %indvars.iv.next15 to i32
  %conv2.1 = sitofp i32 %8 to double
  %div.1 = fdiv double %conv2.1, %conv
  %add.1 = fadd double %div.1, 1.000000e+00
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next15
  store double %add.1, double* %arrayidx.1, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next15.1, %wide.trip.count16.1
  br i1 %exitcond17.1, label %for.cond3.preheader.loopexit, label %for.body

for.end24.loopexit:                               ; preds = %for.cond7.for.inc22_crit_edge.us
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %for.cond7.preheader.lr.ph, %for.cond3.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* nocapture readonly %A, double* nocapture readonly %x, double* nocapture %y, double* nocapture %tmp) unnamed_addr #2 {
entry:
  %tmp55 = bitcast double* %tmp to i8*
  %cmp37 = icmp sgt i32 %n, 0
  br i1 %cmp37, label %for.cond3.preheader.loopexit, label %for.cond3.preheader

for.cond3.preheader.loopexit:                     ; preds = %entry
  %y60 = bitcast double* %y to i8*
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  call void @llvm.memset.p0i8.i64(i8* %y60, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond3.preheader.loopexit, %entry
  %cmp45 = icmp sgt i32 %m, 0
  br i1 %cmp45, label %for.body5.lr.ph, label %for.end44

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  %cmp91 = icmp sgt i32 %n, 0
  %cmp253 = icmp sgt i32 %n, 0
  br i1 %cmp91, label %for.body5.us.preheader, label %for.end44.loopexit39

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %4 = add i32 %n, -1
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %5 = icmp eq i32 %4, 0
  %xtraiter43 = and i32 %n, 1
  %lcmp.mod44 = icmp eq i32 %xtraiter43, 0
  %6 = icmp eq i32 %4, 0
  %wide.trip.count42.1 = zext i32 %n to i64
  %wide.trip.count49 = zext i32 %m to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %7 = add nsw i64 %wide.trip.count42.1, -2
  %scevgep64 = getelementptr double, double* %y, i64 2
  %8 = add nsw i64 %wide.trip.count42.1, -2
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.inc42.us, %for.body5.us.preheader
  %indvars.iv47 = phi i64 [ 0, %for.body5.us.preheader ], [ %indvars.iv.next48, %for.inc42.us ]
  %scevgep70 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 2
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv47
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  br i1 %lcmp.mod, label %for.body10.us.prol.loopexit, label %for.body10.us.prol

for.body10.us.prol:                               ; preds = %for.body5.us
  %9 = load double, double* %arrayidx7.us, align 8
  %arrayidx16.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 0
  %10 = load double, double* %arrayidx16.us.prol, align 8
  %11 = load double, double* %x, align 8
  %mul.us.prol = fmul double %10, %11
  %add.us.prol = fadd double %9, %mul.us.prol
  store double %add.us.prol, double* %arrayidx7.us, align 8
  br label %for.body10.us.prol.loopexit

for.body10.us.prol.loopexit:                      ; preds = %for.body10.us.prol, %for.body5.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body10.us.prol ], [ 0, %for.body5.us ]
  br i1 %5, label %for.cond8.for.cond24.preheader_crit_edge.us, label %for.body10.us.preheader

for.body10.us.preheader:                          ; preds = %for.body10.us.prol.loopexit
  br label %for.body10.us

for.inc42.us.loopexit:                            ; preds = %for.body26.us
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.inc42.us.loopexit, %middle.block, %for.body26.us.prol.loopexit, %for.cond8.for.cond24.preheader_crit_edge.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond, label %for.end44.loopexit, label %for.body5.us

for.body26.us:                                    ; preds = %for.body26.us.preheader81, %for.body26.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %for.body26.us ], [ %indvars.iv40.ph, %for.body26.us.preheader81 ]
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv40
  %12 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv40
  %13 = load double, double* %arrayidx32.us, align 8
  %14 = load double, double* %arrayidx7.us, align 8
  %mul35.us = fmul double %13, %14
  %add36.us = fadd double %12, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next41
  %15 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next41
  %16 = load double, double* %arrayidx32.us.1, align 8
  %17 = load double, double* %arrayidx7.us, align 8
  %mul35.us.1 = fmul double %16, %17
  %add36.us.1 = fadd double %15, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %exitcond.146 = icmp eq i64 %indvars.iv.next41.1, %wide.trip.count42.1
  br i1 %exitcond.146, label %for.inc42.us.loopexit, label %for.body26.us, !llvm.loop !1

for.body10.us:                                    ; preds = %for.body10.us.preheader, %for.body10.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body10.us ], [ %indvars.iv.unr.ph, %for.body10.us.preheader ]
  %18 = load double, double* %arrayidx7.us, align 8
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv
  %19 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %20 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %19, %20
  %add.us = fadd double %18, %mul.us
  store double %add.us, double* %arrayidx7.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next
  %21 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %21, %22
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx7.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond8.for.cond24.preheader_crit_edge.us.loopexit, label %for.body10.us

for.cond8.for.cond24.preheader_crit_edge.us.loopexit: ; preds = %for.body10.us
  br label %for.cond8.for.cond24.preheader_crit_edge.us

for.cond8.for.cond24.preheader_crit_edge.us:      ; preds = %for.cond8.for.cond24.preheader_crit_edge.us.loopexit, %for.body10.us.prol.loopexit
  br i1 %cmp253, label %for.body26.us.preheader, label %for.inc42.us

for.body26.us.preheader:                          ; preds = %for.cond8.for.cond24.preheader_crit_edge.us
  br i1 %lcmp.mod44, label %for.body26.us.prol.loopexit, label %for.body26.us.prol

for.body26.us.prol:                               ; preds = %for.body26.us.preheader
  %23 = load double, double* %y, align 8
  %arrayidx32.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 0
  %24 = load double, double* %arrayidx32.us.prol, align 8
  %25 = load double, double* %arrayidx7.us, align 8
  %mul35.us.prol = fmul double %24, %25
  %add36.us.prol = fadd double %23, %mul35.us.prol
  store double %add36.us.prol, double* %y, align 8
  br label %for.body26.us.prol.loopexit

for.body26.us.prol.loopexit:                      ; preds = %for.body26.us.prol, %for.body26.us.preheader
  %indvars.iv40.unr.ph = phi i64 [ 1, %for.body26.us.prol ], [ 0, %for.body26.us.preheader ]
  br i1 %6, label %for.inc42.us, label %for.body26.us.preheader62

for.body26.us.preheader62:                        ; preds = %for.body26.us.prol.loopexit
  %26 = sub nsw i64 %7, %indvars.iv40.unr.ph
  %27 = lshr i64 %26, 1
  %28 = add nuw i64 %27, 1
  %min.iters.check = icmp ult i64 %28, 2
  br i1 %min.iters.check, label %for.body26.us.preheader81, label %min.iters.checked

for.body26.us.preheader81:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body26.us.preheader62
  %indvars.iv40.ph = phi i64 [ %indvars.iv40.unr.ph, %vector.memcheck ], [ %indvars.iv40.unr.ph, %min.iters.checked ], [ %indvars.iv40.unr.ph, %for.body26.us.preheader62 ], [ %ind.end, %middle.block ]
  br label %for.body26.us

min.iters.checked:                                ; preds = %for.body26.us.preheader62
  %n.mod.vf = and i64 %28, 1
  %n.vec = sub i64 %28, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body26.us.preheader81, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %y, i64 %indvars.iv40.unr.ph
  %29 = sub nsw i64 %8, %indvars.iv40.unr.ph
  %30 = and i64 %29, -2
  %31 = or i64 %indvars.iv40.unr.ph, %30
  %scevgep65 = getelementptr double, double* %scevgep64, i64 %31
  %scevgep68 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv40.unr.ph
  %scevgep71 = getelementptr double, double* %scevgep70, i64 %31
  %bound0 = icmp ult double* %scevgep, %scevgep71
  %bound1 = icmp ult double* %scevgep68, %scevgep65
  %found.conflict = and i1 %bound0, %bound1
  %bound074 = icmp ult double* %scevgep, %arrayidx7.us
  %bound175 = icmp ult double* %arrayidx7.us, %scevgep65
  %found.conflict76 = and i1 %bound074, %bound175
  %conflict.rdx = or i1 %found.conflict, %found.conflict76
  %32 = or i64 %indvars.iv40.unr.ph, 2
  %33 = shl nuw i64 %27, 1
  %34 = add i64 %32, %33
  %35 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %34, %35
  br i1 %conflict.rdx, label %for.body26.us.preheader81, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %36 = load double, double* %arrayidx7.us, align 8, !alias.scope !4
  %37 = insertelement <2 x double> undef, double %36, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = load double, double* %arrayidx7.us, align 8, !alias.scope !4
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %42 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv40.unr.ph, %42
  %43 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %44 = bitcast double* %43 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %44, align 8, !alias.scope !7, !noalias !9
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec77 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %45 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv47, i64 %offset.idx
  %46 = bitcast double* %45 to <4 x double>*
  %wide.vec78 = load <4 x double>, <4 x double>* %46, align 8, !alias.scope !11
  %strided.vec79 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec80 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %47 = fmul <2 x double> %strided.vec79, %38
  %48 = fadd <2 x double> %strided.vec, %47
  %49 = add nuw nsw i64 %offset.idx, 1
  %50 = getelementptr inbounds double, double* %y, i64 %49
  %51 = fmul <2 x double> %strided.vec80, %41
  %52 = fadd <2 x double> %strided.vec77, %51
  %53 = getelementptr double, double* %50, i64 -1
  %54 = bitcast double* %53 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %48, <2 x double> %52, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %54, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 2
  %55 = icmp eq i64 %index.next, %n.vec
  br i1 %55, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc42.us, label %for.body26.us.preheader81

for.end44.loopexit39:                             ; preds = %for.body5.lr.ph
  %56 = add i32 %m, -1
  %57 = zext i32 %56 to i64
  %58 = shl nuw nsw i64 %57, 3
  %59 = add nuw nsw i64 %58, 8
  call void @llvm.memset.p0i8.i64(i8* %tmp55, i8 0, i64 %59, i32 8, i1 false)
  br label %for.end44

for.end44.loopexit:                               ; preds = %for.inc42.us
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %for.end44.loopexit39, %for.cond3.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
