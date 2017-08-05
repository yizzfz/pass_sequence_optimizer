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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  tail call void @free(i8* %call3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A, double* %b, double* %x, double* %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv4661 = phi i64 [ 0, %entry ], [ %indvars.iv.next47.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv4661
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv4661
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv4661 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv4661
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv4661, 2
  %4 = trunc i64 %indvars.iv.next47.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond68.1 = icmp eq i64 %indvars.iv.next47.1, 2000
  br i1 %exitcond68.1, label %for.cond13.preheader.preheader, label %for.body

for.cond13.preheader.preheader:                   ; preds = %for.body
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.cond13.preheader.preheader, %for.end39
  %indvars.iv4260 = phi i64 [ %indvars.iv.next43, %for.end39 ], [ 1, %for.cond13.preheader.preheader ]
  %indvars.iv4459 = phi i64 [ %indvars.iv.next45, %for.end39 ], [ 0, %for.cond13.preheader.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv4459, 2001
  %7 = add nuw nsw i64 %6, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %7
  %8 = mul nsw i64 %indvars.iv4459, -8
  %9 = add nsw i64 %8, 15992
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %exitcond4157 = icmp eq i64 %indvars.iv4459, 1999
  br i1 %exitcond4157, label %for.end39.thread, label %for.end39

for.end39.thread:                                 ; preds = %for.cond29.preheader
  %arrayidx431 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4459, i64 %indvars.iv4459
  store double 1.000000e+00, double* %arrayidx431, align 8
  br label %for.cond65.preheader

for.body16:                                       ; preds = %for.cond13.preheader, %for.body16
  %indvars.iv2955 = phi i64 [ 0, %for.cond13.preheader ], [ %indvars.iv.next30, %for.body16 ]
  %10 = sub nsw i64 0, %indvars.iv2955
  %11 = trunc i64 %10 to i32
  %rem = srem i32 %11, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4459, i64 %indvars.iv2955
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv2955, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next30, %indvars.iv4260
  br i1 %exitcond35, label %for.cond29.preheader, label %for.body16

for.end39:                                        ; preds = %for.cond29.preheader
  %12 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %12, i8 0, i64 %9, i32 8, i1 false)
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4459, i64 %indvars.iv4459
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv4459, 1
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv4260, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond67, label %for.cond65.preheader.loopexit, label %for.cond13.preheader

for.cond65.preheader.loopexit:                    ; preds = %for.end39
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond65.preheader.loopexit, %for.end39.thread
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.inc96, %for.cond65.preheader
  %indvars.iv2152 = phi i64 [ 0, %for.cond65.preheader ], [ %indvars.iv.next22, %for.inc96 ]
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.cond69.preheader, %for.inc93
  %indvars.iv1751 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next18, %for.inc93 ]
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1751, i64 %indvars.iv2152
  br label %for.body76

for.body76:                                       ; preds = %for.body76, %for.cond73.preheader
  %indvars.iv1350 = phi i64 [ 0, %for.cond73.preheader ], [ %indvars.iv.next14.1, %for.body76 ]
  %14 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1350, i64 %indvars.iv2152
  %15 = load double, double* %arrayidx84, align 8
  %mul = fmul double %14, %15
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv1751, i64 %indvars.iv1350
  %16 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %16, %mul
  store double %add89, double* %arrayidx88, align 8
  %indvars.iv.next14 = or i64 %indvars.iv1350, 1
  %17 = load double, double* %arrayidx80, align 8
  %arrayidx84.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next14, i64 %indvars.iv2152
  %18 = load double, double* %arrayidx84.1, align 8
  %mul.1 = fmul double %17, %18
  %arrayidx88.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv1751, i64 %indvars.iv.next14
  %19 = load double, double* %arrayidx88.1, align 8
  %add89.1 = fadd double %19, %mul.1
  store double %add89.1, double* %arrayidx88.1, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv1350, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond16.1, label %for.inc93, label %for.body76

for.inc93:                                        ; preds = %for.body76
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv1751, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, 2000
  br i1 %exitcond20, label %for.inc96, label %for.cond73.preheader

for.inc96:                                        ; preds = %for.inc93
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2152, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond64, label %for.cond103.preheader.preheader, label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.inc96
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.cond103.preheader.preheader, %for.inc118
  %indvars.iv1149 = phi i64 [ %indvars.iv.next12, %for.inc118 ], [ 0, %for.cond103.preheader.preheader ]
  br label %for.body106

for.body106:                                      ; preds = %for.body106, %for.cond103.preheader
  %indvars.iv48 = phi i64 [ 0, %for.cond103.preheader ], [ %indvars.iv.next.4, %for.body106 ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv1149, i64 %indvars.iv48
  %21 = bitcast double* %arrayidx110 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1149, i64 %indvars.iv48
  %23 = bitcast double* %arrayidx114 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv48, 1
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv1149, i64 %indvars.iv.next
  %24 = bitcast double* %arrayidx110.1 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1149, i64 %indvars.iv.next
  %26 = bitcast double* %arrayidx114.1 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv48, 2
  %arrayidx110.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv1149, i64 %indvars.iv.next.1
  %27 = bitcast double* %arrayidx110.2 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx114.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1149, i64 %indvars.iv.next.1
  %29 = bitcast double* %arrayidx114.2 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv48, 3
  %arrayidx110.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv1149, i64 %indvars.iv.next.2
  %30 = bitcast double* %arrayidx110.3 to i64*
  %31 = load i64, i64* %30, align 8
  %arrayidx114.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1149, i64 %indvars.iv.next.2
  %32 = bitcast double* %arrayidx114.3 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv48, 4
  %arrayidx110.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv1149, i64 %indvars.iv.next.3
  %33 = bitcast double* %arrayidx110.4 to i64*
  %34 = load i64, i64* %33, align 8
  %arrayidx114.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1149, i64 %indvars.iv.next.3
  %35 = bitcast double* %arrayidx114.4 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv48, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.inc118, label %for.body106

for.inc118:                                       ; preds = %for.body106
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1149, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond63, label %for.end120, label %for.cond103.preheader

for.end120:                                       ; preds = %for.inc118
  tail call void @free(i8* nonnull %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* %A, double* %b, double* %x, double* %y) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.backedge, %entry
  %indvars.iv4469 = phi i64 [ 0, %entry ], [ %indvars.iv4469.be, %for.cond1.preheader.backedge ]
  %exitcond3261 = icmp eq i64 %indvars.iv4469, 0
  br i1 %exitcond3261, label %for.cond1.preheader.backedge, label %for.body3.preheader

for.cond1.preheader.backedge:                     ; preds = %for.cond1.preheader, %for.body30.lr.ph, %for.inc58
  %indvars.iv4469.be = phi i64 [ %indvars.iv.next45, %for.inc58 ], [ 1, %for.body30.lr.ph ], [ 1, %for.cond1.preheader ]
  br label %for.cond1.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4469, i64 0
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.end
  %exitcond3763 = icmp eq i64 %indvars.iv4469, 0
  br i1 %exitcond3763, label %for.cond1.preheader.backedge, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.lr.ph
  %xtraiter8 = and i64 %indvars.iv4469, 1
  %lcmp.mod9 = icmp eq i64 %xtraiter8, 0
  %0 = icmp eq i64 %indvars.iv4469, 1
  %arrayidx41.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4469, i64 0
  br label %for.body30

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv2762 = phi i64 [ %indvars.iv.next28, %for.end ], [ 0, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4469, i64 %indvars.iv2762
  %1 = load double, double* %arrayidx5, align 8
  %exitcond2658 = icmp eq i64 %indvars.iv2762, 0
  br i1 %exitcond2658, label %for.end, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body3
  %xtraiter5 = and i64 %indvars.iv2762, 1
  %lcmp.mod6 = icmp eq i64 %xtraiter5, 0
  br i1 %lcmp.mod6, label %for.body8.prol.loopexit, label %for.body8.prol

for.body8.prol:                                   ; preds = %for.body8.preheader
  %2 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv2762
  %3 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %2, %3
  %sub.prol = fsub double %1, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol, %for.body8.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader ]
  %.unr7.ph = phi double [ %sub.prol, %for.body8.prol ], [ %1, %for.body8.preheader ]
  %indvars.iv2259.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader ]
  %4 = icmp eq i64 %indvars.iv2762, 1
  br i1 %4, label %for.end, label %for.body8.preheader25

for.body8.preheader25:                            ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader25, %for.body8
  %5 = phi double [ %sub.1, %for.body8 ], [ %.unr7.ph, %for.body8.preheader25 ]
  %indvars.iv2259 = phi i64 [ %indvars.iv.next23.1, %for.body8 ], [ %indvars.iv2259.unr.ph, %for.body8.preheader25 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4469, i64 %indvars.iv2259
  %6 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2259, i64 %indvars.iv2762
  %7 = load double, double* %arrayidx16, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2259, 1
  %8 = load <2 x double>, <2 x double>* %6, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next23, i64 %indvars.iv2762
  %9 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %7, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %9, i32 1
  %mul = fmul <2 x double> %8, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %5, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv2259, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next23.1, %indvars.iv2762
  br i1 %exitcond26.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit, %for.body3
  %.lcssa47 = phi double [ %1, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2762, i64 %indvars.iv2762
  %10 = load double, double* %arrayidx20, align 8
  %div = fdiv double %.lcssa47, %10
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2762, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next28, %indvars.iv4469
  br i1 %exitcond32, label %for.body30.lr.ph, label %for.body3

for.body30:                                       ; preds = %for.body30.preheader, %for.cond35.for.end50_crit_edge
  %indvars.iv4067 = phi i64 [ %indvars.iv.next41, %for.cond35.for.end50_crit_edge ], [ %indvars.iv4469, %for.body30.preheader ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4469, i64 %indvars.iv4067
  %11 = load double, double* %arrayidx34, align 8
  br i1 %lcmp.mod9, label %for.body37.prol.loopexit, label %for.body37.prol

for.body37.prol:                                  ; preds = %for.body30
  %12 = load double, double* %arrayidx41.prol, align 8
  %arrayidx45.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv4067
  %13 = load double, double* %arrayidx45.prol, align 8
  %mul46.prol = fmul double %12, %13
  %sub47.prol = fsub double %11, %mul46.prol
  br label %for.body37.prol.loopexit

for.body37.prol.loopexit:                         ; preds = %for.body37.prol, %for.body30
  %sub47.lcssa.unr.ph = phi double [ %sub47.prol, %for.body37.prol ], [ undef, %for.body30 ]
  %.unr10.ph = phi double [ %sub47.prol, %for.body37.prol ], [ %11, %for.body30 ]
  %indvars.iv3364.unr.ph = phi i64 [ 1, %for.body37.prol ], [ 0, %for.body30 ]
  br i1 %0, label %for.cond35.for.end50_crit_edge, label %for.body37.preheader

for.body37.preheader:                             ; preds = %for.body37.prol.loopexit
  br label %for.body37

for.body37:                                       ; preds = %for.body37.preheader, %for.body37
  %14 = phi double [ %sub47.1, %for.body37 ], [ %.unr10.ph, %for.body37.preheader ]
  %indvars.iv3364 = phi i64 [ %indvars.iv.next34.1, %for.body37 ], [ %indvars.iv3364.unr.ph, %for.body37.preheader ]
  %arrayidx41 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4469, i64 %indvars.iv3364
  %15 = bitcast double* %arrayidx41 to <2 x double>*
  %arrayidx45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3364, i64 %indvars.iv4067
  %16 = load double, double* %arrayidx45, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3364, 1
  %17 = load <2 x double>, <2 x double>* %15, align 8
  %arrayidx45.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv4067
  %18 = load double, double* %arrayidx45.1, align 8
  %mul46.v.i1.1 = insertelement <2 x double> undef, double %16, i32 0
  %mul46.v.i1.2 = insertelement <2 x double> %mul46.v.i1.1, double %18, i32 1
  %mul46 = fmul <2 x double> %17, %mul46.v.i1.2
  %mul46.v.r1 = extractelement <2 x double> %mul46, i32 0
  %mul46.v.r2 = extractelement <2 x double> %mul46, i32 1
  %sub47 = fsub double %14, %mul46.v.r1
  %sub47.1 = fsub double %sub47, %mul46.v.r2
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv3364, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next34.1, %indvars.iv4469
  br i1 %exitcond37.1, label %for.cond35.for.end50_crit_edge.loopexit, label %for.body37

for.cond35.for.end50_crit_edge.loopexit:          ; preds = %for.body37
  br label %for.cond35.for.end50_crit_edge

for.cond35.for.end50_crit_edge:                   ; preds = %for.cond35.for.end50_crit_edge.loopexit, %for.body37.prol.loopexit
  %sub47.lcssa = phi double [ %sub47.lcssa.unr.ph, %for.body37.prol.loopexit ], [ %sub47.1, %for.cond35.for.end50_crit_edge.loopexit ]
  store double %sub47.lcssa, double* %arrayidx34, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv4067, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 2000
  br i1 %exitcond43, label %for.inc58, label %for.body30

for.inc58:                                        ; preds = %for.cond35.for.end50_crit_edge
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv4469, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond75, label %for.body63.preheader, label %for.cond1.preheader.backedge

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.backedge, %for.body63.preheader
  %indvars.iv2057 = phi i64 [ 0, %for.body63.preheader ], [ %indvars.iv2057.be, %for.body63.backedge ]
  %19 = add i64 %indvars.iv2057, -1
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv2057
  %20 = bitcast double* %arrayidx65 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = bitcast i64 %21 to double
  %exitcond54 = icmp eq i64 %indvars.iv2057, 0
  br i1 %exitcond54, label %for.end79.thread, label %for.body68.preheader

for.end79.thread:                                 ; preds = %for.body63
  %arrayidx8114 = getelementptr inbounds double, double* %y, i64 %indvars.iv2057
  %23 = bitcast double* %arrayidx8114 to i64*
  store i64 %21, i64* %23, align 8
  br label %for.body63.backedge

for.body68.preheader:                             ; preds = %for.body63
  %xtraiter1 = and i64 %indvars.iv2057, 3
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  br i1 %lcmp.mod2, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol.preheader, %for.body68.prol
  %24 = phi double [ %sub76.prol, %for.body68.prol ], [ %22, %for.body68.prol.preheader ]
  %indvars.iv1655.prol = phi i64 [ %indvars.iv.next17.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %prol.iter3 = phi i64 [ %prol.iter3.sub, %for.body68.prol ], [ %xtraiter1, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2057, i64 %indvars.iv1655.prol
  %25 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv1655.prol
  %26 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %25, %26
  %sub76.prol = fsub double %24, %mul75.prol
  %indvars.iv.next17.prol = add nuw nsw i64 %indvars.iv1655.prol, 1
  %prol.iter3.sub = add i64 %prol.iter3, -1
  %prol.iter3.cmp = icmp eq i64 %prol.iter3.sub, 0
  br i1 %prol.iter3.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !1

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %.unr4 = phi double [ %22, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv1655.unr = phi i64 [ 0, %for.body68.preheader ], [ %indvars.iv.next17.prol, %for.body68.prol.loopexit.loopexit ]
  %27 = icmp ult i64 %19, 3
  br i1 %27, label %for.end79, label %for.body68.preheader24

for.body68.preheader24:                           ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68.preheader24, %for.body68
  %28 = phi double [ %sub76.3, %for.body68 ], [ %.unr4, %for.body68.preheader24 ]
  %indvars.iv1655 = phi i64 [ %indvars.iv.next17.3, %for.body68 ], [ %indvars.iv1655.unr, %for.body68.preheader24 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2057, i64 %indvars.iv1655
  %29 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv1655
  %30 = bitcast double* %arrayidx74 to <2 x double>*
  %31 = load <2 x double>, <2 x double>* %29, align 8
  %32 = load <2 x double>, <2 x double>* %30, align 8
  %mul75 = fmul <2 x double> %31, %32
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %28, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv1655, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2057, i64 %indvars.iv.next17.1
  %33 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next17.1
  %34 = bitcast double* %arrayidx74.2 to <2 x double>*
  %35 = load <2 x double>, <2 x double>* %33, align 8
  %36 = load <2 x double>, <2 x double>* %34, align 8
  %mul75.2 = fmul <2 x double> %35, %36
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next17.3 = add nsw i64 %indvars.iv1655, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next17.3, %indvars.iv2057
  br i1 %exitcond.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv2057
  store double %sub76.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2057, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next21, 2000
  br i1 %exitcond74, label %for.body88.preheader, label %for.body63.backedge

for.body63.backedge:                              ; preds = %for.end79, %for.end79.thread
  %indvars.iv2057.be = phi i64 [ %indvars.iv.next21, %for.end79 ], [ 1, %for.end79.thread ]
  br label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvar = phi i64 [ %indvar.next, %for.end104 ], [ 0, %for.body88.preheader ]
  %indvars.iv.next1553 = phi i64 [ %indvars.iv.next15, %for.end104 ], [ 1999, %for.body88.preheader ]
  %37 = add i64 %indvar, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next1553
  %38 = load double, double* %arrayidx90, align 8
  %indvars.iv.next1349 = add nuw nsw i64 %indvars.iv.next1553, 1
  %cmp9250 = icmp slt i64 %indvars.iv.next1349, 2000
  br i1 %cmp9250, label %for.body93.preheader, label %for.end104

for.body93.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.preheader
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol.preheader, %for.body93.prol
  %indvars.iv.next1351.prol = phi i64 [ %indvars.iv.next13.prol, %for.body93.prol ], [ %indvars.iv.next1349, %for.body93.prol.preheader ]
  %39 = phi double [ %sub101.prol, %for.body93.prol ], [ %38, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next1553, i64 %indvars.iv.next1351.prol
  %40 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv.next1351.prol
  %41 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %40, %41
  %sub101.prol = fsub double %39, %mul100.prol
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv.next1351.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !3

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.preheader
  %indvars.iv.next1351.unr = phi i64 [ %indvars.iv.next1349, %for.body93.preheader ], [ %indvars.iv.next13.prol, %for.body93.prol.loopexit.loopexit ]
  %.unr = phi double [ %38, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %42 = icmp ult i64 %37, 3
  br i1 %42, label %for.end104, label %for.body93.preheader23

for.body93.preheader23:                           ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93.preheader23, %for.body93
  %indvars.iv.next1351 = phi i64 [ %indvars.iv.next13.3, %for.body93 ], [ %indvars.iv.next1351.unr, %for.body93.preheader23 ]
  %43 = phi double [ %sub101.3, %for.body93 ], [ %.unr, %for.body93.preheader23 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next1553, i64 %indvars.iv.next1351
  %44 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next1351
  %45 = bitcast double* %arrayidx99 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %44, align 8
  %47 = load <2 x double>, <2 x double>* %45, align 8
  %mul100 = fmul <2 x double> %46, %47
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %43, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv.next1351, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next1553, i64 %indvars.iv.next13.1
  %48 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next13.1
  %49 = bitcast double* %arrayidx99.2 to <2 x double>*
  %50 = load <2 x double>, <2 x double>* %48, align 8
  %51 = load <2 x double>, <2 x double>* %49, align 8
  %mul100.2 = fmul <2 x double> %50, %51
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv.next1351, 4
  %exitcond73.3 = icmp eq i64 %indvars.iv.next13.3, 2000
  br i1 %exitcond73.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %.lcssa = phi double [ %38, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next1553, i64 %indvars.iv.next1553
  %52 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %.lcssa, %52
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next1553
  store double %div109, double* %arrayidx111, align 8
  %indvars.iv.next15 = add nsw i64 %indvars.iv.next1553, -1
  %cmp87 = icmp sgt i64 %indvars.iv.next1553, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
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
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
