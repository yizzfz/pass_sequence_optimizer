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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  tail call fastcc void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  tail call fastcc void @print_array([1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
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
define internal fastcc void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %14, %4
  %5 = phi i32 [ 0, %4 ], [ %15, %14 ]
  %6 = sext i32 %5 to i64
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader6
  %indvars.iv7 = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next8, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv7, %6
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 800
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 4.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %6, i64 %indvars.iv7
  store double %12, double* %13, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge
  %15 = add nsw i32 %5, 1
  %16 = icmp slt i32 %15, 800
  br i1 %16, label %.preheader6, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %14
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader, %26
  %17 = phi i32 [ %27, %26 ], [ 0, %.preheader4.preheader ]
  %18 = sext i32 %17 to i64
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10, %.preheader4
  %indvars.iv4 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next5, %._crit_edge10 ]
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %19 = mul nuw nsw i64 %indvars.iv.next5, %18
  %20 = add nuw nsw i64 %19, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 900
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 4.500000e+03
  %25 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %18, i64 %indvars.iv4
  store double %24, double* %25, align 8
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 900
  br i1 %exitcond6, label %26, label %._crit_edge10

; <label>:26:                                     ; preds = %._crit_edge10
  %27 = add nsw i32 %17, 1
  %28 = icmp slt i32 %27, 1000
  br i1 %28, label %.preheader4, label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %26
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %38
  %29 = phi i32 [ %39, %38 ], [ 0, %.preheader2.preheader ]
  %30 = sext i32 %29 to i64
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11, %.preheader2
  %indvars.iv1 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next2, %._crit_edge11 ]
  %31 = add nuw nsw i64 %indvars.iv1, 3
  %32 = mul nuw nsw i64 %31, %30
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1100
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 5.500000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %30, i64 %indvars.iv1
  store double %36, double* %37, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %38, label %._crit_edge11

; <label>:38:                                     ; preds = %._crit_edge11
  %39 = add nsw i32 %29, 1
  %40 = icmp slt i32 %39, 900
  br i1 %40, label %.preheader2, label %.preheader.preheader

.preheader.preheader:                             ; preds = %38
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %51
  %41 = phi i32 [ %52, %51 ], [ 0, %.preheader.preheader ]
  %42 = sext i32 %41 to i64
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge12 ]
  %43 = add nuw nsw i64 %indvars.iv, 2
  %44 = mul nuw nsw i64 %43, %42
  %45 = add nuw nsw i64 %44, 2
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 1000
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %48, 5.000000e+03
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %42, i64 %indvars.iv
  store double %49, double* %50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %51, label %._crit_edge12

; <label>:51:                                     ; preds = %._crit_edge12
  %52 = add nsw i32 %41, 1
  %53 = icmp slt i32 %52, 1200
  br i1 %53, label %.preheader, label %54

; <label>:54:                                     ; preds = %51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader9

