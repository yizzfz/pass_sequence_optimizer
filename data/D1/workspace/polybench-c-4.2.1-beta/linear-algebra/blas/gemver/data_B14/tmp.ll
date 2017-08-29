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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %.._crit_edge_crit_edge33

.._crit_edge_crit_edge33:                         ; preds = %26
  br label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge33, %.._crit_edge_crit_edge, %29
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph35.split.us.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.lr.ph35.split.us

.lr.ph35.split.us:                                ; preds = %..loopexit_crit_edge.us..lr.ph35.split.us_crit_edge, %.lr.ph35.split.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.lr.ph35.split.us.preheader ], [ %indvars.iv.next2, %..loopexit_crit_edge.us..lr.ph35.split.us_crit_edge ]
  %11 = trunc i64 %indvars.iv1 to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %12, double* %13, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %14 = trunc i64 %indvars.iv.next2 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.000000e+03
  %17 = fmul double %16, 5.000000e-01
  %18 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  store double %17, double* %18, align 8
  %19 = fmul double %16, 2.500000e-01
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %19, double* %20, align 8
  %21 = fdiv double %16, 6.000000e+00
  %22 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  store double %21, double* %22, align 8
  %23 = fmul double %16, 1.250000e-01
  %24 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %23, double* %24, align 8
  %25 = fdiv double %16, 9.000000e+00
  %26 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %25, double* %26, align 8
  %27 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %27, align 8
  %28 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %28, align 8
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.._crit_edge4_crit_edge, %.lr.ph35.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph35.split.us ], [ %indvars.iv.next.1, %._crit_edge4.._crit_edge4_crit_edge ]
  %29 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %34 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 2000
  %37 = sitofp i32 %36 to double
  %38 = insertelement <2 x double> undef, double %32, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  %40 = fdiv <2 x double> %39, <double 2.000000e+03, double 2.000000e+03>
  %41 = bitcast double* %33 to <2 x double>*
  store <2 x double> %40, <2 x double>* %41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %..loopexit_crit_edge.us, label %._crit_edge4.._crit_edge4_crit_edge

._crit_edge4.._crit_edge4_crit_edge:              ; preds = %._crit_edge4
  br label %._crit_edge4

..loopexit_crit_edge.us:                          ; preds = %._crit_edge4
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge, label %..loopexit_crit_edge.us..lr.ph35.split.us_crit_edge

..loopexit_crit_edge.us..lr.ph35.split.us_crit_edge: ; preds = %..loopexit_crit_edge.us
  br label %.lr.ph35.split.us

._crit_edge:                                      ; preds = %..loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double*, double* nocapture readonly, double*, double* nocapture readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.preheader60.us.preheader:
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr24 = ptrtoint double* %5 to i64
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %._crit_edge72.us..preheader60.us_crit_edge, %.preheader60.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader60.us.preheader ], [ %indvars.iv.next17, %._crit_edge72.us..preheader60.us_crit_edge ]
  %sunkaddr21 = shl i64 %indvars.iv16, 3
  %sunkaddr22 = add i64 %sunkaddr, %sunkaddr21
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to double*
  %sunkaddr25 = shl i64 %indvars.iv16, 3
  %sunkaddr26 = add i64 %sunkaddr24, %sunkaddr25
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader60.us
  %indvars.iv13 = phi i64 [ 0, %.preheader60.us ], [ %indvars.iv.next14.1, %._crit_edge.._crit_edge_crit_edge ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %12 = load double, double* %11, align 8
  %13 = load double, double* %sunkaddr23, align 8
  %14 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %12, %16
  %18 = load double, double* %sunkaddr27, align 8
  %19 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %17, %21
  store double %22, double* %11, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %24 = load double, double* %23, align 8
  %25 = load double, double* %sunkaddr23, align 8
  %26 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %24, %28
  %30 = load double, double* %sunkaddr27, align 8
  %31 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %29, %33
  store double %34, double* %23, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %._crit_edge72.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge72.us:                                 ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %.preheader58.us.preheader, label %._crit_edge72.us..preheader60.us_crit_edge

._crit_edge72.us..preheader60.us_crit_edge:       ; preds = %._crit_edge72.us
  br label %.preheader60.us

.preheader58.us.preheader:                        ; preds = %._crit_edge72.us
  %sunkaddr28 = ptrtoint double* %8 to i64
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %._crit_edge68.us..preheader58.us_crit_edge, %.preheader58.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge68.us..preheader58.us_crit_edge ], [ 0, %.preheader58.us.preheader ]
  %sunkaddr29 = shl i64 %indvars.iv10, 3
  %sunkaddr30 = add i64 %sunkaddr28, %sunkaddr29
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to double*
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.._crit_edge19_crit_edge, %.preheader58.us
  %indvars.iv7 = phi i64 [ 0, %.preheader58.us ], [ %indvars.iv.next8.1, %._crit_edge19.._crit_edge19_crit_edge ]
  %35 = load double, double* %sunkaddr31, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %1
  %39 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %35, %41
  store double %42, double* %sunkaddr31, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %1
  %46 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %42, %48
  store double %49, double* %sunkaddr31, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %._crit_edge68.us, label %._crit_edge19.._crit_edge19_crit_edge

