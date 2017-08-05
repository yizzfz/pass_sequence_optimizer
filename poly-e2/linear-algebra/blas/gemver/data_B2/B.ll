; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay13)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  br i1 %cmp3, label %for.body.us.preheader, label %for.end48

for.body.us.preheader:                            ; preds = %entry
  %0 = zext i32 %n to i64
  %xtraiter = and i32 %n, 1
  %div41.us.prol = fdiv double 0.000000e+00, %conv
  %1 = icmp eq i32 %xtraiter, 0
  %2 = icmp eq i32 %n, 1
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond35.for.cond.loopexit_crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond35.for.cond.loopexit_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %3 = trunc i64 %indvars.iv6 to i32
  %conv2.us = sitofp i32 %3 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv6
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %4 = trunc i64 %indvars.iv.next7 to i32
  %conv3.us = sitofp i32 %4 to double
  %div.us = fdiv double %conv3.us, %conv
  %div4.us = fmul double %div.us, 5.000000e-01
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv6
  store double %div4.us, double* %arrayidx6.us, align 8
  %div10.us = fmul double %div.us, 2.500000e-01
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv6
  store double %div10.us, double* %arrayidx12.us, align 8
  %div16.us = fdiv double %div.us, 6.000000e+00
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv6
  store double %div16.us, double* %arrayidx18.us, align 8
  %div22.us = fmul double %div.us, 1.250000e-01
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv6
  store double %div22.us, double* %arrayidx24.us, align 8
  %div28.us = fdiv double %div.us, 9.000000e+00
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv6
  store double %div28.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br i1 %1, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.body.us
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 0
  store double %div41.us.prol, double* %arrayidx45.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.body.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.body.us ]
  br i1 %2, label %for.cond35.for.cond.loopexit_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, %n
  %conv39.us = sitofp i32 %rem.us to double
  %div41.us = fdiv double %conv39.us, %conv
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div41.us, double* %arrayidx45.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, %n
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.1 = fdiv double %conv39.us.1, %conv
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div41.us.1, double* %arrayidx45.us.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %0
  br i1 %exitcond.1, label %for.cond35.for.cond.loopexit_crit_edge.us.loopexit, label %for.inc.us

for.cond35.for.cond.loopexit_crit_edge.us.loopexit: ; preds = %for.inc.us
  br label %for.cond35.for.cond.loopexit_crit_edge.us

for.cond35.for.cond.loopexit_crit_edge.us:        ; preds = %for.cond35.for.cond.loopexit_crit_edge.us.loopexit, %for.inc.us.prol.loopexit
  %exitcond11 = icmp eq i64 %indvars.iv.next7, %0
  br i1 %exitcond11, label %for.end48.loopexit, label %for.body.us

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
  %0 = zext i32 %n to i64
  %xtraiter38 = and i32 %n, 1
  %1 = icmp eq i32 %xtraiter38, 0
  %2 = icmp eq i32 %n, 1
  %sunkaddr59 = ptrtoint double* %u1 to i64
  %sunkaddr63 = ptrtoint double* %u2 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc20_crit_edge.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %1, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.cond1.preheader.us
  %arrayidx5.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 0
  %3 = load double, double* %arrayidx5.us.prol, align 8
  %sunkaddr52 = shl i64 %indvars.iv40, 3
  %sunkaddr53 = add i64 %sunkaddr59, %sunkaddr52
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to double*
  %4 = load double, double* %sunkaddr54, align 8
  %5 = load double, double* %v1, align 8
  %mul.us.prol = fmul double %4, %5
  %add.us.prol = fadd double %3, %mul.us.prol
  %sunkaddr57 = add i64 %sunkaddr63, %sunkaddr52
  %sunkaddr58 = inttoptr i64 %sunkaddr57 to double*
  %6 = load double, double* %sunkaddr58, align 8
  %7 = load double, double* %v2, align 8
  %mul14.us.prol = fmul double %6, %7
  %add15.us.prol = fadd double %add.us.prol, %mul14.us.prol
  store double %add15.us.prol, double* %arrayidx5.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.cond1.preheader.us
  %indvars.iv34.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %2, label %for.cond1.for.inc20_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %sunkaddr60 = shl i64 %indvars.iv40, 3
  %sunkaddr61 = add i64 %sunkaddr59, %sunkaddr60
  %sunkaddr62 = inttoptr i64 %sunkaddr61 to double*
  %sunkaddr65 = add i64 %sunkaddr63, %sunkaddr60
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to double*
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %for.inc.us ], [ %indvars.iv34.unr.ph, %for.inc.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv34
  %8 = load double, double* %arrayidx5.us, align 8
  %9 = load double, double* %sunkaddr62, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv34
  %10 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %9, %10
  %add.us = fadd double %8, %mul.us
  %11 = load double, double* %sunkaddr66, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv34
  %12 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %11, %12
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv.next35
  %13 = load double, double* %arrayidx5.us.1, align 8
  %14 = load double, double* %sunkaddr62, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next35
  %15 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %14, %15
  %add.us.1 = fadd double %13, %mul.us.1
  %16 = load double, double* %sunkaddr66, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next35
  %17 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %16, %17
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next35.1 = add nuw nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %0
  br i1 %exitcond37.1, label %for.cond1.for.inc20_crit_edge.us.loopexit, label %for.inc.us

for.cond1.for.inc20_crit_edge.us.loopexit:        ; preds = %for.inc.us
  br label %for.cond1.for.inc20_crit_edge.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.cond1.for.inc20_crit_edge.us.loopexit, %for.inc.us.prol.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next41, %0
  br i1 %exitcond51, label %for.cond23.preheader, label %for.cond1.preheader.us

for.cond23.preheader:                             ; preds = %for.cond1.for.inc20_crit_edge.us
  br i1 true, label %for.cond26.preheader.us.preheader, label %for.cond23.preheader.for.end85_crit_edge

for.cond23.preheader.for.end85_crit_edge:         ; preds = %for.cond23.preheader
  br label %for.end85

for.cond26.preheader.us.preheader:                ; preds = %for.cond23.preheader
  %sunkaddr71 = ptrtoint double* %x to i64
  br label %for.cond26.preheader.us

for.cond26.preheader.us:                          ; preds = %for.cond26.preheader.us.preheader, %for.cond26.for.inc45_crit_edge.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.cond26.for.inc45_crit_edge.us ], [ 0, %for.cond26.preheader.us.preheader ]
  br i1 %1, label %for.inc42.us.prol.loopexit, label %for.inc42.us.prol

