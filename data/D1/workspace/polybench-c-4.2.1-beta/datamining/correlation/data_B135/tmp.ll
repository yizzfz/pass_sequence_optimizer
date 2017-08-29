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
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge4

.._crit_edge_crit_edge4:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge4, %.._crit_edge_crit_edge, %17
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

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %2
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.._crit_edge_crit_edge ], [ 0, %2 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.._crit_edge2_crit_edge, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge2.._crit_edge2_crit_edge ]
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
  br i1 %exitcond.1, label %19, label %._crit_edge2.._crit_edge2_crit_edge

._crit_edge2.._crit_edge2_crit_edge:              ; preds = %._crit_edge2
  br label %._crit_edge2

; <label>:19:                                     ; preds = %._crit_edge2
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %19
  br label %._crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph55.split.us.preheader:
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
  %10 = ptrtoint double* %3 to i64
  br label %.lr.ph55.split.us

.lr.ph55.split.us:                                ; preds = %._crit_edge52.us..lr.ph55.split.us_crit_edge, %.lr.ph55.split.us.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge52.us..lr.ph55.split.us_crit_edge ], [ 0, %.lr.ph55.split.us.preheader ]
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv18
  store double 0.000000e+00, double* %11, align 8
  %sunkaddr160 = shl nsw i64 %indvars.iv18, 3
  %sunkaddr161 = add i64 %10, %sunkaddr160
  %sunkaddr162 = inttoptr i64 %sunkaddr161 to double*
  br label %._crit_edge59

