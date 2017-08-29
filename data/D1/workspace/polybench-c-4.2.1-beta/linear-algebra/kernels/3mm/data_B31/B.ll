; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
.preheader13.lr.ph:
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge38.us, %.preheader13.lr.ph
  %indvars.iv73 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next74, %._crit_edge38.us ]
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader13.us
  %indvars.iv69 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next70, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv73, %indvars.iv69
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 4.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv73, i64 %indvars.iv69
  store double %15, double* %16, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 1000
  br i1 %exitcond72, label %._crit_edge38.us, label %9

._crit_edge38.us:                                 ; preds = %9
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next74, 800
  br i1 %exitcond82, label %.preheader11.us.preheader, label %.preheader13.us

.preheader11.us.preheader:                        ; preds = %._crit_edge38.us
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge30.us, %.preheader11.us.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge30.us ], [ 0, %.preheader11.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader11.us
  %indvars.iv63 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next64, %17 ]
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %18 = mul nuw nsw i64 %indvars.iv65, %indvars.iv.next64
  %19 = add nuw nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 4.500000e+03
  %24 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv63
  store double %23, double* %24, align 8
  %exitcond = icmp eq i64 %indvars.iv.next64, 900
  br i1 %exitcond, label %._crit_edge30.us, label %17

._crit_edge30.us:                                 ; preds = %17
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next66, 1000
  br i1 %exitcond81, label %.preheader9.us.preheader, label %.preheader11.us

.preheader9.us.preheader:                         ; preds = %._crit_edge30.us
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge22.us, %.preheader9.us.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge22.us ], [ 0, %.preheader9.us.preheader ]
  br label %25

; <label>:25:                                     ; preds = %25, %.preheader9.us
  %indvars.iv57 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next58, %25 ]
  %26 = add nuw nsw i64 %indvars.iv57, 3
  %27 = mul nuw nsw i64 %indvars.iv59, %26
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.500000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv59, i64 %indvars.iv57
  store double %31, double* %32, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next58, 1200
  br i1 %exitcond79, label %._crit_edge22.us, label %25

._crit_edge22.us:                                 ; preds = %25
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next60, 900
  br i1 %exitcond80, label %.preheader.us.preheader, label %.preheader9.us

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %33

; <label>:33:                                     ; preds = %33, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %33 ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %indvars.iv55, %34
  %36 = add nuw nsw i64 %35, 2
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 1000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 5.000000e+03
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv55, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond77, label %._crit_edge.us, label %33

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond78, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) unnamed_addr #2 {
.preheader12.lr.ph:
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge71.us, %.preheader12.lr.ph
  %indvars.iv146 = phi i64 [ 0, %.preheader12.lr.ph ], [ %indvars.iv.next147, %._crit_edge71.us ]
  br label %.lr.ph65.us.us

._crit_edge71.us:                                 ; preds = %._crit_edge66.us.us
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next147, 800
  br i1 %exitcond177, label %.preheader10.us.preheader, label %.preheader12.us

.preheader10.us.preheader:                        ; preds = %._crit_edge71.us
  br label %.preheader10.us

