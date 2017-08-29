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
  %5 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
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
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
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
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.loopexit._crit_edge

.loopexit:                                        ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %42, label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  store double %18, double* %19, align 8
  %20 = fmul double %17, 2.500000e-01
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %20, double* %21, align 8
  %22 = fdiv double %17, 6.000000e+00
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  store double %22, double* %23, align 8
  %24 = fmul double %17, 1.250000e-01
  %25 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %24, double* %25, align 8
  %26 = fdiv double %17, 9.000000e+00
  %27 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %29, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.loopexit._crit_edge
  %indvars.iv = phi i64 [ 0, %.loopexit._crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %30 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 2.000000e+03
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %36 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 2.000000e+03
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %40, double* %41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %._crit_edge

; <label>:42:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double*, double* nocapture readonly, double*, double* nocapture readonly, double*, double*, double* nocapture readonly, double* readonly) unnamed_addr #2 {
  br label %.preheader5

.preheader5:                                      ; preds = %24, %11
  %indvars.iv21 = phi i64 [ 0, %11 ], [ %indvars.iv.next22, %24 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader5
  %indvars.iv18 = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next19, %._crit_edge ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv18
  %13 = load double, double* %12, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr27 = mul i64 %indvars.iv21, 8
  %sunkaddr28 = add i64 %sunkaddr, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  %14 = load double, double* %sunkaddr29, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv18
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %13, %17
  %sunkaddr30 = ptrtoint double* %5 to i64
  %sunkaddr31 = mul i64 %indvars.iv21, 8
  %sunkaddr32 = add i64 %sunkaddr30, %sunkaddr31
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  %19 = load double, double* %sunkaddr33, align 8
  %20 = getelementptr inbounds double, double* %6, i64 %indvars.iv18
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  store double %23, double* %12, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond20, label %24, label %._crit_edge

; <label>:24:                                     ; preds = %._crit_edge
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond23, label %.preheader3.preheader, label %.preheader5

.preheader3.preheader:                            ; preds = %24
  br label %.preheader3

.preheader3:                                      ; preds = %41, %.preheader3.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader3.preheader ], [ %indvars.iv.next16, %41 ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader3
  %indvars.iv12 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next13.1, %._crit_edge1 ]
  %sunkaddr34 = ptrtoint double* %8 to i64
  %sunkaddr35 = mul i64 %indvars.iv15, 8
  %sunkaddr36 = add i64 %sunkaddr34, %sunkaddr35
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %25 = load double, double* %sunkaddr37, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv15
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %1
  %29 = getelementptr inbounds double, double* %9, i64 %indvars.iv12
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %25, %31
  store double %32, double* %sunkaddr37, align 8
  %indvars.iv.next13 = or i64 %indvars.iv12, 1
  %sunkaddr38 = ptrtoint double* %8 to i64
  %sunkaddr39 = mul i64 %indvars.iv15, 8
  %sunkaddr40 = add i64 %sunkaddr38, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  %33 = load double, double* %sunkaddr41, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next13, i64 %indvars.iv15
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %1
  %37 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next13
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %33, %39
  store double %40, double* %sunkaddr41, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next13.1, 2000
  br i1 %exitcond14.1, label %41, label %._crit_edge1

; <label>:41:                                     ; preds = %._crit_edge1
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond17, label %vector.memcheck, label %.preheader3

vector.memcheck:                                  ; preds = %41
  %scevgep = getelementptr double, double* %8, i64 2000
  %scevgep20 = getelementptr double, double* %10, i64 2000
  %bound0 = icmp ugt double* %scevgep20, %8
  %bound1 = icmp ugt double* %scevgep, %10
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader2.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.preheader2.preheader:                            ; preds = %vector.memcheck
  br label %.preheader2

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %42 = getelementptr inbounds double, double* %8, i64 %index
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !1, !noalias !4
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !1, !noalias !4
  %46 = getelementptr inbounds double, double* %10, i64 %index
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !4
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !4
  %50 = fadd <2 x double> %wide.load, %wide.load24
  %51 = fadd <2 x double> %wide.load23, %wide.load25
  %52 = bitcast double* %42 to <2 x double>*
  store <2 x double> %50, <2 x double>* %52, align 8, !alias.scope !1, !noalias !4
  %53 = bitcast double* %44 to <2 x double>*
  store <2 x double> %51, <2 x double>* %53, align 8, !alias.scope !1, !noalias !4
  %index.next = or i64 %index, 4
  %54 = getelementptr inbounds double, double* %8, i64 %index.next
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !1, !noalias !4
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load23.1 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !1, !noalias !4
  %58 = getelementptr inbounds double, double* %10, i64 %index.next
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load24.1 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !4
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load25.1 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !4
  %62 = fadd <2 x double> %wide.load.1, %wide.load24.1
  %63 = fadd <2 x double> %wide.load23.1, %wide.load25.1
  %64 = bitcast double* %54 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !1, !noalias !4
  %65 = bitcast double* %56 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !1, !noalias !4
  %index.next.1 = add nsw i64 %index, 8
  %66 = icmp eq i64 %index.next.1, 2000
  br i1 %66, label %.preheader.preheader.loopexit50, label %vector.body, !llvm.loop !6

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next10.4, %.preheader2 ]
  %67 = getelementptr inbounds double, double* %8, i64 %indvars.iv9
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds double, double* %10, i64 %indvars.iv9
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  store double %71, double* %67, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %72 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next10
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next10
  %75 = load double, double* %74, align 8
  %76 = fadd double %73, %75
  store double %76, double* %72, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %77 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next10.1
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next10.1
  %80 = load double, double* %79, align 8
  %81 = fadd double %78, %80
  store double %81, double* %77, align 8
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv9, 3
  %82 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next10.2
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next10.2
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  store double %86, double* %82, align 8
  %indvars.iv.next10.3 = add nsw i64 %indvars.iv9, 4
  %87 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next10.3
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next10.3
  %90 = load double, double* %89, align 8
  %91 = fadd double %88, %90
  store double %91, double* %87, align 8
  %indvars.iv.next10.4 = add nsw i64 %indvars.iv9, 5
  %exitcond11.4 = icmp eq i64 %indvars.iv.next10.4, 2000
  br i1 %exitcond11.4, label %.preheader.preheader.loopexit, label %.preheader2, !llvm.loop !9

.preheader.preheader.loopexit:                    ; preds = %.preheader2
  br label %.preheader.preheader

.preheader.preheader.loopexit50:                  ; preds = %vector.body
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit50, %.preheader.preheader.loopexit
  br label %.preheader

.preheader:                                       ; preds = %108, %.preheader.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next7, %108 ]
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge2 ]
  %sunkaddr42 = ptrtoint double* %7 to i64
  %sunkaddr43 = mul i64 %indvars.iv6, 8
  %sunkaddr44 = add i64 %sunkaddr42, %sunkaddr43
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to double*
  %92 = load double, double* %sunkaddr45, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, %0
  %96 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fadd double %92, %98
  store double %99, double* %sunkaddr45, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %sunkaddr46 = ptrtoint double* %7 to i64
  %sunkaddr47 = mul i64 %indvars.iv6, 8
  %sunkaddr48 = add i64 %sunkaddr46, %sunkaddr47
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  %100 = load double, double* %sunkaddr49, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv.next
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, %0
  %104 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = fadd double %100, %106
  store double %107, double* %sunkaddr49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %108, label %._crit_edge2

; <label>:108:                                    ; preds = %._crit_edge2
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond8, label %109, label %.preheader

; <label>:109:                                    ; preds = %108
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge1

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