._crit_edge19.._crit_edge19_crit_edge:            ; preds = %._crit_edge19
  br label %._crit_edge19

._crit_edge68.us:                                 ; preds = %._crit_edge19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.lr.ph65.preheader, label %._crit_edge68.us..preheader58.us_crit_edge

._crit_edge68.us..preheader58.us_crit_edge:       ; preds = %._crit_edge68.us
  br label %.preheader58.us

.lr.ph65.preheader:                               ; preds = %._crit_edge68.us
  br label %.lr.ph65

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %sunkaddr33 = shl i64 %indvars.iv1, 3
  %sunkaddr34 = add i64 %sunkaddr32, %sunkaddr33
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to double*
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.._crit_edge20_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge20.._crit_edge20_crit_edge ]
  %50 = load double, double* %sunkaddr35, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %0
  %54 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %50, %56
  store double %57, double* %sunkaddr35, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %0
  %61 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %57, %63
  store double %64, double* %sunkaddr35, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge20.._crit_edge20_crit_edge

._crit_edge20.._crit_edge20_crit_edge:            ; preds = %._crit_edge20
  br label %._crit_edge20

._crit_edge.us:                                   ; preds = %._crit_edge20
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge63, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.lr.ph65:                                         ; preds = %.lr.ph65..lr.ph65_crit_edge, %.lr.ph65.preheader
  %indvars.iv4 = phi i64 [ %indvars.iv.next5.4, %.lr.ph65..lr.ph65_crit_edge ], [ 0, %.lr.ph65.preheader ]
  %65 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  store double %69, double* %65, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %70 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  store double %74, double* %70, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %75 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %78 = load double, double* %77, align 8
  %79 = fadd double %76, %78
  store double %79, double* %75, align 8
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv4, 3
  %80 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %83 = load double, double* %82, align 8
  %84 = fadd double %81, %83
  store double %84, double* %80, align 8
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv4, 4
  %85 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %88 = load double, double* %87, align 8
  %89 = fadd double %86, %88
  store double %89, double* %85, align 8
  %indvars.iv.next5.4 = add nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.us.preheader, label %.lr.ph65..lr.ph65_crit_edge

.lr.ph65..lr.ph65_crit_edge:                      ; preds = %.lr.ph65
  br label %.lr.ph65

.preheader.us.preheader:                          ; preds = %.lr.ph65
  %sunkaddr32 = ptrtoint double* %7 to i64
  br label %.preheader.us

._crit_edge63:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge..lr.ph_crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph..lr.ph._crit_edge_crit_edge

.lr.ph..lr.ph._crit_edge_crit_edge:               ; preds = %.lr.ph
  br label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph..lr.ph._crit_edge_crit_edge, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph._crit_edge..lr.ph_crit_edge

.lr.ph._crit_edge..lr.ph_crit_edge:               ; preds = %.lr.ph._crit_edge
  br label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
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