for.inc42.us.prol:                                ; preds = %for.cond26.preheader.us
  %sunkaddr68 = shl nuw nsw i64 %indvars.iv30, 3
  %sunkaddr69 = add i64 %sunkaddr71, %sunkaddr68
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to double*
  %18 = load double, double* %sunkaddr70, align 8
  %arrayidx34.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv30
  %19 = load double, double* %arrayidx34.us.prol, align 8
  %mul35.us.prol = fmul double %19, %beta
  %20 = load double, double* %y, align 8
  %mul38.us.prol = fmul double %mul35.us.prol, %20
  %add39.us.prol = fadd double %18, %mul38.us.prol
  store double %add39.us.prol, double* %sunkaddr70, align 8
  br label %for.inc42.us.prol.loopexit

for.inc42.us.prol.loopexit:                       ; preds = %for.inc42.us.prol, %for.cond26.preheader.us
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.inc42.us.prol ], [ 0, %for.cond26.preheader.us ]
  br i1 %2, label %for.cond26.for.inc45_crit_edge.us, label %for.inc42.us.preheader

for.inc42.us.preheader:                           ; preds = %for.inc42.us.prol.loopexit
  %sunkaddr72 = shl nuw nsw i64 %indvars.iv30, 3
  %sunkaddr73 = add i64 %sunkaddr71, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  %.pre = load double, double* %sunkaddr74, align 8
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.inc42.us.preheader, %for.inc42.us
  %21 = phi double [ %add39.us.1, %for.inc42.us ], [ %.pre, %for.inc42.us.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.inc42.us ], [ %indvars.iv24.unr.ph, %for.inc42.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv30
  %22 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %22, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv24
  %23 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %23
  %add39.us = fadd double %21, %mul38.us
  store double %add39.us, double* %sunkaddr74, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 %indvars.iv30
  %24 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %24, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next25
  %25 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %25
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %sunkaddr74, align 8
  %indvars.iv.next25.1 = add nuw nsw i64 %indvars.iv24, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25.1, %0
  br i1 %exitcond27.1, label %for.cond26.for.inc45_crit_edge.us.loopexit, label %for.inc42.us

for.cond26.for.inc45_crit_edge.us.loopexit:       ; preds = %for.inc42.us
  br label %for.cond26.for.inc45_crit_edge.us

for.cond26.for.inc45_crit_edge.us:                ; preds = %for.cond26.for.inc45_crit_edge.us.loopexit, %for.inc42.us.prol.loopexit
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %0
  br i1 %exitcond, label %for.cond48.preheader, label %for.cond26.preheader.us

for.cond48.preheader:                             ; preds = %for.cond26.for.inc45_crit_edge.us
  br i1 true, label %for.inc58.preheader, label %for.cond48.preheader.for.end85_crit_edge

for.cond48.preheader.for.end85_crit_edge:         ; preds = %for.cond48.preheader
  br label %for.end85

for.inc58.preheader:                              ; preds = %for.cond48.preheader
  %26 = add i32 %n, -1
  %xtraiter22 = and i32 %n, 3
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  br i1 %lcmp.mod23, label %for.inc58.prol.loopexit, label %for.inc58.prol.preheader

for.inc58.prol.preheader:                         ; preds = %for.inc58.preheader
  %27 = add nsw i32 %xtraiter22, -1
  br label %for.inc58.prol

for.inc58.prol:                                   ; preds = %for.inc58.prol.preheader, %for.inc58.prol
  %indvars.iv18.prol = phi i64 [ %indvars.iv.next19.prol, %for.inc58.prol ], [ 0, %for.inc58.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc58.prol ], [ %xtraiter22, %for.inc58.prol.preheader ]
  %arrayidx52.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv18.prol
  %28 = load double, double* %arrayidx52.prol, align 8
  %arrayidx54.prol = getelementptr inbounds double, double* %z, i64 %indvars.iv18.prol
  %29 = load double, double* %arrayidx54.prol, align 8
  %add55.prol = fadd double %28, %29
  store double %add55.prol, double* %arrayidx52.prol, align 8
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc58.prol.loopexit.loopexit, label %for.inc58.prol, !llvm.loop !1

for.inc58.prol.loopexit.loopexit:                 ; preds = %for.inc58.prol
  %30 = zext i32 %27 to i64
  %31 = add nuw nsw i64 %30, 1
  br label %for.inc58.prol.loopexit

for.inc58.prol.loopexit:                          ; preds = %for.inc58.prol.loopexit.loopexit, %for.inc58.preheader
  %indvars.iv18.unr = phi i64 [ 0, %for.inc58.preheader ], [ %31, %for.inc58.prol.loopexit.loopexit ]
  %32 = icmp ult i32 %26, 3
  br i1 %32, label %for.cond64.preheader.us.preheader, label %for.inc58.preheader49

for.inc58.preheader49:                            ; preds = %for.inc58.prol.loopexit
  %33 = add nsw i64 %0, -4
  %34 = sub nsw i64 %33, %indvars.iv18.unr
  %35 = lshr i64 %34, 2
  %36 = add nuw nsw i64 %35, 1
  %min.iters.check = icmp ult i64 %36, 2
  br i1 %min.iters.check, label %for.inc58.preheader98, label %min.iters.checked

for.inc58.preheader98:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc58.preheader49
  %indvars.iv18.ph = phi i64 [ %indvars.iv18.unr, %vector.memcheck ], [ %indvars.iv18.unr, %min.iters.checked ], [ %indvars.iv18.unr, %for.inc58.preheader49 ], [ %ind.end, %middle.block ]
  br label %for.inc58

min.iters.checked:                                ; preds = %for.inc58.preheader49
  %n.mod.vf = and i64 %36, 1
  %n.vec = sub nsw i64 %36, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc58.preheader98, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %x, i64 %indvars.iv18.unr
  %37 = and i64 %34, -4
  %38 = add nsw i64 %indvars.iv18.unr, %37
  %39 = add nsw i64 %38, 4
  %scevgep84 = getelementptr double, double* %x, i64 %39
  %scevgep86 = getelementptr double, double* %z, i64 %indvars.iv18.unr
  %scevgep88 = getelementptr double, double* %z, i64 %39
  %bound0 = icmp ult double* %scevgep, %scevgep88
  %bound1 = icmp ult double* %scevgep86, %scevgep84
  %memcheck.conflict = and i1 %bound0, %bound1
  %40 = shl nuw i64 %35, 2
  %41 = add i64 %indvars.iv18.unr, %40
  %42 = add i64 %41, 4
  %43 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %42, %43
  br i1 %memcheck.conflict, label %for.inc58.preheader98, label %vector.body.preheader

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
  %wide.vec93 = load <8 x double>, <8 x double>* %49, align 8, !alias.scope !6
  %50 = fadd <8 x double> %wide.vec, %wide.vec93
  %51 = shufflevector <8 x double> %50, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %52 = shufflevector <8 x double> %50, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %53 = shufflevector <8 x double> %50, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %54 = add nsw i64 %45, 3
  %55 = getelementptr inbounds double, double* %x, i64 %54
  %56 = shufflevector <8 x double> %50, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %57 = getelementptr double, double* %55, i64 -3
  %58 = bitcast double* %57 to <8 x double>*
  %59 = shufflevector <2 x double> %51, <2 x double> %52, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %60 = shufflevector <2 x double> %53, <2 x double> %56, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %59, <4 x double> %60, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %58, align 8, !alias.scope !3, !noalias !6
  %index.next = add i64 %index, 2
  %61 = icmp eq i64 %index.next, %n.vec
  br i1 %61, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond61.preheader, label %for.inc58.preheader98

for.cond61.preheader.loopexit:                    ; preds = %for.inc58
  br label %for.cond61.preheader

for.cond61.preheader:                             ; preds = %for.cond61.preheader.loopexit, %middle.block
  br i1 true, label %for.cond64.preheader.us.preheader, label %for.cond61.preheader.for.end85_crit_edge

for.cond61.preheader.for.end85_crit_edge:         ; preds = %for.cond61.preheader
  br label %for.end85

for.cond64.preheader.us.preheader:                ; preds = %for.cond61.preheader, %for.inc58.prol.loopexit
  %sunkaddr79 = ptrtoint double* %w to i64
  br label %for.cond64.preheader.us

for.cond64.preheader.us:                          ; preds = %for.cond64.preheader.us.preheader, %for.cond64.for.inc83_crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond64.for.inc83_crit_edge.us ], [ 0, %for.cond64.preheader.us.preheader ]
  br i1 %1, label %for.inc80.us.prol.loopexit, label %for.inc80.us.prol

