; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv3622 = phi i64 [ 0, %entry ], [ %indvars.iv.next37.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv3622
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv3622
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv3622 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv3622
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv3622, 2
  %4 = trunc i64 %indvars.iv.next37.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond8.1 = icmp eq i64 %indvars.iv.next37.1, 2000
  br i1 %exitcond8.1, label %for.cond13.preheader.preheader, label %for.body

for.cond13.preheader.preheader:                   ; preds = %for.body
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.cond13.preheader.preheader, %for.end39
  %indvars.iv3420 = phi i64 [ %indvars.iv.next35, %for.end39 ], [ 0, %for.cond13.preheader.preheader ]
  %indvars.iv419 = phi i64 [ %indvars.iv.next5, %for.end39 ], [ 1, %for.cond13.preheader.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv3420, 2001
  %7 = add nuw nsw i64 %6, 1
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %7
  %8 = mul nsw i64 %indvars.iv3420, -8
  %9 = add nsw i64 %8, 15992
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %exitcond3117 = icmp eq i64 %indvars.iv419, 2000
  br i1 %exitcond3117, label %for.end39, label %for.body32.preheader

for.body32.preheader:                             ; preds = %for.cond29.preheader
  %10 = bitcast double* %scevgep24 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %10, i8 0, i64 %9, i32 8, i1 false)
  br label %for.end39

for.body16:                                       ; preds = %for.body16, %for.cond13.preheader
  %indvars.iv1916 = phi i64 [ 0, %for.cond13.preheader ], [ %indvars.iv.next20, %for.body16 ]
  %11 = sub nsw i64 0, %indvars.iv1916
  %12 = trunc i64 %11 to i32
  %rem = srem i32 %12, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3420, i64 %indvars.iv1916
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1916, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next20, %indvars.iv419
  br i1 %exitcond25, label %for.cond29.preheader, label %for.body16

for.end39:                                        ; preds = %for.cond29.preheader, %for.body32.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3420, i64 %indvars.iv3420
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3420, 1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv419, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next35, 2000
  br i1 %exitcond7, label %for.end46, label %for.cond13.preheader

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.end95, %for.end46
  %indvars.iv1113 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next12, %for.end95 ]
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.end92, %for.cond69.preheader
  %indvars.iv712 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next8, %for.end92 ]
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv712, i64 %indvars.iv1113
  br label %for.body76

for.body76:                                       ; preds = %for.body76, %for.cond73.preheader
  %indvars.iv311 = phi i64 [ 0, %for.cond73.preheader ], [ %indvars.iv.next4.1, %for.body76 ]
  %14 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv311, i64 %indvars.iv1113
  %15 = load double, double* %arrayidx84, align 8
  %mul = fmul double %14, %15
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv712, i64 %indvars.iv311
  %16 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %16, %mul
  store double %add89, double* %arrayidx88, align 8
  %indvars.iv.next4 = or i64 %indvars.iv311, 1
  %17 = load double, double* %arrayidx80, align 8
  %arrayidx84.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv1113
  %18 = load double, double* %arrayidx84.1, align 8
  %mul.1 = fmul double %17, %18
  %arrayidx88.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv712, i64 %indvars.iv.next4
  %19 = load double, double* %arrayidx88.1, align 8
  %add89.1 = fadd double %19, %mul.1
  store double %add89.1, double* %arrayidx88.1, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv311, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next4.1, 2000
  br i1 %exitcond6.1, label %for.end92, label %for.body76

for.end92:                                        ; preds = %for.body76
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv712, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond10, label %for.end95, label %for.cond73.preheader

for.end95:                                        ; preds = %for.end92
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1113, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond2, label %for.cond103.preheader.preheader, label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.end95
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.cond103.preheader.preheader, %for.end117
  %indvars.iv110 = phi i64 [ %indvars.iv.next2, %for.end117 ], [ 0, %for.cond103.preheader.preheader ]
  br label %for.body106

