; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %19, %2
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %19 ], [ 0, %2 ]
  %3 = trunc i64 %indvars.iv2 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv2
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph51.split.us.preheader:
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
  br label %.lr.ph51.split.us

.lr.ph51.split.us:                                ; preds = %._crit_edge.us, %.lr.ph51.split.us.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 0, %.lr.ph51.split.us.preheader ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv18
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr122 = shl nsw i64 %indvars.iv18, 3
  %sunkaddr123 = add i64 %sunkaddr, %sunkaddr122
  %sunkaddr124 = inttoptr i64 %sunkaddr123 to double*
  br label %11

; <label>:11:                                     ; preds = %11, %.lr.ph51.split.us
  %indvars.iv105 = phi i64 [ 0, %.lr.ph51.split.us ], [ %indvars.iv.next106.1.1, %11 ]
  %12 = phi double [ 0.000000e+00, %.lr.ph51.split.us ], [ %24, %11 ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv105, i64 %indvars.iv18
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr124, align 8
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next106, i64 %indvars.iv18
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr124, align 8
  %indvars.iv.next106.1 = or i64 %indvars.iv105, 2
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next106.1, i64 %indvars.iv18
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr124, align 8
  %indvars.iv.next106.129 = or i64 %indvars.iv105, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next106.129, i64 %indvars.iv18
  %23 = load double, double* %22, align 8
  %24 = fadd double %23, %21
  store double %24, double* %sunkaddr124, align 8
  %indvars.iv.next106.1.1 = add nsw i64 %indvars.iv105, 4
  %exitcond107.1.1 = icmp eq i64 %indvars.iv.next106.1.1, 1400
  br i1 %exitcond107.1.1, label %._crit_edge.us, label %11

._crit_edge.us:                                   ; preds = %11
  %25 = fdiv double %24, %0
  store double %25, double* %sunkaddr124, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond20, label %.lr.ph47.split.us.preheader, label %.lr.ph51.split.us

.lr.ph47.split.us.preheader:                      ; preds = %._crit_edge.us
  %26 = load double*, double** %8, align 8
  %27 = load double, double* %9, align 8
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %._crit_edge45.us, %.lr.ph47.split.us.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge45.us ], [ 0, %.lr.ph47.split.us.preheader ]
  %28 = phi double* [ %26, %._crit_edge45.us ], [ %4, %.lr.ph47.split.us.preheader ]
  %29 = getelementptr inbounds double, double* %28, i64 %indvars.iv15
  store double 0.000000e+00, double* %29, align 8
  %sunkaddr130 = shl nsw i64 %indvars.iv15, 3
  %sunkaddr131 = add i64 %sunkaddr, %sunkaddr130
  %sunkaddr132 = inttoptr i64 %sunkaddr131 to double*
  %sunkaddr133 = ptrtoint double* %28 to i64
  %sunkaddr135 = add i64 %sunkaddr133, %sunkaddr130
  %sunkaddr136 = inttoptr i64 %sunkaddr135 to double*
  br label %30