.preheader9:                                      ; preds = %..preheader9_crit_edge, %7
  %indvar12 = phi i64 [ 0, %7 ], [ %indvar.next13, %..preheader9_crit_edge ]
  %8 = phi i64 [ 0, %7 ], [ %30, %..preheader9_crit_edge ]
  %sext = shl i64 %8, 32
  %9 = ashr exact i64 %sext, 32
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %26, %.preheader9
  %10 = phi i32 [ 0, %.preheader9 ], [ %27, %26 ]
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %9, i64 %11
  store double 0.000000e+00, double* %12, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge18
  %indvars.iv9 = phi i64 [ 0, %._crit_edge18 ], [ %indvars.iv.next10.1, %._crit_edge ]
  %13 = phi double [ 0.000000e+00, %._crit_edge18 ], [ %25, %._crit_edge ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %9, i64 %indvars.iv9
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv9, i64 %11
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %12, align 8
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %9, i64 %indvars.iv.next10
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next10, i64 %11
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next10.1, 1000
  br i1 %exitcond11.1, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %._crit_edge
  %27 = add nsw i32 %10, 1
  %28 = icmp slt i32 %27, 900
  br i1 %28, label %._crit_edge18, label %29

; <label>:29:                                     ; preds = %26
  %indvar.next13 = add nuw nsw i64 %indvar12, 1
  %exitcond15 = icmp eq i64 %indvar.next13, 800
  br i1 %exitcond15, label %.preheader7.preheader, label %..preheader9_crit_edge

.preheader7.preheader:                            ; preds = %29
  br label %.preheader7

..preheader9_crit_edge:                           ; preds = %29
  %30 = add nsw i64 %9, 1
  br label %.preheader9

.preheader7:                                      ; preds = %.preheader7.preheader, %..preheader7_crit_edge
  %indvar5 = phi i64 [ %indvar.next6, %..preheader7_crit_edge ], [ 0, %.preheader7.preheader ]
  %31 = phi i64 [ %59, %..preheader7_crit_edge ], [ 0, %.preheader7.preheader ]
  %sext16 = shl i64 %31, 32
  %32 = ashr exact i64 %sext16, 32
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %55, %.preheader7
  %33 = phi i32 [ 0, %.preheader7 ], [ %56, %55 ]
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %32, i64 %34
  store double 0.000000e+00, double* %35, align 8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19, %._crit_edge20
  %indvars.iv2 = phi i64 [ 0, %._crit_edge20 ], [ %indvars.iv.next3.2, %._crit_edge19 ]
  %36 = phi double [ 0.000000e+00, %._crit_edge20 ], [ %54, %._crit_edge19 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %32, i64 %indvars.iv2
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv2, i64 %34
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %35, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %32, i64 %indvars.iv.next3
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next3, i64 %34
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %35, align 8
  %indvars.iv.next3.1 = add nsw i64 %indvars.iv2, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %32, i64 %indvars.iv.next3.1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next3.1, i64 %34
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %48, %53
  store double %54, double* %35, align 8
  %indvars.iv.next3.2 = add nsw i64 %indvars.iv2, 3
  %exitcond4.2 = icmp eq i64 %indvars.iv.next3.2, 1200
  br i1 %exitcond4.2, label %55, label %._crit_edge19

; <label>:55:                                     ; preds = %._crit_edge19
  %56 = add nsw i32 %33, 1
  %57 = icmp slt i32 %56, 1100
  br i1 %57, label %._crit_edge20, label %58

; <label>:58:                                     ; preds = %55
  %indvar.next6 = add nuw nsw i64 %indvar5, 1
  %exitcond8 = icmp eq i64 %indvar.next6, 900
  br i1 %exitcond8, label %.preheader.preheader, label %..preheader7_crit_edge

.preheader.preheader:                             ; preds = %58
  br label %.preheader

..preheader7_crit_edge:                           ; preds = %58
  %59 = add nsw i64 %32, 1
  br label %.preheader7

.preheader:                                       ; preds = %.preheader.preheader, %..preheader_crit_edge
  %indvar = phi i64 [ %indvar.next, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %60 = phi i64 [ %88, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %sext17 = shl i64 %60, 32
  %61 = ashr exact i64 %sext17, 32
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %84, %.preheader
  %62 = phi i32 [ 0, %.preheader ], [ %85, %84 ]
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %61, i64 %63
  store double 0.000000e+00, double* %64, align 8
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %._crit_edge22
  %indvars.iv = phi i64 [ 0, %._crit_edge22 ], [ %indvars.iv.next.2, %._crit_edge21 ]
  %65 = phi double [ 0.000000e+00, %._crit_edge22 ], [ %83, %._crit_edge21 ]
  %66 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %61, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %63
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %64, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %72 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %61, i64 %indvars.iv.next
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %63
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %71, %76
  store double %77, double* %64, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %78 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %61, i64 %indvars.iv.next.1
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next.1, i64 %63
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %77, %82
  store double %83, double* %64, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %84, label %._crit_edge21

; <label>:84:                                     ; preds = %._crit_edge21
  %85 = add nsw i32 %62, 1
  %86 = icmp slt i32 %85, 1100
  br i1 %86, label %._crit_edge22, label %87

; <label>:87:                                     ; preds = %84
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 800
  br i1 %exitcond, label %89, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %87
  %88 = add nsw i64 %61, 1
  br label %.preheader

; <label>:89:                                     ; preds = %87
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %20, %1
  %6 = phi i32 [ 0, %1 ], [ %21, %20 ]
  %7 = mul nuw nsw i32 %6, 800
  %8 = sext i32 %6 to i64
  %9 = zext i32 %7 to i64
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge1
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %8, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %20, label %._crit_edge1

; <label>:20:                                     ; preds = %._crit_edge
  %21 = add nsw i32 %6, 1
  %22 = icmp slt i32 %21, 800
  br i1 %22, label %.preheader, label %23

; <label>:23:                                     ; preds = %20
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