for.body106:                                      ; preds = %for.body106, %for.cond103.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond103.preheader ], [ %indvars.iv.next.4, %for.body106 ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv110, i64 %indvars.iv9
  %20 = bitcast double* %arrayidx110 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv9
  %22 = bitcast double* %arrayidx114 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next
  %23 = bitcast double* %arrayidx110.1 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next
  %25 = bitcast double* %arrayidx114.1 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv9, 2
  %arrayidx110.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.1
  %26 = bitcast double* %arrayidx110.2 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx114.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next.1
  %28 = bitcast double* %arrayidx114.2 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv9, 3
  %arrayidx110.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.2
  %29 = bitcast double* %arrayidx110.3 to i64*
  %30 = load i64, i64* %29, align 8
  %arrayidx114.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next.2
  %31 = bitcast double* %arrayidx114.3 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv9, 4
  %arrayidx110.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.3
  %32 = bitcast double* %arrayidx110.4 to i64*
  %33 = load i64, i64* %32, align 8
  %arrayidx114.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next.3
  %34 = bitcast double* %arrayidx114.4 to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv9, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end117, label %for.body106

for.end117:                                       ; preds = %for.body106
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond1, label %for.end120, label %for.cond103.preheader

for.end120:                                       ; preds = %for.end117
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.backedge, %entry
  %indvars.iv3332 = phi i64 [ 0, %entry ], [ %indvars.iv3332.be, %for.cond1.preheader.backedge ]
  %exitcond2123 = icmp eq i64 %indvars.iv3332, 0
  br i1 %exitcond2123, label %for.cond1.preheader.backedge, label %for.body3.preheader

for.cond1.preheader.backedge:                     ; preds = %for.cond1.preheader, %for.end57
  %indvars.iv3332.be = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next34, %for.end57 ]
  br label %for.cond1.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3332, i64 0
  br label %for.body3

for.body30.preheader:                             ; preds = %for.end
  %xtraiter40 = and i64 %indvars.iv3332, 1
  %0 = icmp eq i64 %xtraiter40, 0
  %1 = icmp eq i64 %indvars.iv3332, 1
  br label %for.body30

for.body3:                                        ; preds = %for.end, %for.body3.preheader
  %indvars.iv1624 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next17, %for.end ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3332, i64 %indvars.iv1624
  %2 = load double, double* %arrayidx5, align 8
  %exitcond1519 = icmp eq i64 %indvars.iv1624, 0
  br i1 %exitcond1519, label %for.end, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body3
  %xtraiter38 = and i64 %indvars.iv1624, 1
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %for.body8.prol.loopexit.unr-lcssa, label %for.body8.prol.preheader

for.body8.prol.preheader:                         ; preds = %for.body8.preheader
  %3 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv1624
  %4 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %3, %4
  %sub.prol = fsub double %2, %mul.prol
  br label %for.body8.prol.loopexit.unr-lcssa

for.body8.prol.loopexit.unr-lcssa:                ; preds = %for.body8.preheader, %for.body8.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol.preheader ], [ undef, %for.body8.preheader ]
  %w.021.unr.ph = phi double [ %sub.prol, %for.body8.prol.preheader ], [ %2, %for.body8.preheader ]
  %indvars.iv1120.unr.ph = phi i64 [ 1, %for.body8.prol.preheader ], [ 0, %for.body8.preheader ]
  %5 = icmp eq i64 %indvars.iv1624, 1
  br i1 %5, label %for.end, label %for.body8.preheader55

