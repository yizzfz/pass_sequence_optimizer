; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay9 = bitcast i8* %call1 to double*
  %arraydecay10 = bitcast i8* %call2 to double*
  %arraydecay11 = bitcast i8* %call3 to double*
  %arraydecay12 = bitcast i8* %call4 to double*
  %arraydecay13 = bitcast i8* %call5 to double*
  %arraydecay14 = bitcast i8* %call6 to double*
  %arraydecay15 = bitcast i8* %call7 to double*
  %arraydecay16 = bitcast i8* %call8 to double*
  call fastcc void @init_array(i32 2000, double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemver(i32 2000, double %0, double %1, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call5 to double*
  tail call fastcc void @print_array(i32 2000, double* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  tail call void @free(i8* %call7) #4
  tail call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %conv = sitofp i32 %n to double
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end48

for.body.lr.ph:                                   ; preds = %entry
  %0 = insertelement <2 x double> undef, double %conv, i32 0
  %xtraiter = and i32 %n, 1
  %wide.trip.count8 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %div41.us.prol = fdiv double 0.000000e+00, %conv
  %1 = icmp eq i32 %xtraiter, 0
  %2 = icmp eq i32 %n, 1
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond35.for.cond.loopexit_crit_edge.us, %for.body.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond35.for.cond.loopexit_crit_edge.us ], [ 0, %for.body.lr.ph ]
  %3 = trunc i64 %indvars.iv6 to i32
  %conv2.us = sitofp i32 %3 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv6
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %4 = trunc i64 %indvars.iv.next7 to i32
  %conv3.us = sitofp i32 %4 to double
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv6
  %5 = insertelement <2 x double> undef, double %conv3.us, i32 0
  %6 = fdiv <2 x double> %5, %0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %div4.us = fmul <2 x double> %7, <double 5.000000e-01, double 2.500000e-01>
  %div4.v.r1.us = extractelement <2 x double> %div4.us, i32 0
  %div4.v.r2.us = extractelement <2 x double> %div4.us, i32 1
  store double %div4.v.r1.us, double* %arrayidx6.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv6
  store double %div4.v.r2.us, double* %arrayidx12.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv6
  %div21.us = fdiv double %conv3.us, %conv
  %div22.us = fmul double %div21.us, 1.250000e-01
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv6
  store double %div22.us, double* %arrayidx24.us, align 8
  %div16.us = fdiv <2 x double> %7, <double 6.000000e+00, double 9.000000e+00>
  %div16.v.r1.us = extractelement <2 x double> %div16.us, i32 0
  %div16.v.r2.us = extractelement <2 x double> %div16.us, i32 1
  store double %div16.v.r1.us, double* %arrayidx18.us, align 8
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv6
  store double %div16.v.r2.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br i1 %1, label %for.body38.us.prol.loopexit, label %for.body38.us.prol

for.body38.us.prol:                               ; preds = %for.body.us
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 0
  store double %div41.us.prol, double* %arrayidx45.us.prol, align 8
  br label %for.body38.us.prol.loopexit

for.body38.us.prol.loopexit:                      ; preds = %for.body38.us.prol, %for.body.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body38.us.prol ], [ 0, %for.body.us ]
  br i1 %2, label %for.cond35.for.cond.loopexit_crit_edge.us, label %for.body38.us.preheader

for.body38.us.preheader:                          ; preds = %for.body38.us.prol.loopexit
  br label %for.body38.us

for.body38.us:                                    ; preds = %for.body38.us.preheader, %for.body38.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body38.us ], [ %indvars.iv.unr.ph, %for.body38.us.preheader ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %9 = trunc i64 %8 to i32
  %rem.us = srem i32 %9, %n
  %conv39.us = sitofp i32 %rem.us to double
  %div41.us = fdiv double %conv39.us, %conv
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div41.us, double* %arrayidx45.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %11 = trunc i64 %10 to i32
  %rem.us.1 = srem i32 %11, %n
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.1 = fdiv double %conv39.us.1, %conv
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div41.us.1, double* %arrayidx45.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond35.for.cond.loopexit_crit_edge.us.loopexit, label %for.body38.us

for.cond35.for.cond.loopexit_crit_edge.us.loopexit: ; preds = %for.body38.us
  br label %for.cond35.for.cond.loopexit_crit_edge.us

for.cond35.for.cond.loopexit_crit_edge.us:        ; preds = %for.cond35.for.cond.loopexit_crit_edge.us.loopexit, %for.body38.us.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond, label %for.end48.loopexit, label %for.body.us

for.end48.loopexit:                               ; preds = %for.cond35.for.cond.loopexit_crit_edge.us
  br label %for.end48

for.end48:                                        ; preds = %for.end48.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32 %n, double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) unnamed_addr #2 {
entry:
  %cmp13 = icmp sgt i32 %n, 0
  br i1 %cmp13, label %for.cond1.preheader.us.preheader, label %for.end85

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %xtraiter38 = and i32 %n, 1
  %wide.trip.count42 = zext i32 %n to i64
  %wide.trip.count36.1 = zext i32 %n to i64
  %0 = icmp eq i32 %xtraiter38, 0
  %1 = icmp eq i32 %n, 1
  %sunkaddr57 = ptrtoint double* %u1 to i64
  %sunkaddr61 = ptrtoint double* %u2 to i64
  %sunkaddr = ptrtoint double* %u1 to i64
  %sunkaddr53 = ptrtoint double* %u2 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc20_crit_edge.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %0, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %arrayidx5.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 0
  %2 = load double, double* %arrayidx5.us.prol, align 8
  %sunkaddr50 = shl i64 %indvars.iv40, 3
  %sunkaddr51 = add i64 %sunkaddr, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  %3 = load double, double* %sunkaddr52, align 8
  %4 = load double, double* %v1, align 8
  %mul.us.prol = fmul double %3, %4
  %add.us.prol = fadd double %2, %mul.us.prol
  %sunkaddr54 = shl i64 %indvars.iv40, 3
  %sunkaddr55 = add i64 %sunkaddr53, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  %5 = load double, double* %sunkaddr56, align 8
  %6 = load double, double* %v2, align 8
  %mul14.us.prol = fmul double %5, %6
  %add15.us.prol = fadd double %add.us.prol, %mul14.us.prol
  store double %add15.us.prol, double* %arrayidx5.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv34.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %1, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %sunkaddr58 = shl i64 %indvars.iv40, 3
  %sunkaddr59 = add i64 %sunkaddr57, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to double*
  %sunkaddr62 = shl i64 %indvars.iv40, 3
  %sunkaddr63 = add i64 %sunkaddr61, %sunkaddr62
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to double*
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %for.body3.us ], [ %indvars.iv34.unr.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv34
  %7 = load double, double* %arrayidx5.us, align 8
  %8 = load double, double* %sunkaddr60, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv34
  %9 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %8, %9
  %add.us = fadd double %7, %mul.us
  %10 = load double, double* %sunkaddr64, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv34
  %11 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %10, %11
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv.next35
  %12 = load double, double* %arrayidx5.us.1, align 8
  %13 = load double, double* %sunkaddr60, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next35
  %14 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %13, %14
  %add.us.1 = fadd double %12, %mul.us.1
  %15 = load double, double* %sunkaddr64, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next35
  %16 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %15, %16
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count36.1
  br i1 %exitcond37.1, label %for.cond1.for.inc20_crit_edge.us.loopexit, label %for.body3.us

for.cond1.for.inc20_crit_edge.us.loopexit:        ; preds = %for.body3.us
  br label %for.cond1.for.inc20_crit_edge.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.cond1.for.inc20_crit_edge.us.loopexit, %for.body3.us.prol.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %for.cond23.preheader, label %for.cond1.preheader.us

for.cond23.preheader:                             ; preds = %for.cond1.for.inc20_crit_edge.us
  %cmp249 = icmp sgt i32 %n, 0
  br i1 %cmp249, label %for.cond26.preheader.us.preheader, label %for.end85

for.cond26.preheader.us.preheader:                ; preds = %for.cond23.preheader
  %xtraiter28 = and i32 %n, 1
  %wide.trip.count32 = zext i32 %n to i64
  %wide.trip.count26.1 = zext i32 %n to i64
  %17 = icmp eq i32 %xtraiter28, 0
  %18 = icmp eq i32 %n, 1
  %sunkaddr69 = ptrtoint double* %x to i64
  %sunkaddr65 = ptrtoint double* %x to i64
  br label %for.cond26.preheader.us

for.cond26.preheader.us:                          ; preds = %for.cond26.preheader.us.preheader, %for.cond26.for.inc45_crit_edge.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.cond26.for.inc45_crit_edge.us ], [ 0, %for.cond26.preheader.us.preheader ]
  br i1 %17, label %for.body28.us.prol.loopexit, label %for.body28.us.prol

