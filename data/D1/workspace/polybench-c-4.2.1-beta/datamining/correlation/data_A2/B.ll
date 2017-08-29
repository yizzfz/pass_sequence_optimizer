; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  call void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, [1200 x double]* nocapture) #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %19, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %19 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge1
  %indvars.iv = phi i64 [ 0, %._crit_edge1 ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv1, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv1, %indvars.iv.next
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %16, %6
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond, label %20, label %._crit_edge1

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) #0 {
.lr.ph33.preheader:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca double, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  store double 1.000000e-01, double* %9, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %10 = ptrtoint double* %3 to i64
  br label %.lr.ph33

.lr.ph33:                                         ; preds = %._crit_edge30, %.lr.ph33.preheader
  %indvars.iv61 = phi i64 [ 0, %.lr.ph33.preheader ], [ %indvars.iv.next62, %._crit_edge30 ]
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv61
  store double 0.000000e+00, double* %11, align 8
  %sunkaddr86 = shl nuw nsw i64 %indvars.iv61, 3
  %sunkaddr87 = add i64 %sunkaddr, %sunkaddr86
  %sunkaddr88 = inttoptr i64 %sunkaddr87 to double*
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph33
  %indvars.iv58 = phi i64 [ 0, %.lr.ph33 ], [ %indvars.iv.next59.4, %._crit_edge1 ]
  %12 = phi double [ 0.000000e+00, %.lr.ph33 ], [ %27, %._crit_edge1 ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv58, i64 %indvars.iv61
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  store double %15, double* %sunkaddr88, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next59, i64 %indvars.iv61
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  store double %18, double* %sunkaddr88, align 8
  %indvars.iv.next59.1 = add nuw nsw i64 %indvars.iv58, 2
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next59.1, i64 %indvars.iv61
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  store double %21, double* %sunkaddr88, align 8
  %indvars.iv.next59.2 = add nuw nsw i64 %indvars.iv58, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next59.2, i64 %indvars.iv61
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  store double %24, double* %sunkaddr88, align 8
  %indvars.iv.next59.3 = add nuw nsw i64 %indvars.iv58, 4
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next59.3, i64 %indvars.iv61
  %26 = load double, double* %25, align 8
  %27 = fadd double %24, %26
  store double %27, double* %sunkaddr88, align 8
  %indvars.iv.next59.4 = add nuw nsw i64 %indvars.iv58, 5
  %exitcond60.4 = icmp eq i64 %indvars.iv.next59.4, 1400
  br i1 %exitcond60.4, label %._crit_edge30, label %._crit_edge1

._crit_edge30:                                    ; preds = %._crit_edge1
  %28 = fdiv double %27, %0
  %sunkaddr68 = shl i64 %indvars.iv61, 3
  %sunkaddr69 = add i64 %10, %sunkaddr68
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to double*
  store double %28, double* %sunkaddr70, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond63, label %.lr.ph26, label %.lr.ph33

.lr.ph26:                                         ; preds = %._crit_edge30
  %29 = load double*, double** %8, align 8
  %30 = load double, double* %9, align 8
  %sunkaddr89 = ptrtoint double* %3 to i64
  br label %.lr.ph22

.lr.ph22:                                         ; preds = %._crit_edge23, %.lr.ph26
  %indvars.iv55 = phi i64 [ 0, %.lr.ph26 ], [ %indvars.iv.next56, %._crit_edge23 ]
  %31 = phi double* [ %4, %.lr.ph26 ], [ %29, %._crit_edge23 ]
  %32 = getelementptr inbounds double, double* %31, i64 %indvars.iv55
  store double 0.000000e+00, double* %32, align 8
  %sunkaddr90 = shl nuw nsw i64 %indvars.iv55, 3
  %sunkaddr91 = add i64 %sunkaddr89, %sunkaddr90
  %sunkaddr92 = inttoptr i64 %sunkaddr91 to double*
  %sunkaddr93 = ptrtoint double* %31 to i64
  %sunkaddr94 = shl nuw nsw i64 %indvars.iv55, 3
  %sunkaddr95 = add i64 %sunkaddr93, %sunkaddr94
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to double*
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph22
  %indvars.iv52 = phi i64 [ 0, %.lr.ph22 ], [ %indvars.iv.next53.1, %._crit_edge2 ]
  %33 = phi double [ 0.000000e+00, %.lr.ph22 ], [ %45, %._crit_edge2 ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv52, i64 %indvars.iv55
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr92, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr96, align 8
  %indvars.iv.next53 = or i64 %indvars.iv52, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next53, i64 %indvars.iv55
  %41 = load double, double* %40, align 8
  %42 = load double, double* %sunkaddr92, align 8
  %43 = fsub double %41, %42
  %44 = fmul double %43, %43
  %45 = fadd double %39, %44
  store double %45, double* %sunkaddr96, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next53.1, 1400
  br i1 %exitcond54.1, label %._crit_edge23, label %._crit_edge2

._crit_edge23:                                    ; preds = %._crit_edge2
  %46 = fdiv double %45, %0
  %sunkaddr79 = ptrtoint double* %31 to i64
  %sunkaddr80 = shl i64 %indvars.iv55, 3
  %sunkaddr81 = add i64 %sunkaddr79, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  store double %46, double* %sunkaddr82, align 8
  %47 = getelementptr inbounds double, double* %29, i64 %indvars.iv55
  %48 = load double, double* %47, align 8
  %49 = call double @sqrt(double %48) #4
  %50 = fcmp ugt double %49, %30
  %. = select i1 %50, double %49, double 1.000000e+00
  store double %., double* %47, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond57, label %.lr.ph19.preheader, label %.lr.ph22

.lr.ph19.preheader:                               ; preds = %._crit_edge23
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %.lr.ph19.preheader, %._crit_edge16
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge16 ], [ 0, %.lr.ph19.preheader ]
  %51 = phi [1200 x double]* [ %64, %._crit_edge16 ], [ %1, %.lr.ph19.preheader ]
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %.lr.ph19
  %indvars.iv46 = phi i64 [ 0, %.lr.ph19 ], [ %indvars.iv.next47, %._crit_edge3 ]
  %52 = phi [1200 x double]* [ %51, %.lr.ph19 ], [ %64, %._crit_edge3 ]
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv46
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %52, i64 %indvars.iv49, i64 %indvars.iv46
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %58 = load double, double* %5, align 8
  %59 = call double @sqrt(double %58) #4
  %60 = load double*, double** %8, align 8
  %61 = getelementptr inbounds double, double* %60, i64 %indvars.iv46
  %62 = load double, double* %61, align 8
  %63 = fmul double %59, %62
  %64 = load [1200 x double]*, [1200 x double]** %6, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv49, i64 %indvars.iv46
  %66 = load double, double* %65, align 8
  %67 = fdiv double %66, %63
  store double %67, double* %65, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next47, 1200
  br i1 %exitcond48, label %._crit_edge16, label %._crit_edge3

._crit_edge16:                                    ; preds = %._crit_edge3
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next50, 1400
  br i1 %exitcond51, label %.lr.ph7.preheader.preheader, label %.lr.ph19

.lr.ph7.preheader.preheader:                      ; preds = %._crit_edge16
  br label %.lr.ph7.preheader

.lr.ph7.preheader:                                ; preds = %.lr.ph7.preheader.preheader, %._crit_edge8..lr.ph7.preheader_crit_edge
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge8..lr.ph7.preheader_crit_edge ], [ 0, %.lr.ph7.preheader.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge8..lr.ph7.preheader_crit_edge ], [ 1, %.lr.ph7.preheader.preheader ]
  %68 = phi [1200 x double]* [ %89, %._crit_edge8..lr.ph7.preheader_crit_edge ], [ %2, %.lr.ph7.preheader.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv43, i64 %indvars.iv43
  store double 1.000000e+00, double* %69, align 8
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %._crit_edge, %.lr.ph7.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv39, %.lr.ph7.preheader ], [ %indvars.iv.next42, %._crit_edge ]
  %70 = phi [1200 x double]* [ %68, %.lr.ph7.preheader ], [ %89, %._crit_edge ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv43, i64 %indvars.iv41
  store double 0.000000e+00, double* %71, align 8
  %72 = load [1200 x double]*, [1200 x double]** %6, align 8
  %73 = load [1200 x double]*, [1200 x double]** %7, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %73, i64 %indvars.iv43, i64 %indvars.iv41
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %.lr.ph7
  %indvars.iv = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next.1, %._crit_edge4 ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv, i64 %indvars.iv43
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv, i64 %indvars.iv41
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = load double, double* %74, align 8
  %81 = fadd double %80, %79
  store double %81, double* %74, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv.next, i64 %indvars.iv43
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv.next, i64 %indvars.iv41
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = load double, double* %74, align 8
  %88 = fadd double %87, %86
  store double %88, double* %74, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge, label %._crit_edge4

._crit_edge:                                      ; preds = %._crit_edge4
  %89 = load [1200 x double]*, [1200 x double]** %7, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %89, i64 %indvars.iv43, i64 %indvars.iv41
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %89, i64 %indvars.iv41, i64 %indvars.iv43
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond, label %._crit_edge8, label %.lr.ph7

._crit_edge8:                                     ; preds = %._crit_edge
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next44, 1199
  br i1 %exitcond45, label %._crit_edge11, label %._crit_edge8..lr.ph7.preheader_crit_edge

._crit_edge8..lr.ph7.preheader_crit_edge:         ; preds = %._crit_edge8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  br label %.lr.ph7.preheader

._crit_edge11:                                    ; preds = %._crit_edge8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %89, i64 1199, i64 1199
  store double 1.000000e+00, double* %95, align 8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly) #0 {
.lr.ph2.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv4 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next5, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge1 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge1

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
