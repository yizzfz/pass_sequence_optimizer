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
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %22)
  br label %23

; <label>:23:                                     ; preds = %18, %21, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]*, [900 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
.preheader47.us.preheader:
  br label %.preheader47.us

.preheader47.us:                                  ; preds = %._crit_edge64.us, %.preheader47.us.preheader
  %indvars.iv89 = phi i64 [ 0, %.preheader47.us.preheader ], [ %indvars.iv.next90, %._crit_edge64.us ]
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader47.us
  %indvars.iv86 = phi i64 [ 0, %.preheader47.us ], [ %indvars.iv.next87, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv86, %indvars.iv89
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 4.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv89, i64 %indvars.iv86
  store double %15, double* %16, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 1000
  br i1 %exitcond88, label %._crit_edge64.us, label %9

._crit_edge64.us:                                 ; preds = %9
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next90, 800
  br i1 %exitcond91, label %.preheader45.us.preheader, label %.preheader47.us

.preheader45.us.preheader:                        ; preds = %._crit_edge64.us
  br label %.preheader45.us

.preheader45.us:                                  ; preds = %.preheader45.us.preheader, %._crit_edge59.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84, %._crit_edge59.us ], [ 0, %.preheader45.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader45.us
  %indvars.iv80 = phi i64 [ 0, %.preheader45.us ], [ %indvars.iv.next81, %17 ]
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %18 = mul nuw nsw i64 %indvars.iv.next81, %indvars.iv83
  %19 = add nuw nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 4.500000e+03
  %24 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv83, i64 %indvars.iv80
  store double %23, double* %24, align 8
  %exitcond82 = icmp eq i64 %indvars.iv.next81, 900
  br i1 %exitcond82, label %._crit_edge59.us, label %17

._crit_edge59.us:                                 ; preds = %17
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next84, 1000
  br i1 %exitcond85, label %.preheader43.us.preheader, label %.preheader45.us

.preheader43.us.preheader:                        ; preds = %._crit_edge59.us
  br label %.preheader43.us

.preheader43.us:                                  ; preds = %.preheader43.us.preheader, %._crit_edge54.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge54.us ], [ 0, %.preheader43.us.preheader ]
  br label %25

; <label>:25:                                     ; preds = %25, %.preheader43.us
  %indvars.iv74 = phi i64 [ 0, %.preheader43.us ], [ %indvars.iv.next75, %25 ]
  %26 = add nuw nsw i64 %indvars.iv74, 3
  %27 = mul nuw nsw i64 %26, %indvars.iv77
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 5.500000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv77, i64 %indvars.iv74
  store double %31, double* %32, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond76, label %._crit_edge54.us, label %25

._crit_edge54.us:                                 ; preds = %25
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next78, 900
  br i1 %exitcond79, label %.preheader.us.preheader, label %.preheader43.us

.preheader.us.preheader:                          ; preds = %._crit_edge54.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %33

; <label>:33:                                     ; preds = %33, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %33 ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %34, %indvars.iv71
  %36 = add nuw nsw i64 %35, 2
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 1000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 5.000000e+03
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv71, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %33

._crit_edge.us:                                   ; preds = %33
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next72, 1200
  br i1 %exitcond73, label %._crit_edge51, label %.preheader.us

._crit_edge51:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]*, [1000 x double]*, [900 x double]*, [1100 x double]*, [1200 x double]*, [1100 x double]*, [1100 x double]*) unnamed_addr #2 {
.preheader61.us.preheader:
  br label %.lr.ph90.us.us.preheader

.lr.ph90.us.us.preheader:                         ; preds = %.preheader61.us.preheader, %._crit_edge94.us
  %indvars.iv131 = phi i64 [ 0, %.preheader61.us.preheader ], [ %indvars.iv.next132, %._crit_edge94.us ]
  br label %.lr.ph90.us.us

._crit_edge94.us:                                 ; preds = %._crit_edge91.us.us
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next132, 800
  br i1 %exitcond133, label %.lr.ph76.us.us.preheader.preheader, label %.lr.ph90.us.us.preheader

.lr.ph76.us.us.preheader.preheader:               ; preds = %._crit_edge94.us
  br label %.lr.ph76.us.us.preheader