for.body28.us.prol:                               ; preds = %for.cond26.preheader.us
  %sunkaddr66 = shl i64 %indvars.iv30, 3
  %sunkaddr67 = add i64 %sunkaddr65, %sunkaddr66
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to double*
  %19 = load double, double* %sunkaddr68, align 8
  %arrayidx34.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv30
  %20 = load double, double* %arrayidx34.us.prol, align 8
  %mul35.us.prol = fmul double %20, %beta
  %21 = load double, double* %y, align 8
  %mul38.us.prol = fmul double %mul35.us.prol, %21
  %add39.us.prol = fadd double %19, %mul38.us.prol
  store double %add39.us.prol, double* %sunkaddr68, align 8
  br label %for.body28.us.prol.loopexit

for.body28.us.prol.loopexit:                      ; preds = %for.body28.us.prol, %for.cond26.preheader.us
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.body28.us.prol ], [ 0, %for.cond26.preheader.us ]
  br i1 %18, label %for.cond26.for.inc45_crit_edge.us, label %for.body28.us.preheader

for.body28.us.preheader:                          ; preds = %for.body28.us.prol.loopexit
  %sunkaddr70 = shl i64 %indvars.iv30, 3
  %sunkaddr71 = add i64 %sunkaddr69, %sunkaddr70
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to double*
  br label %for.body28.us