._crit_edge59:                                    ; preds = %._crit_edge59.._crit_edge59_crit_edge, %.lr.ph55.split.us
  %indvars.iv137 = phi i64 [ 0, %.lr.ph55.split.us ], [ %indvars.iv.next138.1.1, %._crit_edge59.._crit_edge59_crit_edge ]
  %12 = phi double [ 0.000000e+00, %.lr.ph55.split.us ], [ %24, %._crit_edge59.._crit_edge59_crit_edge ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv18
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr162, align 8
  %indvars.iv.next138 = or i64 %indvars.iv137, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next138, i64 %indvars.iv18
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr162, align 8
  %indvars.iv.next138.1 = or i64 %indvars.iv137, 2
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next138.1, i64 %indvars.iv18
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr162, align 8
  %indvars.iv.next138.129 = or i64 %indvars.iv137, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next138.129, i64 %indvars.iv18
  %23 = load double, double* %22, align 8
  %24 = fadd double %23, %21
  store double %24, double* %sunkaddr162, align 8
  %indvars.iv.next138.1.1 = add nsw i64 %indvars.iv137, 4
  %exitcond139.1.1 = icmp eq i64 %indvars.iv.next138.1.1, 1400
  br i1 %exitcond139.1.1, label %._crit_edge52.us, label %._crit_edge59.._crit_edge59_crit_edge

._crit_edge59.._crit_edge59_crit_edge:            ; preds = %._crit_edge59
  br label %._crit_edge59

._crit_edge52.us:                                 ; preds = %._crit_edge59
  %25 = fdiv double %24, %0
  store double %25, double* %sunkaddr162, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond20, label %.lr.ph49.split.us.preheader, label %._crit_edge52.us..lr.ph55.split.us_crit_edge

._crit_edge52.us..lr.ph55.split.us_crit_edge:     ; preds = %._crit_edge52.us
  br label %.lr.ph55.split.us

.lr.ph49.split.us.preheader:                      ; preds = %._crit_edge52.us
  %26 = load double*, double** %8, align 8
  %27 = load double, double* %9, align 8
  br label %.lr.ph49.split.us

.lr.ph49.split.us:                                ; preds = %._crit_edge47.us..lr.ph49.split.us_crit_edge, %.lr.ph49.split.us.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge47.us..lr.ph49.split.us_crit_edge ], [ 0, %.lr.ph49.split.us.preheader ]
  %28 = phi double* [ %26, %._crit_edge47.us..lr.ph49.split.us_crit_edge ], [ %4, %.lr.ph49.split.us.preheader ]
  %29 = getelementptr inbounds double, double* %28, i64 %indvars.iv15
  store double 0.000000e+00, double* %29, align 8
  %sunkaddr164 = shl nsw i64 %indvars.iv15, 3
  %sunkaddr165 = add i64 %10, %sunkaddr164
  %sunkaddr166 = inttoptr i64 %sunkaddr165 to double*
  %sunkaddr167 = ptrtoint double* %28 to i64
  %sunkaddr169 = add i64 %sunkaddr167, %sunkaddr164
  %sunkaddr170 = inttoptr i64 %sunkaddr169 to double*
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge62.._crit_edge62_crit_edge, %.lr.ph49.split.us
  %indvars.iv131 = phi i64 [ 0, %.lr.ph49.split.us ], [ %indvars.iv.next132.1, %._crit_edge62.._crit_edge62_crit_edge ]
  %30 = phi double [ 0.000000e+00, %.lr.ph49.split.us ], [ %42, %._crit_edge62.._crit_edge62_crit_edge ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv15
  %32 = load double, double* %31, align 8
  %33 = load double, double* %sunkaddr166, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %35, %30
  store double %36, double* %sunkaddr170, align 8
  %indvars.iv.next132 = or i64 %indvars.iv131, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next132, i64 %indvars.iv15
  %38 = load double, double* %37, align 8
  %39 = load double, double* %sunkaddr166, align 8
  %40 = fsub double %38, %39
  %41 = fmul double %40, %40
  %42 = fadd double %41, %36
  store double %42, double* %sunkaddr170, align 8
  %indvars.iv.next132.1 = add nuw nsw i64 %indvars.iv131, 2
  %exitcond133.1 = icmp eq i64 %indvars.iv.next132.1, 1400
  br i1 %exitcond133.1, label %._crit_edge47.us, label %._crit_edge62.._crit_edge62_crit_edge

._crit_edge62.._crit_edge62_crit_edge:            ; preds = %._crit_edge62
  br label %._crit_edge62

._crit_edge47.us:                                 ; preds = %._crit_edge62
  %43 = fdiv double %42, %0
  store double %43, double* %sunkaddr170, align 8
  %44 = getelementptr inbounds double, double* %26, i64 %indvars.iv15
  %45 = load double, double* %44, align 8
  %46 = tail call double @sqrt(double %45) #4
  %47 = fcmp ugt double %46, %27
  %48 = select i1 %47, double %46, double 1.000000e+00
  store double %48, double* %44, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %._crit_edge11.us.preheader, label %._crit_edge47.us..lr.ph49.split.us_crit_edge

._crit_edge47.us..lr.ph49.split.us_crit_edge:     ; preds = %._crit_edge47.us
  br label %.lr.ph49.split.us

._crit_edge11.us.preheader:                       ; preds = %._crit_edge47.us
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge42.us.._crit_edge11.us_crit_edge, %._crit_edge11.us.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge42.us.._crit_edge11.us_crit_edge ], [ 0, %._crit_edge11.us.preheader ]
  %49 = phi [1200 x double]* [ %62, %._crit_edge42.us.._crit_edge11.us_crit_edge ], [ %1, %._crit_edge11.us.preheader ]
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66.._crit_edge66_crit_edge, %._crit_edge11.us
  %indvars.iv127 = phi i64 [ 0, %._crit_edge11.us ], [ %indvars.iv.next128, %._crit_edge66.._crit_edge66_crit_edge ]
  %50 = phi [1200 x double]* [ %49, %._crit_edge11.us ], [ %62, %._crit_edge66.._crit_edge66_crit_edge ]
  %51 = getelementptr inbounds double, double* %3, i64 %indvars.iv127
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %50, i64 %indvars.iv12, i64 %indvars.iv127
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, %52
  store double %55, double* %53, align 8
  %56 = load double, double* %5, align 8
  %57 = tail call double @sqrt(double %56) #4
  %58 = load double*, double** %8, align 8
  %59 = getelementptr inbounds double, double* %58, i64 %indvars.iv127
  %60 = load double, double* %59, align 8
  %61 = fmul double %57, %60
  %62 = load [1200 x double]*, [1200 x double]** %6, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %62, i64 %indvars.iv12, i64 %indvars.iv127
  %64 = load double, double* %63, align 8
  %65 = fdiv double %64, %61
  store double %65, double* %63, align 8
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next128, 1200
  br i1 %exitcond129, label %._crit_edge42.us, label %._crit_edge66.._crit_edge66_crit_edge

._crit_edge66.._crit_edge66_crit_edge:            ; preds = %._crit_edge66
  br label %._crit_edge66

._crit_edge42.us:                                 ; preds = %._crit_edge66
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1400
  br i1 %exitcond14, label %._crit_edge76.preheader.preheader, label %._crit_edge42.us.._crit_edge11.us_crit_edge

._crit_edge42.us.._crit_edge11.us_crit_edge:      ; preds = %._crit_edge42.us
  br label %._crit_edge11.us

