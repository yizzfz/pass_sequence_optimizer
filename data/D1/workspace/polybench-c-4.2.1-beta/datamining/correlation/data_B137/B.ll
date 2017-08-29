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
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %19 ], [ 0, %2 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge2 ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
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
  br i1 %exitcond.1, label %19, label %._crit_edge2

; <label>:19:                                     ; preds = %._crit_edge2
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph74.split.us.preheader:
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
  br label %.lr.ph74.split.us

.lr.ph74.split.us:                                ; preds = %._crit_edge71.us, %.lr.ph74.split.us.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge71.us ], [ 0, %.lr.ph74.split.us.preheader ]
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv18
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr139 = shl nsw i64 %indvars.iv18, 3
  %sunkaddr140 = add i64 %sunkaddr, %sunkaddr139
  %sunkaddr141 = inttoptr i64 %sunkaddr140 to double*
  br label %._crit_edge126

._crit_edge126:                                   ; preds = %._crit_edge126, %.lr.ph74.split.us
  %indvars.iv120 = phi i64 [ 0, %.lr.ph74.split.us ], [ %indvars.iv.next121.1.1, %._crit_edge126 ]
  %11 = phi double [ 0.000000e+00, %.lr.ph74.split.us ], [ %23, %._crit_edge126 ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv120, i64 %indvars.iv18
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr141, align 8
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next121, i64 %indvars.iv18
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr141, align 8
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next121.1, i64 %indvars.iv18
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr141, align 8
  %indvars.iv.next121.131 = or i64 %indvars.iv120, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next121.131, i64 %indvars.iv18
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %sunkaddr141, align 8
  %indvars.iv.next121.1.1 = add nsw i64 %indvars.iv120, 4
  %exitcond122.1.1 = icmp eq i64 %indvars.iv.next121.1.1, 1400
  br i1 %exitcond122.1.1, label %._crit_edge71.us, label %._crit_edge126

._crit_edge71.us:                                 ; preds = %._crit_edge126
  %24 = fdiv double %23, %0
  store double %24, double* %sunkaddr141, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond20, label %.lr.ph68.split.us.preheader, label %.lr.ph74.split.us

.lr.ph68.split.us.preheader:                      ; preds = %._crit_edge71.us
  br label %.lr.ph68.split.us

.lr.ph68.split.us:                                ; preds = %._crit_edge66.us, %.lr.ph68.split.us.preheader
  %indvars.iv25 = phi i64 [ 0, %.lr.ph68.split.us.preheader ], [ %indvars.iv.next26, %._crit_edge66.us ]
  %indvars.iv15 = phi i64 [ 0, %.lr.ph68.split.us.preheader ], [ %indvars.iv.next16, %._crit_edge66.us ]
  %25 = phi double* [ %4, %.lr.ph68.split.us.preheader ], [ %41, %._crit_edge66.us ]
  %26 = getelementptr inbounds double, double* %25, i64 %indvars.iv15
  store double 0.000000e+00, double* %26, align 8
  %sunkaddr147 = shl nsw i64 %indvars.iv15, 3
  %sunkaddr148 = add i64 %sunkaddr, %sunkaddr147
  %sunkaddr149 = inttoptr i64 %sunkaddr148 to double*
  %sunkaddr150 = ptrtoint double* %25 to i64
  %sunkaddr152 = add i64 %sunkaddr150, %sunkaddr147
  %sunkaddr153 = inttoptr i64 %sunkaddr152 to double*
  br label %._crit_edge127

._crit_edge127:                                   ; preds = %._crit_edge127, %.lr.ph68.split.us
  %indvars.iv114 = phi i64 [ 0, %.lr.ph68.split.us ], [ %indvars.iv.next115.1, %._crit_edge127 ]
  %27 = phi double [ 0.000000e+00, %.lr.ph68.split.us ], [ %39, %._crit_edge127 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv15
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr149, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %32, %27
  store double %33, double* %sunkaddr153, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next115, i64 %indvars.iv15
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr149, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %38, %33
  store double %39, double* %sunkaddr153, align 8
  %indvars.iv.next115.1 = add nuw nsw i64 %indvars.iv114, 2
  %exitcond116.1 = icmp eq i64 %indvars.iv.next115.1, 1400
  br i1 %exitcond116.1, label %._crit_edge66.us, label %._crit_edge127

._crit_edge66.us:                                 ; preds = %._crit_edge127
  %40 = fdiv double %39, %0
  store double %40, double* %sunkaddr153, align 8
  %41 = load double*, double** %8, align 8
  %42 = getelementptr inbounds double, double* %41, i64 %indvars.iv15
  %43 = load double, double* %42, align 8
  %44 = tail call double @sqrt(double %43) #4
  store double %44, double* %42, align 8
  %45 = load double, double* %9, align 8
  %46 = fcmp ugt double %44, %45
  %47 = select i1 %46, double %44, double 1.000000e+00
  %sunkaddr158 = ptrtoint double* %41 to i64
  %sunkaddr160 = add i64 %sunkaddr158, %indvars.iv25
  %sunkaddr161 = inttoptr i64 %sunkaddr160 to double*
  store double %47, double* %sunkaddr161, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 8
  br i1 %exitcond17, label %._crit_edge11.us.preheader, label %.lr.ph68.split.us

._crit_edge11.us.preheader:                       ; preds = %._crit_edge66.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge61.us, %._crit_edge11.us.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge61.us ], [ 0, %._crit_edge11.us.preheader ]
  %48 = phi [1200 x double]* [ %61, %._crit_edge61.us ], [ %1, %._crit_edge11.us.preheader ]
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128, %._crit_edge11.us
  %indvars.iv110 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next111, %._crit_edge128 ]
  %49 = phi [1200 x double]* [ %48, %._crit_edge11.us ], [ %61, %._crit_edge128 ]
  %50 = getelementptr inbounds double, double* %3, i64 %indvars.iv110
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %indvars.iv12, i64 %indvars.iv110
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %51
  store double %54, double* %52, align 8
  %55 = load double, double* %5, align 8
  %56 = tail call double @sqrt(double %55) #4
  %57 = load double*, double** %8, align 8
  %58 = getelementptr inbounds double, double* %57, i64 %indvars.iv110
  %59 = load double, double* %58, align 8
  %60 = fmul double %56, %59
  %61 = load [1200 x double]*, [1200 x double]** %6, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %61, i64 %indvars.iv12, i64 %indvars.iv110
  %63 = load double, double* %62, align 8
  %64 = fdiv double %63, %60
  store double %64, double* %62, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next111, 1200
  br i1 %exitcond112, label %._crit_edge61.us, label %._crit_edge128