; <label>:30:                                     ; preds = %30, %.lr.ph47.split.us
  %indvars.iv99 = phi i64 [ 0, %.lr.ph47.split.us ], [ %indvars.iv.next100.1, %30 ]
  %31 = phi double [ 0.000000e+00, %.lr.ph47.split.us ], [ %43, %30 ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv15
  %33 = load double, double* %32, align 8
  %34 = load double, double* %sunkaddr132, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = fadd double %36, %31
  store double %37, double* %sunkaddr136, align 8
  %indvars.iv.next100 = or i64 %indvars.iv99, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next100, i64 %indvars.iv15
  %39 = load double, double* %38, align 8
  %40 = load double, double* %sunkaddr132, align 8
  %41 = fsub double %39, %40
  %42 = fmul double %41, %41
  %43 = fadd double %42, %37
  store double %43, double* %sunkaddr136, align 8
  %indvars.iv.next100.1 = add nuw nsw i64 %indvars.iv99, 2
  %exitcond101.1 = icmp eq i64 %indvars.iv.next100.1, 1400
  br i1 %exitcond101.1, label %._crit_edge45.us, label %30

._crit_edge45.us:                                 ; preds = %30
  %44 = fdiv double %43, %0
  store double %44, double* %sunkaddr136, align 8
  %45 = getelementptr inbounds double, double* %26, i64 %indvars.iv15
  %46 = load double, double* %45, align 8
  %47 = tail call double @sqrt(double %46) #4
  %48 = fcmp ugt double %47, %27
  %49 = select i1 %48, double %47, double 1.000000e+00
  store double %49, double* %45, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %._crit_edge9.._crit_edge11_crit_edge.us.preheader, label %.lr.ph47.split.us

._crit_edge9.._crit_edge11_crit_edge.us.preheader: ; preds = %._crit_edge45.us
  br label %._crit_edge9.._crit_edge11_crit_edge.us

._crit_edge9.._crit_edge11_crit_edge.us:          ; preds = %._crit_edge11._crit_edge.us, %._crit_edge9.._crit_edge11_crit_edge.us.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  %50 = phi [1200 x double]* [ %63, %._crit_edge11._crit_edge.us ], [ %1, %._crit_edge9.._crit_edge11_crit_edge.us.preheader ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us, %._crit_edge9.._crit_edge11_crit_edge.us
  %indvars.iv95 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %indvars.iv.next96, %._crit_edge11.us ]
  %51 = phi [1200 x double]* [ %50, %._crit_edge9.._crit_edge11_crit_edge.us ], [ %63, %._crit_edge11.us ]
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv95
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %51, i64 %indvars.iv12, i64 %indvars.iv95
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %57 = load double, double* %5, align 8
  %58 = tail call double @sqrt(double %57) #4
  %59 = load double*, double** %8, align 8
  %60 = getelementptr inbounds double, double* %59, i64 %indvars.iv95
  %61 = load double, double* %60, align 8
  %62 = fmul double %58, %61
  %63 = load [1200 x double]*, [1200 x double]** %6, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %63, i64 %indvars.iv12, i64 %indvars.iv95
  %65 = load double, double* %64, align 8
  %66 = fdiv double %65, %62
  store double %66, double* %64, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next96, 1200
  br i1 %exitcond97, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond14, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge9.._crit_edge11_crit_edge.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge11._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge12.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge12.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge12.us ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %67 = phi [1200 x double]* [ %72, %._crit_edge12.us ], [ %2, %.lr.ph.us.us.preheader.preheader ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv9, i64 %indvars.iv9
  store double 1.000000e+00, double* %68, align 8
  br label %.lr.ph.us.us

._crit_edge12.us:                                 ; preds = %._crit_edge24.us.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1199
  br i1 %exitcond11, label %._crit_edge12._crit_edge, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge24.us.us, %.lr.ph.us.us.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge24.us.us ], [ %indvars.iv5, %.lr.ph.us.us.preheader ]
  %69 = phi [1200 x double]* [ %72, %._crit_edge24.us.us ], [ %67, %.lr.ph.us.us.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv9, i64 %indvars.iv7
  store double 0.000000e+00, double* %70, align 8
  %71 = load [1200 x double]*, [1200 x double]** %6, align 8
  %72 = load [1200 x double]*, [1200 x double]** %7, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv9, i64 %indvars.iv7
  %.pre = load double, double* %73, align 8
  br label %75

._crit_edge24.us.us:                              ; preds = %75
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 %indvars.iv7, i64 %indvars.iv9
  store double %88, double* %74, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond, label %._crit_edge12.us, label %.lr.ph.us.us

; <label>:75:                                     ; preds = %75, %.lr.ph.us.us
  %76 = phi double [ %.pre, %.lr.ph.us.us ], [ %88, %75 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %75 ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv, i64 %indvars.iv9
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv, i64 %indvars.iv7
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %81, %76
  store double %82, double* %73, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv.next, i64 %indvars.iv9
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv.next, i64 %indvars.iv7
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %87, %82
  store double %88, double* %73, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge24.us.us, label %75

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12.us
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %72, i64 1199, i64 1199
  store double 1.000000e+00, double* %89, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge2_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge2_crit_edge.us

.._crit_edge2_crit_edge.us:                       ; preds = %._crit_edge2._crit_edge.us, %.._crit_edge2_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge2._crit_edge.us ], [ 0, %.._crit_edge2_crit_edge.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.._crit_edge2_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge2_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge2._crit_edge.us, label %6

._crit_edge2._crit_edge.us:                       ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge4, label %.._crit_edge2_crit_edge.us

._crit_edge4:                                     ; preds = %._crit_edge2._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