._crit_edge76.preheader.preheader:                ; preds = %._crit_edge42.us
  br label %._crit_edge76.preheader

._crit_edge76.preheader:                          ; preds = %._crit_edge70.._crit_edge76.preheader_crit_edge, %._crit_edge76.preheader.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge70.._crit_edge76.preheader_crit_edge ], [ 0, %._crit_edge76.preheader.preheader ]
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge70.._crit_edge76.preheader_crit_edge ], [ 1, %._crit_edge76.preheader.preheader ]
  %66 = phi [1200 x double]* [ %71, %._crit_edge70.._crit_edge76.preheader_crit_edge ], [ %2, %._crit_edge76.preheader.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv9, i64 %indvars.iv9
  store double 1.000000e+00, double* %67, align 8
  br label %._crit_edge76

._crit_edge70:                                    ; preds = %._crit_edge24.us.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1199
  br i1 %exitcond11, label %._crit_edge12._crit_edge, label %._crit_edge70.._crit_edge76.preheader_crit_edge

._crit_edge70.._crit_edge76.preheader_crit_edge:  ; preds = %._crit_edge70
  br label %._crit_edge76.preheader

._crit_edge76:                                    ; preds = %._crit_edge24.us.us.._crit_edge76_crit_edge, %._crit_edge76.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge24.us.us.._crit_edge76_crit_edge ], [ %indvars.iv5, %._crit_edge76.preheader ]
  %68 = phi [1200 x double]* [ %71, %._crit_edge24.us.us.._crit_edge76_crit_edge ], [ %66, %._crit_edge76.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv9, i64 %indvars.iv7
  store double 0.000000e+00, double* %69, align 8
  %70 = load [1200 x double]*, [1200 x double]** %6, align 8
  %71 = load [1200 x double]*, [1200 x double]** %7, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv9, i64 %indvars.iv7
  %.pre = load double, double* %72, align 8
  br label %._crit_edge77

._crit_edge24.us.us:                              ; preds = %._crit_edge77
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 %indvars.iv7, i64 %indvars.iv9
  store double %86, double* %73, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond, label %._crit_edge70, label %._crit_edge24.us.us.._crit_edge76_crit_edge

._crit_edge24.us.us.._crit_edge76_crit_edge:      ; preds = %._crit_edge24.us.us
  br label %._crit_edge76

._crit_edge77:                                    ; preds = %._crit_edge77.._crit_edge77_crit_edge, %._crit_edge76
  %74 = phi double [ %.pre, %._crit_edge76 ], [ %86, %._crit_edge77.._crit_edge77_crit_edge ]
  %indvars.iv = phi i64 [ 0, %._crit_edge76 ], [ %indvars.iv.next.1, %._crit_edge77.._crit_edge77_crit_edge ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv, i64 %indvars.iv9
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv, i64 %indvars.iv7
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %79, %74
  store double %80, double* %72, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv9
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %70, i64 %indvars.iv.next, i64 %indvars.iv7
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %85, %80
  store double %86, double* %72, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge24.us.us, label %._crit_edge77.._crit_edge77_crit_edge

._crit_edge77.._crit_edge77_crit_edge:            ; preds = %._crit_edge77
  br label %._crit_edge77

._crit_edge12._crit_edge:                         ; preds = %._crit_edge70
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %71, i64 1199, i64 1199
  store double 1.000000e+00, double* %87, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge2.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge3.us.._crit_edge2.us_crit_edge, %._crit_edge2.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge3.us.._crit_edge2.us_crit_edge ], [ 0, %._crit_edge2.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge, %._crit_edge2.us
  %indvars.iv = phi i64 [ 0, %._crit_edge2.us ], [ %indvars.iv.next, %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us._crit_edge.._crit_edge.us_crit_edge

._crit_edge.us._crit_edge.._crit_edge.us_crit_edge: ; preds = %._crit_edge.us._crit_edge
  br label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge.._crit_edge.us_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge3.us, label %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge

._crit_edge.us.._crit_edge.us._crit_edge_crit_edge: ; preds = %._crit_edge.us
  br label %._crit_edge.us._crit_edge

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge6, label %._crit_edge3.us.._crit_edge2.us_crit_edge

._crit_edge3.us.._crit_edge2.us_crit_edge:        ; preds = %._crit_edge3.us
  br label %._crit_edge2.us

._crit_edge6:                                     ; preds = %._crit_edge3.us
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