for.body28.us:                                    ; preds = %for.body28.us.preheader, %for.body28.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.body28.us ], [ %indvars.iv24.unr.ph, %for.body28.us.preheader ]
  %22 = load double, double* %sunkaddr72, align 8
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv30
  %23 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %23, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv24
  %24 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %24
  %add39.us = fadd double %22, %mul38.us
  store double %add39.us, double* %sunkaddr72, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 %indvars.iv30
  %25 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %25, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next25
  %26 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %26
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %sunkaddr72, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25.1, %wide.trip.count26.1
  br i1 %exitcond27.1, label %for.cond26.for.inc45_crit_edge.us.loopexit, label %for.body28.us

for.cond26.for.inc45_crit_edge.us.loopexit:       ; preds = %for.body28.us
  br label %for.cond26.for.inc45_crit_edge.us

for.cond26.for.inc45_crit_edge.us:                ; preds = %for.cond26.for.inc45_crit_edge.us.loopexit, %for.body28.us.prol.loopexit
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %for.cond48.preheader, label %for.cond26.preheader.us

for.cond48.preheader:                             ; preds = %for.cond26.for.inc45_crit_edge.us
  %cmp495 = icmp sgt i32 %n, 0
  br i1 %cmp495, label %for.body50.preheader, label %for.end85

for.body50.preheader:                             ; preds = %for.cond48.preheader
  %27 = add i32 %n, -1
  %xtraiter22 = and i32 %n, 3
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  br i1 %lcmp.mod23, label %for.body50.prol.loopexit, label %for.body50.prol.preheader

for.body50.prol.preheader:                        ; preds = %for.body50.preheader
  br label %for.body50.prol

for.body50.prol:                                  ; preds = %for.body50.prol.preheader, %for.body50.prol
  %indvars.iv18.prol = phi i64 [ %indvars.iv.next19.prol, %for.body50.prol ], [ 0, %for.body50.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body50.prol ], [ %xtraiter22, %for.body50.prol.preheader ]
  %arrayidx52.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv18.prol
  %28 = load double, double* %arrayidx52.prol, align 8
  %arrayidx54.prol = getelementptr inbounds double, double* %z, i64 %indvars.iv18.prol
  %29 = load double, double* %arrayidx54.prol, align 8
  %add55.prol = fadd double %28, %29
  store double %add55.prol, double* %arrayidx52.prol, align 8
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body50.prol.loopexit.loopexit, label %for.body50.prol, !llvm.loop !1