for.inc80.us.prol:                                ; preds = %for.cond64.preheader.us
  %sunkaddr76 = shl i64 %indvars.iv15, 3
  %sunkaddr77 = add i64 %sunkaddr79, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to double*
  %62 = load double, double* %sunkaddr78, align 8
  %arrayidx72.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 0
  %63 = load double, double* %arrayidx72.us.prol, align 8
  %mul73.us.prol = fmul double %63, %alpha
  %64 = load double, double* %x, align 8
  %mul76.us.prol = fmul double %mul73.us.prol, %64
  %add77.us.prol = fadd double %62, %mul76.us.prol
  store double %add77.us.prol, double* %sunkaddr78, align 8
  br label %for.inc80.us.prol.loopexit

for.inc80.us.prol.loopexit:                       ; preds = %for.inc80.us.prol, %for.cond64.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc80.us.prol ], [ 0, %for.cond64.preheader.us ]
  br i1 %2, label %for.cond64.for.inc83_crit_edge.us, label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc80.us.prol.loopexit
  %sunkaddr80 = shl i64 %indvars.iv15, 3
  %sunkaddr81 = add i64 %sunkaddr79, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  %.pre101 = load double, double* %sunkaddr82, align 8
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.inc80.us.preheader, %for.inc80.us
  %65 = phi double [ %add77.us.1, %for.inc80.us ], [ %.pre101, %for.inc80.us.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc80.us ], [ %indvars.iv.unr.ph, %for.inc80.us.preheader ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %66 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %66, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %67 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %67
  %add77.us = fadd double %65, %mul76.us
  store double %add77.us, double* %sunkaddr82, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %68 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %68, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %69 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %69
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %sunkaddr82, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %0
  br i1 %exitcond.1, label %for.cond64.for.inc83_crit_edge.us.loopexit, label %for.inc80.us

for.cond64.for.inc83_crit_edge.us.loopexit:       ; preds = %for.inc80.us
  br label %for.cond64.for.inc83_crit_edge.us

for.cond64.for.inc83_crit_edge.us:                ; preds = %for.cond64.for.inc83_crit_edge.us.loopexit, %for.inc80.us.prol.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next16, %0
  br i1 %exitcond50, label %for.end85.loopexit, label %for.cond64.preheader.us

for.inc58:                                        ; preds = %for.inc58.preheader98, %for.inc58
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.3, %for.inc58 ], [ %indvars.iv18.ph, %for.inc58.preheader98 ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv18
  %70 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv18
  %71 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %70, %71
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19
  %72 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19
  %73 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %72, %73
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19.1
  %74 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19.1
  %75 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %74, %75
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next19.2 = add nsw i64 %indvars.iv18, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19.2
  %76 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19.2
  %77 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %76, %77
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next19.3 = add nsw i64 %indvars.iv18, 4
  %exitcond21.3 = icmp eq i64 %indvars.iv.next19.3, %0
  br i1 %exitcond21.3, label %for.cond61.preheader.loopexit, label %for.inc58, !llvm.loop !11

for.end85.loopexit:                               ; preds = %for.cond64.for.inc83_crit_edge.us
  br label %for.end85

for.end85:                                        ; preds = %for.end85.loopexit, %for.cond61.preheader.for.end85_crit_edge, %for.cond48.preheader.for.end85_crit_edge, %for.cond23.preheader.for.end85_crit_edge, %entry
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond3, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