.lr.ph90.us.us:                                   ; preds = %._crit_edge91.us.us, %.lr.ph90.us.us.preheader
  %indvars.iv127 = phi i64 [ 0, %.lr.ph90.us.us.preheader ], [ %indvars.iv.next128, %._crit_edge91.us.us ]
  %12 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv131, i64 %indvars.iv127
  store double 0.000000e+00, double* %12, align 8
  br label %13

._crit_edge91.us.us:                              ; preds = %13
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next128, 900
  br i1 %exitcond129, label %._crit_edge94.us, label %.lr.ph90.us.us

; <label>:13:                                     ; preds = %13, %.lr.ph90.us.us
  %indvars.iv124 = phi i64 [ 0, %.lr.ph90.us.us ], [ %indvars.iv.next125.1, %13 ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv131, i64 %indvars.iv124
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv124, i64 %indvars.iv127
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = load double, double* %12, align 8
  %20 = fadd double %19, %18
  store double %20, double* %12, align 8
  %indvars.iv.next125 = or i64 %indvars.iv124, 1
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv131, i64 %indvars.iv.next125
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next125, i64 %indvars.iv127
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = load double, double* %12, align 8
  %27 = fadd double %26, %25
  store double %27, double* %12, align 8
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  %exitcond126.1 = icmp eq i64 %indvars.iv.next125.1, 1000
  br i1 %exitcond126.1, label %._crit_edge91.us.us, label %13

.lr.ph76.us.us.preheader:                         ; preds = %.lr.ph76.us.us.preheader.preheader, %._crit_edge80.us
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %._crit_edge80.us ], [ 0, %.lr.ph76.us.us.preheader.preheader ]
  br label %.lr.ph76.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge77.us.us
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next122, 900
  br i1 %exitcond123, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph76.us.us.preheader

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge80.us
  br label %.lr.ph.us.us.preheader

.lr.ph76.us.us:                                   ; preds = %._crit_edge77.us.us, %.lr.ph76.us.us.preheader
  %indvars.iv117 = phi i64 [ 0, %.lr.ph76.us.us.preheader ], [ %indvars.iv.next118, %._crit_edge77.us.us ]
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv121, i64 %indvars.iv117
  store double 0.000000e+00, double* %28, align 8
  br label %29

._crit_edge77.us.us:                              ; preds = %29
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next118, 1100
  br i1 %exitcond119, label %._crit_edge80.us, label %.lr.ph76.us.us

; <label>:29:                                     ; preds = %29, %.lr.ph76.us.us
  %indvars.iv114 = phi i64 [ 0, %.lr.ph76.us.us ], [ %indvars.iv.next115.1, %29 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv121, i64 %indvars.iv114
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv114, i64 %indvars.iv117
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = load double, double* %28, align 8
  %36 = fadd double %35, %34
  store double %36, double* %28, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv121, i64 %indvars.iv.next115
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next115, i64 %indvars.iv117
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = load double, double* %28, align 8
  %43 = fadd double %42, %41
  store double %43, double* %28, align 8
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %exitcond116.1 = icmp eq i64 %indvars.iv.next115.1, 1200
  br i1 %exitcond116.1, label %._crit_edge77.us.us, label %29

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge65.us
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %._crit_edge65.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  br label %.lr.ph.us.us

._crit_edge65.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next112, 800
  br i1 %exitcond113, label %._crit_edge67, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv108 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next109, %._crit_edge.us.us ]
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv111, i64 %indvars.iv108
  store double 0.000000e+00, double* %44, align 8
  br label %45

._crit_edge.us.us:                                ; preds = %45
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond = icmp eq i64 %indvars.iv.next109, 1100
  br i1 %exitcond, label %._crit_edge65.us, label %.lr.ph.us.us

; <label>:45:                                     ; preds = %45, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %45 ]
  %46 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv111, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv108
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %44, align 8
  %52 = fadd double %51, %50
  store double %52, double* %44, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %53 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv111, i64 %indvars.iv.next
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv108
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = load double, double* %44, align 8
  %59 = fadd double %58, %57
  store double %59, double* %44, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge.us.us, label %45

._crit_edge67:                                    ; preds = %._crit_edge65.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv13, 800
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond15, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