for.body8.preheader55:                            ; preds = %for.body8.prol.loopexit.unr-lcssa
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader55, %for.body8
  %w.021 = phi double [ %sub.1, %for.body8 ], [ %w.021.unr.ph, %for.body8.preheader55 ]
  %indvars.iv1120 = phi i64 [ %indvars.iv.next12.1, %for.body8 ], [ %indvars.iv1120.unr.ph, %for.body8.preheader55 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3332, i64 %indvars.iv1120
  %6 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1120, i64 %indvars.iv1624
  %7 = load double, double* %arrayidx16, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1120, 1
  %8 = load <2 x double>, <2 x double>* %6, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next12, i64 %indvars.iv1624
  %9 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %7, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %9, i32 1
  %mul = fmul <2 x double> %8, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.021, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1120, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next12.1, %indvars.iv1624
  br i1 %exitcond15.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit.unr-lcssa, %for.body3
  %w.0.lcssa = phi double [ %2, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit.unr-lcssa ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1624, i64 %indvars.iv1624
  %10 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %10
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1624, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next17, %indvars.iv3332
  br i1 %exitcond21, label %for.body30.preheader, label %for.body3

for.body30:                                       ; preds = %for.end50, %for.body30.preheader
  %indvars.iv2930 = phi i64 [ %indvars.iv3332, %for.body30.preheader ], [ %indvars.iv.next30, %for.end50 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3332, i64 %indvars.iv2930
  %11 = load double, double* %arrayidx34, align 8
  br i1 %0, label %for.body37.prol.loopexit.unr-lcssa, label %for.body37.prol.preheader

for.body37.prol.preheader:                        ; preds = %for.body30
  %12 = load double, double* %arrayidx12.prol, align 8
  %arrayidx45.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv2930
  %13 = load double, double* %arrayidx45.prol, align 8
  %mul46.prol = fmul double %12, %13
  %sub47.prol = fsub double %11, %mul46.prol
  br label %for.body37.prol.loopexit.unr-lcssa

for.body37.prol.loopexit.unr-lcssa:               ; preds = %for.body30, %for.body37.prol.preheader
  %sub47.lcssa.unr.ph = phi double [ %sub47.prol, %for.body37.prol.preheader ], [ undef, %for.body30 ]
  %w.127.unr.ph = phi double [ %sub47.prol, %for.body37.prol.preheader ], [ %11, %for.body30 ]
  %indvars.iv2226.unr.ph = phi i64 [ 1, %for.body37.prol.preheader ], [ 0, %for.body30 ]
  br i1 %1, label %for.end50, label %for.body37.preheader

for.body37.preheader:                             ; preds = %for.body37.prol.loopexit.unr-lcssa
  br label %for.body37

for.body37:                                       ; preds = %for.body37.preheader, %for.body37
  %w.127 = phi double [ %sub47.1, %for.body37 ], [ %w.127.unr.ph, %for.body37.preheader ]
  %indvars.iv2226 = phi i64 [ %indvars.iv.next23.1, %for.body37 ], [ %indvars.iv2226.unr.ph, %for.body37.preheader ]
  %arrayidx41 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3332, i64 %indvars.iv2226
  %14 = bitcast double* %arrayidx41 to <2 x double>*
  %arrayidx45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2226, i64 %indvars.iv2930
  %15 = load double, double* %arrayidx45, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2226, 1
  %16 = load <2 x double>, <2 x double>* %14, align 8
  %arrayidx45.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next23, i64 %indvars.iv2930
  %17 = load double, double* %arrayidx45.1, align 8
  %mul46.v.i1.1 = insertelement <2 x double> undef, double %15, i32 0
  %mul46.v.i1.2 = insertelement <2 x double> %mul46.v.i1.1, double %17, i32 1
  %mul46 = fmul <2 x double> %16, %mul46.v.i1.2
  %mul46.v.r1 = extractelement <2 x double> %mul46, i32 0
  %mul46.v.r2 = extractelement <2 x double> %mul46, i32 1
  %sub47 = fsub double %w.127, %mul46.v.r1
  %sub47.1 = fsub double %sub47, %mul46.v.r2
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv2226, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next23.1, %indvars.iv3332
  br i1 %exitcond26.1, label %for.end50.loopexit, label %for.body37

for.end50.loopexit:                               ; preds = %for.body37
  br label %for.end50

for.end50:                                        ; preds = %for.end50.loopexit, %for.body37.prol.loopexit.unr-lcssa
  %sub47.lcssa = phi double [ %sub47.lcssa.unr.ph, %for.body37.prol.loopexit.unr-lcssa ], [ %sub47.1, %for.end50.loopexit ]
  store double %sub47.lcssa, double* %arrayidx34, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv2930, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next30, 2000
  br i1 %exitcond32, label %for.end57, label %for.body30

for.end57:                                        ; preds = %for.end50
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3332, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond5, label %for.body63.preheader, label %for.cond1.preheader.backedge

for.body63.preheader:                             ; preds = %for.end57
  br label %for.body63

for.body63:                                       ; preds = %for.body63.backedge, %for.body63.preheader
  %indvars.iv917 = phi i64 [ 0, %for.body63.preheader ], [ %indvars.iv917.be, %for.body63.backedge ]
  %18 = add i64 %indvars.iv917, -1
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv917
  %19 = load double, double* %arrayidx65, align 8
  %exitcond13 = icmp eq i64 %indvars.iv917, 0
  br i1 %exitcond13, label %for.end79.thread, label %for.body68.preheader

for.end79.thread:                                 ; preds = %for.body63
  store double %19, double* %y, align 8
  br label %for.body63.backedge

for.body68.preheader:                             ; preds = %for.body63
  %xtraiter35 = and i64 %indvars.iv917, 3
  %lcmp.mod36 = icmp eq i64 %xtraiter35, 0
  br i1 %lcmp.mod36, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol.preheader, %for.body68.prol
  %w.215.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %19, %for.body68.prol.preheader ]
  %indvars.iv514.prol = phi i64 [ %indvars.iv.next6.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %prol.iter37 = phi i64 [ %prol.iter37.sub, %for.body68.prol ], [ %xtraiter35, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv917, i64 %indvars.iv514.prol
  %20 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv514.prol
  %21 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %20, %21
  %sub76.prol = fsub double %w.215.prol, %mul75.prol
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv514.prol, 1
  %prol.iter37.sub = add i64 %prol.iter37, -1
  %prol.iter37.cmp = icmp eq i64 %prol.iter37.sub, 0
  br i1 %prol.iter37.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !1

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %w.215.unr = phi double [ %19, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv514.unr = phi i64 [ 0, %for.body68.preheader ], [ %indvars.iv.next6.prol, %for.body68.prol.loopexit.loopexit ]
  %22 = icmp ult i64 %18, 3
  br i1 %22, label %for.end79, label %for.body68.preheader54

for.body68.preheader54:                           ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68.preheader54, %for.body68
  %w.215 = phi double [ %sub76.3, %for.body68 ], [ %w.215.unr, %for.body68.preheader54 ]
  %indvars.iv514 = phi i64 [ %indvars.iv.next6.3, %for.body68 ], [ %indvars.iv514.unr, %for.body68.preheader54 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv917, i64 %indvars.iv514
  %23 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv514
  %24 = bitcast double* %arrayidx74 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %23, align 8
  %26 = load <2 x double>, <2 x double>* %24, align 8
  %mul75 = fmul <2 x double> %25, %26
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.215, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv514, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv917, i64 %indvars.iv.next6.1
  %27 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6.1
  %28 = bitcast double* %arrayidx74.2 to <2 x double>*
  %29 = load <2 x double>, <2 x double>* %27, align 8
  %30 = load <2 x double>, <2 x double>* %28, align 8
  %mul75.2 = fmul <2 x double> %29, %30
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv514, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next6.3, %indvars.iv917
  br i1 %exitcond.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit
  %w.2.lcssa = phi double [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv917
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv917, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond4, label %for.body88.preheader, label %for.body63.backedge

for.body63.backedge:                              ; preds = %for.end79, %for.end79.thread
  %indvars.iv917.be = phi i64 [ 1, %for.end79.thread ], [ %indvars.iv.next10, %for.end79 ]
  br label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvar = phi i64 [ %indvar.next, %for.end104 ], [ 0, %for.body88.preheader ]
  %indvars.iv311 = phi i64 [ %indvars.iv.next4, %for.end104 ], [ 1999, %for.body88.preheader ]
  %indvars.iv210 = phi i64 [ %indvars.iv.next3, %for.end104 ], [ 2000, %for.body88.preheader ]
  %31 = add i64 %indvar, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv311
  %32 = load double, double* %arrayidx90, align 8
  %exitcond16 = icmp eq i64 %indvars.iv210, 2000
  br i1 %exitcond16, label %for.end104, label %for.body93.preheader

for.body93.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.preheader
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol.preheader, %for.body93.prol
  %w.38.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %32, %for.body93.prol.preheader ]
  %indvars.iv17.prol = phi i64 [ %indvars.iv.next2.prol, %for.body93.prol ], [ %indvars.iv210, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv311, i64 %indvars.iv17.prol
  %33 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv17.prol
  %34 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %33, %34
  %sub101.prol = fsub double %w.38.prol, %mul100.prol
  %indvars.iv.next2.prol = add nuw nsw i64 %indvars.iv17.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !3

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %w.38.unr = phi double [ %32, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %indvars.iv17.unr = phi i64 [ %indvars.iv210, %for.body93.preheader ], [ %indvars.iv.next2.prol, %for.body93.prol.loopexit.loopexit ]
  %35 = icmp ult i64 %31, 3
  br i1 %35, label %for.end104, label %for.body93.preheader53

for.body93.preheader53:                           ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93.preheader53, %for.body93
  %w.38 = phi double [ %sub101.3, %for.body93 ], [ %w.38.unr, %for.body93.preheader53 ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next2.3, %for.body93 ], [ %indvars.iv17.unr, %for.body93.preheader53 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv311, i64 %indvars.iv17
  %36 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv17
  %37 = bitcast double* %arrayidx99 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %39 = load <2 x double>, <2 x double>* %37, align 8
  %mul100 = fmul <2 x double> %38, %39
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.38, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv17, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv311, i64 %indvars.iv.next2.1
  %40 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next2.1
  %41 = bitcast double* %arrayidx99.2 to <2 x double>*
  %42 = load <2 x double>, <2 x double>* %40, align 8
  %43 = load <2 x double>, <2 x double>* %41, align 8
  %mul100.2 = fmul <2 x double> %42, %43
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next2.3 = add nsw i64 %indvars.iv17, 4
  %exitcond1.3 = icmp eq i64 %indvars.iv.next2.3, 2000
  br i1 %exitcond1.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %32, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv311, i64 %indvars.iv311
  %44 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %44
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv311
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next4 = add nsw i64 %indvars.iv311, -1
  %indvars.iv.next3 = add nsw i64 %indvars.iv210, -1
  %cmp87 = icmp sgt i64 %indvars.iv311, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv1 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv1 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv1
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
