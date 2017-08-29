; ModuleID = 'B.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1100 x double]*
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %18, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, i32, i32, [1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) #2 {
.preheader13.lr.ph:
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %.loopexit34.us, %.preheader13.lr.ph
  %indvars.iv91 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next92, %.loopexit34.us ]
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader13.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %9 ], [ 0, %.preheader13.us ]
  %10 = mul nuw nsw i64 %indvars.iv91, %indvars.iv87
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 4.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv91, i64 %indvars.iv87
  store double %15, double* %16, align 8
  %exitcond90 = icmp eq i64 %indvars.iv87, 999
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  br i1 %exitcond90, label %.loopexit34.us, label %9

.loopexit34.us:                                   ; preds = %9
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next92, 800
  br i1 %exitcond97, label %.preheader11.us.preheader, label %.preheader13.us

.preheader11.us.preheader:                        ; preds = %.loopexit34.us
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %.loopexit33.us, %.preheader11.us.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %.loopexit33.us ], [ 0, %.preheader11.us.preheader ]
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61, %.preheader11.us
  %indvars.iv80 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next81, %._crit_edge61 ]
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %17 = mul nuw nsw i64 %indvars.iv84, %indvars.iv.next81
  %18 = add nuw nsw i64 %17, 2
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 900
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 4.500000e+03
  %23 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv84, i64 %indvars.iv80
  store double %22, double* %23, align 8
  %exitcond83 = icmp eq i64 %indvars.iv80, 899
  br i1 %exitcond83, label %.loopexit33.us, label %._crit_edge61

.loopexit33.us:                                   ; preds = %._crit_edge61
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next85, 1000
  br i1 %exitcond96, label %.preheader9.us.preheader, label %.preheader11.us

.preheader9.us.preheader:                         ; preds = %.loopexit33.us
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.loopexit32.us, %.preheader9.us.preheader
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %.loopexit32.us ], [ 0, %.preheader9.us.preheader ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader9.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %24 ], [ 0, %.preheader9.us ]
  %25 = add nuw nsw i64 %indvars.iv73, 3
  %26 = mul nuw nsw i64 %indvars.iv77, %25
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1100
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 5.500000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv77, i64 %indvars.iv73
  store double %30, double* %31, align 8
  %exitcond76 = icmp eq i64 %indvars.iv73, 1199
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  br i1 %exitcond76, label %.loopexit32.us, label %24

.loopexit32.us:                                   ; preds = %24
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next78, 900
  br i1 %exitcond95, label %.preheader.us.preheader, label %.preheader9.us

.preheader.us.preheader:                          ; preds = %.loopexit32.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  br label %32

; <label>:32:                                     ; preds = %32, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %32 ], [ 0, %.preheader.us ]
  %33 = add nuw nsw i64 %indvars.iv, 2
  %34 = mul nuw nsw i64 %indvars.iv71, %33
  %35 = add nuw nsw i64 %34, 2
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1000
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 5.000000e+03
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv71, i64 %indvars.iv
  store double %39, double* %40, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit.us, label %32

.loopexit.us:                                     ; preds = %32
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next72, 1200
  br i1 %exitcond94, label %.preheader8._crit_edge, label %.preheader.us

.preheader8._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) #2 {
.preheader12.lr.ph:
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %.loopexit37.us, %.preheader12.lr.ph
  %indvars.iv139 = phi i64 [ 0, %.preheader12.lr.ph ], [ %indvars.iv.next140, %.loopexit37.us ]
  br label %.lr.ph27.us.us

.loopexit37.us:                                   ; preds = %.loopexit36.us.us
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next140, 800
  br i1 %exitcond153, label %.preheader10.us.preheader, label %.preheader12.us

.preheader10.us.preheader:                        ; preds = %.loopexit37.us
  br label %.preheader10.us