._crit_edge61.us:                                 ; preds = %._crit_edge128
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond14, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge11.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge61.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge48.us-lcssa.us.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge48.us-lcssa.us.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge48.us-lcssa.us.us ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %65 = phi [1200 x double]* [ %70, %._crit_edge48.us-lcssa.us.us ], [ %2, %.lr.ph.us.us.preheader.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %65, i64 %indvars.iv9, i64 %indvars.iv9
  store double 1.000000e+00, double* %66, align 8
  br label %.lr.ph.us.us

._crit_edge48.us-lcssa.us.us:                     ; preds = %._crit_edge43.us.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1199
  br i1 %exitcond11, label %._crit_edge50, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge43.us.us, %.lr.ph.us.us.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge43.us.us ], [ %indvars.iv5, %.lr.ph.us.us.preheader ]
  %67 = phi [1200 x double]* [ %70, %._crit_edge43.us.us ], [ %65, %.lr.ph.us.us.preheader ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv9, i64 %indvars.iv7
  store double 0.000000e+00, double* %68, align 8
  %69 = load [1200 x double]*, [1200 x double]** %6, align 8
  %70 = load [1200 x double]*, [1200 x double]** %7, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv9, i64 %indvars.iv7
  %.pre = load double, double* %71, align 8
  br label %._crit_edge129

._crit_edge43.us.us:                              ; preds = %._crit_edge129
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv7, i64 %indvars.iv9
  store double %85, double* %72, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond, label %._crit_edge48.us-lcssa.us.us, label %.lr.ph.us.us

._crit_edge129:                                   ; preds = %._crit_edge129, %.lr.ph.us.us
  %73 = phi double [ %.pre, %.lr.ph.us.us ], [ %85, %._crit_edge129 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge129 ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv, i64 %indvars.iv9
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv, i64 %indvars.iv7
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %78, %73
  store double %79, double* %71, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv.next, i64 %indvars.iv9
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv.next, i64 %indvars.iv7
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %84, %79
  store double %85, double* %71, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge43.us.us, label %._crit_edge129

._crit_edge50:                                    ; preds = %._crit_edge48.us-lcssa.us.us
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 1199, i64 1199
  store double 1.000000e+00, double* %86, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us, %._crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge3.us ], [ 0, %._crit_edge.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge6

._crit_edge3.us:                                  ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge5, label %._crit_edge.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