for.body50.prol.loopexit.loopexit:                ; preds = %for.body50.prol
  br label %for.body50.prol.loopexit

for.body50.prol.loopexit:                         ; preds = %for.body50.prol.loopexit.loopexit, %for.body50.preheader
  %indvars.iv18.unr = phi i64 [ 0, %for.body50.preheader ], [ %indvars.iv.next19.prol, %for.body50.prol.loopexit.loopexit ]
  %30 = icmp ult i32 %27, 3
  br i1 %30, label %for.cond64.preheader.us.preheader, label %for.body50.preheader49

for.body50.preheader49:                           ; preds = %for.body50.prol.loopexit
  %wide.trip.count20.3 = zext i32 %n to i64
  %31 = add nsw i64 %wide.trip.count36.1, -4
  %32 = sub i64 %31, %indvars.iv18.unr
  %33 = lshr i64 %32, 2
  %34 = add nuw nsw i64 %33, 1
  %min.iters.check = icmp ult i64 %34, 2
  br i1 %min.iters.check, label %for.body50.preheader96, label %min.iters.checked

for.body50.preheader96:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body50.preheader49
  %indvars.iv18.ph = phi i64 [ %indvars.iv18.unr, %vector.memcheck ], [ %indvars.iv18.unr, %min.iters.checked ], [ %indvars.iv18.unr, %for.body50.preheader49 ], [ %ind.end, %middle.block ]
  br label %for.body50

min.iters.checked:                                ; preds = %for.body50.preheader49
  %n.mod.vf = and i64 %34, 1
  %n.vec = sub nsw i64 %34, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body50.preheader96, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %x, i64 %indvars.iv18.unr
  %35 = add nsw i64 %wide.trip.count36.1, -4
  %36 = sub i64 %35, %indvars.iv18.unr
  %37 = and i64 %36, -4
  %38 = add i64 %indvars.iv18.unr, %37
  %39 = add i64 %38, 4
  %scevgep82 = getelementptr double, double* %x, i64 %39
  %scevgep84 = getelementptr double, double* %z, i64 %indvars.iv18.unr
  %scevgep86 = getelementptr double, double* %z, i64 %39
  %bound0 = icmp ult double* %scevgep, %scevgep86
  %bound1 = icmp ult double* %scevgep84, %scevgep82
  %memcheck.conflict = and i1 %bound0, %bound1
  %40 = shl nuw i64 %33, 2
  %41 = add i64 %indvars.iv18.unr, %40
  %42 = add i64 %41, 4
  %43 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %42, %43
  br i1 %memcheck.conflict, label %for.body50.preheader96, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %44 = shl i64 %index, 2
  %45 = add i64 %indvars.iv18.unr, %44
  %46 = getelementptr inbounds double, double* %x, i64 %45
  %47 = bitcast double* %46 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %47, align 8, !alias.scope !3, !noalias !6
  %48 = getelementptr inbounds double, double* %z, i64 %45
  %49 = bitcast double* %48 to <8 x double>*
  %wide.vec91 = load <8 x double>, <8 x double>* %49, align 8, !alias.scope !6
  %50 = fadd <8 x double> %wide.vec, %wide.vec91
  %51 = shufflevector <8 x double> %50, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %52 = fadd <8 x double> %wide.vec, %wide.vec91
  %53 = shufflevector <8 x double> %52, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %54 = fadd <8 x double> %wide.vec, %wide.vec91
  %55 = shufflevector <8 x double> %54, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %56 = add nsw i64 %45, 3
  %57 = getelementptr inbounds double, double* %x, i64 %56
  %58 = fadd <8 x double> %wide.vec, %wide.vec91
  %59 = shufflevector <8 x double> %58, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %60 = getelementptr double, double* %57, i64 -3
  %61 = bitcast double* %60 to <8 x double>*
  %62 = shufflevector <2 x double> %51, <2 x double> %53, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %63 = shufflevector <2 x double> %55, <2 x double> %59, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %62, <4 x double> %63, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %61, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 2
  %64 = icmp eq i64 %index.next, %n.vec
  br i1 %64, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond61.preheader, label %for.body50.preheader96

for.cond61.preheader.loopexit:                    ; preds = %for.body50
  br label %for.cond61.preheader