.lr.ph65.us.us:                                   ; preds = %.preheader12.us, %._crit_edge66.us.us
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %._crit_edge66.us.us ], [ 0, %.preheader12.us ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv146, i64 %indvars.iv142
  store double 0.000000e+00, double* %12, align 8
  br label %.lr.ph65.us.us.new

._crit_edge66.us.us:                              ; preds = %.lr.ph65.us.us.new
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %exitcond145 = icmp eq i64 %indvars.iv.next143, 900
  br i1 %exitcond145, label %._crit_edge71.us, label %.lr.ph65.us.us

.lr.ph65.us.us.new:                               ; preds = %.lr.ph65.us.us, %.lr.ph65.us.us.new
  %13 = phi double [ %25, %.lr.ph65.us.us.new ], [ 0.000000e+00, %.lr.ph65.us.us ]
  %indvars.iv138 = phi i64 [ %indvars.iv.next139.1, %.lr.ph65.us.us.new ], [ 0, %.lr.ph65.us.us ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv146, i64 %indvars.iv138
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv138, i64 %indvars.iv142
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %18, %13
  store double %19, double* %12, align 8
  %indvars.iv.next139 = or i64 %indvars.iv138, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv146, i64 %indvars.iv.next139
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next139, i64 %indvars.iv142
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %24, %19
  store double %25, double* %12, align 8
  %indvars.iv.next139.1 = add nuw nsw i64 %indvars.iv138, 2
  %exitcond141.1 = icmp eq i64 %indvars.iv.next139.1, 1000
  br i1 %exitcond141.1, label %._crit_edge66.us.us, label %.lr.ph65.us.us.new

.preheader10.us:                                  ; preds = %._crit_edge43.us, %.preheader10.us.preheader
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge43.us ], [ 0, %.preheader10.us.preheader ]
  br label %.lr.ph37.us.us

._crit_edge43.us:                                 ; preds = %._crit_edge38.us.us
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond176 = icmp eq i64 %indvars.iv.next130, 900
  br i1 %exitcond176, label %.preheader.us.preheader, label %.preheader10.us

.preheader.us.preheader:                          ; preds = %._crit_edge43.us
  br label %.preheader.us

.lr.ph37.us.us:                                   ; preds = %.preheader10.us, %._crit_edge38.us.us
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %._crit_edge38.us.us ], [ 0, %.preheader10.us ]
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv129, i64 %indvars.iv125
  store double 0.000000e+00, double* %26, align 8
  br label %.lr.ph37.us.us.new

._crit_edge38.us.us:                              ; preds = %.lr.ph37.us.us.new
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next126, 1100
  br i1 %exitcond128, label %._crit_edge43.us, label %.lr.ph37.us.us

.lr.ph37.us.us.new:                               ; preds = %.lr.ph37.us.us, %.lr.ph37.us.us.new
  %27 = phi double [ %39, %.lr.ph37.us.us.new ], [ 0.000000e+00, %.lr.ph37.us.us ]
  %indvars.iv121 = phi i64 [ %indvars.iv.next122.1, %.lr.ph37.us.us.new ], [ 0, %.lr.ph37.us.us ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv129, i64 %indvars.iv121
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv121, i64 %indvars.iv125
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %32, %27
  store double %33, double* %26, align 8
  %indvars.iv.next122 = or i64 %indvars.iv121, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv129, i64 %indvars.iv.next122
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next122, i64 %indvars.iv125
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %38, %33
  store double %39, double* %26, align 8
  %indvars.iv.next122.1 = add nuw nsw i64 %indvars.iv121, 2
  %exitcond124.1 = icmp eq i64 %indvars.iv.next122.1, 1200
  br i1 %exitcond124.1, label %._crit_edge38.us.us, label %.lr.ph37.us.us.new

.preheader.us:                                    ; preds = %._crit_edge15.us, %.preheader.us.preheader
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %._crit_edge15.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge15.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond = icmp eq i64 %indvars.iv.next115, 800
  br i1 %exitcond, label %._crit_edge20, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.preheader.us, %._crit_edge.us.us
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %40, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next111, 1100
  br i1 %exitcond113, label %._crit_edge15.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %41 = phi double [ %53, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv106 = phi i64 [ %indvars.iv.next107.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %42 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv106
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv106, i64 %indvars.iv110
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %46, %41
  store double %47, double* %40, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %48 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next107
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next107, i64 %indvars.iv110
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %52, %47
  store double %53, double* %40, align 8
  %indvars.iv.next107.1 = add nuw nsw i64 %indvars.iv106, 2
  %exitcond109.1 = icmp eq i64 %indvars.iv.next107.1, 900
  br i1 %exitcond109.1, label %._crit_edge.us.us, label %.lr.ph.us.us.new

._crit_edge20:                                    ; preds = %._crit_edge15.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
.preheader.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us, %.preheader.lr.ph
  %indvars.iv12 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next13, %._crit_edge3.us ]
  %7 = mul nuw nsw i64 %indvars.iv12, 800
  br label %8

; <label>:8:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge3.us, label %8

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 800
  br i1 %exitcond14, label %._crit_edge5, label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
