; ModuleID = 'A.ll'
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
define i32 @main(i32, i8** nocapture readonly) #0 {
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
  call void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  call void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %.._crit_edge_crit_edge34

.._crit_edge_crit_edge34:                         ; preds = %18
  br label %._crit_edge

; <label>:21:                                     ; preds = %18
  call void @print_array([1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge34, %.._crit_edge_crit_edge, %21
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
  br label %.preheader60

.preheader60:                                     ; preds = %..preheader60_crit_edge, %4
  %indvars.iv87 = phi i64 [ 0, %4 ], [ %indvars.iv.next88, %..preheader60_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader60
  %indvars.iv84 = phi i64 [ 0, %.preheader60 ], [ %indvars.iv.next85, %._crit_edge.._crit_edge_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv84, %indvars.iv87
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 800
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 4.000000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv87, i64 %indvars.iv84
  store double %10, double* %11, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next85, 1000
  br i1 %exitcond86, label %12, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next88, 800
  br i1 %exitcond89, label %.preheader58.preheader, label %..preheader60_crit_edge

..preheader60_crit_edge:                          ; preds = %12
  br label %.preheader60

.preheader58.preheader:                           ; preds = %12
  br label %.preheader58

.preheader58:                                     ; preds = %..preheader58_crit_edge, %.preheader58.preheader
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %..preheader58_crit_edge ], [ 0, %.preheader58.preheader ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.._crit_edge7_crit_edge, %.preheader58
  %indvars.iv78 = phi i64 [ 0, %.preheader58 ], [ %indvars.iv.next79, %._crit_edge7.._crit_edge7_crit_edge ]
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %13 = mul nuw nsw i64 %indvars.iv.next79, %indvars.iv81
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 900
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 4.500000e+03
  %19 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv78
  store double %18, double* %19, align 8
  %exitcond80 = icmp eq i64 %indvars.iv.next79, 900
  br i1 %exitcond80, label %20, label %._crit_edge7.._crit_edge7_crit_edge

._crit_edge7.._crit_edge7_crit_edge:              ; preds = %._crit_edge7
  br label %._crit_edge7

; <label>:20:                                     ; preds = %._crit_edge7
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next82, 1000
  br i1 %exitcond83, label %.preheader56.preheader, label %..preheader58_crit_edge

..preheader58_crit_edge:                          ; preds = %20
  br label %.preheader58

.preheader56.preheader:                           ; preds = %20
  br label %.preheader56

.preheader56:                                     ; preds = %..preheader56_crit_edge, %.preheader56.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %..preheader56_crit_edge ], [ 0, %.preheader56.preheader ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.._crit_edge9_crit_edge, %.preheader56
  %indvars.iv72 = phi i64 [ 0, %.preheader56 ], [ %indvars.iv.next73, %._crit_edge9.._crit_edge9_crit_edge ]
  %21 = add nuw nsw i64 %indvars.iv72, 3
  %22 = mul nuw nsw i64 %21, %indvars.iv75
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 5.500000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv75, i64 %indvars.iv72
  store double %26, double* %27, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond74, label %28, label %._crit_edge9.._crit_edge9_crit_edge

._crit_edge9.._crit_edge9_crit_edge:              ; preds = %._crit_edge9
  br label %._crit_edge9

; <label>:28:                                     ; preds = %._crit_edge9
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next76, 900
  br i1 %exitcond77, label %.preheader.preheader, label %..preheader56_crit_edge

..preheader56_crit_edge:                          ; preds = %28
  br label %.preheader56

.preheader.preheader:                             ; preds = %28
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader.preheader
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.._crit_edge11_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge11.._crit_edge11_crit_edge ]
  %29 = add nuw nsw i64 %indvars.iv, 2
  %30 = mul nuw nsw i64 %29, %indvars.iv69
  %31 = add nuw nsw i64 %30, 2
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 5.000000e+03
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv69, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %37, label %._crit_edge11.._crit_edge11_crit_edge

._crit_edge11.._crit_edge11_crit_edge:            ; preds = %._crit_edge11
  br label %._crit_edge11

; <label>:37:                                     ; preds = %._crit_edge11
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond71, label %38, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %37
  br label %.preheader

; <label>:38:                                     ; preds = %37
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) #2 {
  br label %.preheader71

.preheader71:                                     ; preds = %..preheader71_crit_edge, %7
  %indvars.iv102 = phi i64 [ 0, %7 ], [ %indvars.iv.next103, %..preheader71_crit_edge ]
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.._crit_edge11_crit_edge, %.preheader71
  %indvars.iv99 = phi i64 [ 0, %.preheader71 ], [ %indvars.iv.next100, %.._crit_edge11_crit_edge ]
  %8 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv102, i64 %indvars.iv99
  store double 0.000000e+00, double* %8, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge11
  %indvars.iv96 = phi i64 [ 0, %._crit_edge11 ], [ %indvars.iv.next97.1, %._crit_edge.._crit_edge_crit_edge ]
  %9 = phi double [ 0.000000e+00, %._crit_edge11 ], [ %21, %._crit_edge.._crit_edge_crit_edge ]
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv96
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv96, i64 %indvars.iv99
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %9, %14
  store double %15, double* %8, align 8
  %indvars.iv.next97 = or i64 %indvars.iv96, 1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next97
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next97, i64 %indvars.iv99
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  store double %21, double* %8, align 8
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %exitcond98.1 = icmp eq i64 %indvars.iv.next97.1, 1000
  br i1 %exitcond98.1, label %22, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:22:                                     ; preds = %._crit_edge
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next100, 900
  br i1 %exitcond101, label %23, label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %22
  br label %._crit_edge11

; <label>:23:                                     ; preds = %22
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next103, 800
  br i1 %exitcond104, label %.preheader69.preheader, label %..preheader71_crit_edge

..preheader71_crit_edge:                          ; preds = %23
  br label %.preheader71

.preheader69.preheader:                           ; preds = %23
  br label %.preheader69

.preheader69:                                     ; preds = %..preheader69_crit_edge, %.preheader69.preheader
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %..preheader69_crit_edge ], [ 0, %.preheader69.preheader ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.._crit_edge13_crit_edge, %.preheader69
  %indvars.iv90 = phi i64 [ 0, %.preheader69 ], [ %indvars.iv.next91, %.._crit_edge13_crit_edge ]
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv93, i64 %indvars.iv90
  store double 0.000000e+00, double* %24, align 8
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.._crit_edge12_crit_edge, %._crit_edge13
  %indvars.iv87 = phi i64 [ 0, %._crit_edge13 ], [ %indvars.iv.next88.2, %._crit_edge12.._crit_edge12_crit_edge ]
  %25 = phi double [ 0.000000e+00, %._crit_edge13 ], [ %43, %._crit_edge12.._crit_edge12_crit_edge ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv93, i64 %indvars.iv87
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv87, i64 %indvars.iv90
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %25, %30
  store double %31, double* %24, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv93, i64 %indvars.iv.next88
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next88, i64 %indvars.iv90
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  store double %37, double* %24, align 8
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv93, i64 %indvars.iv.next88.1
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next88.1, i64 %indvars.iv90
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %24, align 8
  %indvars.iv.next88.2 = add nsw i64 %indvars.iv87, 3
  %exitcond89.2 = icmp eq i64 %indvars.iv.next88.2, 1200
  br i1 %exitcond89.2, label %44, label %._crit_edge12.._crit_edge12_crit_edge

._crit_edge12.._crit_edge12_crit_edge:            ; preds = %._crit_edge12
  br label %._crit_edge12

; <label>:44:                                     ; preds = %._crit_edge12
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next91, 1100
  br i1 %exitcond92, label %45, label %.._crit_edge13_crit_edge

.._crit_edge13_crit_edge:                         ; preds = %44
  br label %._crit_edge13

; <label>:45:                                     ; preds = %44
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next94, 900
  br i1 %exitcond95, label %.preheader.preheader, label %..preheader69_crit_edge

..preheader69_crit_edge:                          ; preds = %45
  br label %.preheader69

.preheader.preheader:                             ; preds = %45
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %.._crit_edge16_crit_edge, %.preheader
  %indvars.iv81 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next82, %.._crit_edge16_crit_edge ]
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv84, i64 %indvars.iv81
  store double 0.000000e+00, double* %46, align 8
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.._crit_edge15_crit_edge, %._crit_edge16
  %indvars.iv = phi i64 [ 0, %._crit_edge16 ], [ %indvars.iv.next.2, %._crit_edge15.._crit_edge15_crit_edge ]
  %47 = phi double [ 0.000000e+00, %._crit_edge16 ], [ %65, %._crit_edge15.._crit_edge15_crit_edge ]
  %48 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv84, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %indvars.iv81
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %47, %52
  store double %53, double* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv84, i64 %indvars.iv.next
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv81
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %60 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv84, i64 %indvars.iv.next.1
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next.1, i64 %indvars.iv81
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %46, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %66, label %._crit_edge15.._crit_edge15_crit_edge

._crit_edge15.._crit_edge15_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge15

; <label>:66:                                     ; preds = %._crit_edge15
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next82, 1100
  br i1 %exitcond83, label %67, label %.._crit_edge16_crit_edge

.._crit_edge16_crit_edge:                         ; preds = %66
  br label %._crit_edge16

; <label>:67:                                     ; preds = %66
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next85, 800
  br i1 %exitcond86, label %68, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %67
  br label %.preheader

; <label>:68:                                     ; preds = %67
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1100 x double]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %1
  %indvars.iv14 = phi i64 [ 0, %1 ], [ %indvars.iv.next15, %..preheader_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv14, 800
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.._crit_edge._crit_edge_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge.._crit_edge._crit_edge_crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge._crit_edge.._crit_edge_crit_edge

._crit_edge._crit_edge.._crit_edge_crit_edge:     ; preds = %._crit_edge._crit_edge
  br label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %17, label %._crit_edge.._crit_edge._crit_edge_crit_edge

._crit_edge.._crit_edge._crit_edge_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 800
  br i1 %exitcond16, label %18, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %17
  br label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