for.cond61.preheader:                             ; preds = %for.cond61.preheader.loopexit, %middle.block
  %cmp623 = icmp sgt i32 %n, 0
  br i1 %cmp623, label %for.cond64.preheader.us.preheader, label %for.end85

for.cond64.preheader.us.preheader:                ; preds = %for.cond61.preheader, %for.body50.prol.loopexit
  %xtraiter = and i32 %n, 1
  %wide.trip.count17 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %65 = icmp eq i32 %xtraiter, 0
  %66 = icmp eq i32 %n, 1
  %sunkaddr77 = ptrtoint double* %w to i64
  %sunkaddr73 = ptrtoint double* %w to i64
  br label %for.cond64.preheader.us

for.cond64.preheader.us:                          ; preds = %for.cond64.preheader.us.preheader, %for.cond64.for.inc83_crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond64.for.inc83_crit_edge.us ], [ 0, %for.cond64.preheader.us.preheader ]
  br i1 %65, label %for.body66.us.prol.loopexit, label %for.body66.us.prol

for.body66.us.prol:                               ; preds = %for.cond64.preheader.us
  %sunkaddr74 = shl i64 %indvars.iv15, 3
  %sunkaddr75 = add i64 %sunkaddr73, %sunkaddr74
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to double*
  %67 = load double, double* %sunkaddr76, align 8
  %arrayidx72.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 0
  %68 = load double, double* %arrayidx72.us.prol, align 8
  %mul73.us.prol = fmul double %68, %alpha
  %69 = load double, double* %x, align 8
  %mul76.us.prol = fmul double %mul73.us.prol, %69
  %add77.us.prol = fadd double %67, %mul76.us.prol
  store double %add77.us.prol, double* %sunkaddr76, align 8
  br label %for.body66.us.prol.loopexit

for.body66.us.prol.loopexit:                      ; preds = %for.body66.us.prol, %for.cond64.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body66.us.prol ], [ 0, %for.cond64.preheader.us ]
  br i1 %66, label %for.cond64.for.inc83_crit_edge.us, label %for.body66.us.preheader

for.body66.us.preheader:                          ; preds = %for.body66.us.prol.loopexit
  %sunkaddr78 = shl i64 %indvars.iv15, 3
  %sunkaddr79 = add i64 %sunkaddr77, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us.preheader, %for.body66.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body66.us ], [ %indvars.iv.unr.ph, %for.body66.us.preheader ]
  %70 = load double, double* %sunkaddr80, align 8
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %71 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %71, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %72 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %72
  %add77.us = fadd double %70, %mul76.us
  store double %add77.us, double* %sunkaddr80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %73 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %73, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %74 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %74
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %sunkaddr80, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond64.for.inc83_crit_edge.us.loopexit, label %for.body66.us

for.cond64.for.inc83_crit_edge.us.loopexit:       ; preds = %for.body66.us
  br label %for.cond64.for.inc83_crit_edge.us

for.cond64.for.inc83_crit_edge.us:                ; preds = %for.cond64.for.inc83_crit_edge.us.loopexit, %for.body66.us.prol.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond, label %for.end85.loopexit, label %for.cond64.preheader.us

for.body50:                                       ; preds = %for.body50.preheader96, %for.body50
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.3, %for.body50 ], [ %indvars.iv18.ph, %for.body50.preheader96 ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv18
  %75 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv18
  %76 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %75, %76
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19
  %77 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19
  %78 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %77, %78
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19.1
  %79 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19.1
  %80 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %79, %80
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next19.2 = add nsw i64 %indvars.iv18, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19.2
  %81 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19.2
  %82 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %81, %82
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next19.3 = add nsw i64 %indvars.iv18, 4
  %exitcond21.3 = icmp eq i64 %indvars.iv.next19.3, %wide.trip.count20.3
  br i1 %exitcond21.3, label %for.cond61.preheader.loopexit, label %for.body50, !llvm.loop !11

for.end85.loopexit:                               ; preds = %for.cond64.for.inc83_crit_edge.us
  br label %for.end85

for.end85:                                        ; preds = %for.end85.loopexit, %entry, %for.cond23.preheader, %for.cond48.preheader, %for.cond61.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %w) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
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
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