.lr.ph27.us.us:                                   ; preds = %.loopexit36.us.us, %.preheader12.us
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %.loopexit36.us.us ], [ 0, %.preheader12.us ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv139, i64 %indvars.iv137
  store double 0.000000e+00, double* %12, align 8
  br label %13

.loopexit36.us.us:                                ; preds = %13
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next138, 900
  br i1 %exitcond152, label %.loopexit37.us, label %.lr.ph27.us.us

; <label>:13:                                     ; preds = %13, %.lr.ph27.us.us
  %14 = phi double [ 0.000000e+00, %.lr.ph27.us.us ], [ %26, %13 ]
  %indvars.iv133 = phi i64 [ 0, %.lr.ph27.us.us ], [ %indvars.iv.next134.1, %13 ]
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv139, i64 %indvars.iv133
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv133, i64 %indvars.iv137
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %19, %14
  store double %20, double* %12, align 8
  %indvars.iv.next134 = or i64 %indvars.iv133, 1
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv139, i64 %indvars.iv.next134
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next134, i64 %indvars.iv137
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %25, %20
  store double %26, double* %12, align 8
  %exitcond136.1 = icmp eq i64 %indvars.iv.next134, 999
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  br i1 %exitcond136.1, label %.loopexit36.us.us, label %13

.preheader10.us:                                  ; preds = %.loopexit35.us, %.preheader10.us.preheader
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %.loopexit35.us ], [ 0, %.preheader10.us.preheader ]
  br label %.lr.ph20.us.us

.loopexit35.us:                                   ; preds = %.loopexit34.us.us
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next129, 900
  br i1 %exitcond151, label %.preheader.us.preheader, label %.preheader10.us

.preheader.us.preheader:                          ; preds = %.loopexit35.us
  br label %.preheader.us

.lr.ph20.us.us:                                   ; preds = %.loopexit34.us.us, %.preheader10.us
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %.loopexit34.us.us ], [ 0, %.preheader10.us ]
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv128, i64 %indvars.iv126
  store double 0.000000e+00, double* %27, align 8
  br label %28

.loopexit34.us.us:                                ; preds = %28
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next127, 1100
  br i1 %exitcond150, label %.loopexit35.us, label %.lr.ph20.us.us

; <label>:28:                                     ; preds = %28, %.lr.ph20.us.us
  %29 = phi double [ 0.000000e+00, %.lr.ph20.us.us ], [ %47, %28 ]
  %indvars.iv122 = phi i64 [ 0, %.lr.ph20.us.us ], [ %indvars.iv.next123.2, %28 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv128, i64 %indvars.iv122
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv122, i64 %indvars.iv126
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %34, %29
  store double %35, double* %27, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv128, i64 %indvars.iv.next123
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next123, i64 %indvars.iv126
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %40, %35
  store double %41, double* %27, align 8
  %indvars.iv.next123.1 = add nsw i64 %indvars.iv122, 2
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv128, i64 %indvars.iv.next123.1
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next123.1, i64 %indvars.iv126
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %46, %41
  store double %47, double* %27, align 8
  %exitcond125.2 = icmp eq i64 %indvars.iv.next123.1, 1199
  %indvars.iv.next123.2 = add nsw i64 %indvars.iv122, 3
  br i1 %exitcond125.2, label %.loopexit34.us.us, label %28

.preheader.us:                                    ; preds = %.loopexit32.us, %.preheader.us.preheader
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %.loopexit32.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

.loopexit32.us:                                   ; preds = %.loopexit.us.us
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next119, 800
  br i1 %exitcond154, label %.preheader9._crit_edge, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.loopexit.us.us, %.preheader.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %.loopexit.us.us ], [ 0, %.preheader.us ]
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv118, i64 %indvars.iv116
  store double 0.000000e+00, double* %48, align 8
  br label %49

.loopexit.us.us:                                  ; preds = %49
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond149 = icmp eq i64 %indvars.iv.next117, 1100
  br i1 %exitcond149, label %.loopexit32.us, label %.lr.ph.us.us

; <label>:49:                                     ; preds = %49, %.lr.ph.us.us
  %50 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %68, %49 ]
  %indvars.iv114 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next115.2, %49 ]
  %51 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 %indvars.iv114
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv114, i64 %indvars.iv116
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %55, %50
  store double %56, double* %48, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %57 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 %indvars.iv.next115
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next115, i64 %indvars.iv116
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %61, %56
  store double %62, double* %48, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %63 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv118, i64 %indvars.iv.next115.1
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next115.1, i64 %indvars.iv116
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %67, %62
  store double %68, double* %48, align 8
  %exitcond.2 = icmp eq i64 %indvars.iv.next115.1, 899
  %indvars.iv.next115.2 = add nsw i64 %indvars.iv114, 3
  br i1 %exitcond.2, label %.loopexit.us.us, label %49

.preheader9._crit_edge:                           ; preds = %.loopexit32.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %7 = mul nuw nsw i64 %indvars.iv14, 800
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge11

; <label>:12:                                     ; preds = %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %12, %._crit_edge12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 800
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

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
