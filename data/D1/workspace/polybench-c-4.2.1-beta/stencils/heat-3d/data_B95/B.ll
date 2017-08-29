; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader3.preheader.preheader, label %._crit_edge

.preheader3.preheader.preheader:                  ; preds = %3
  br label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader3.preheader.preheader, %.preheader3._crit_edge
  %indvars.iv815 = phi i64 [ %indvars.iv.next9, %.preheader3._crit_edge ], [ 0, %.preheader3.preheader.preheader ]
  %4 = add nuw nsw i64 %indvars.iv815, 120
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader3
  %indvars.iv413 = phi i64 [ %indvars.iv.next5, %.preheader3 ], [ 0, %.preheader.preheader.preheader ]
  %5 = add i64 %4, %indvars.iv413
  br i1 true, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv11.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 false, label %.preheader3, label %.preheader.preheader37

.preheader.preheader37:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader37, %.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv11.unr.ph, %.preheader.preheader37 ]
  %6 = sub i64 %5, %indvars.iv11
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv815, i64 %indvars.iv413, i64 %indvars.iv11
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv815, i64 %indvars.iv413, i64 %indvars.iv11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %11 = sub i64 %5, %indvars.iv.next
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %15, <double 1.000000e+01, double 1.000000e+01>
  %17 = fdiv <2 x double> %16, <double 1.200000e+02, double 1.200000e+02>
  %18 = bitcast double* %9 to <2 x double>*
  %19 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  store <2 x double> %17, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv11, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %.preheader3.loopexit, label %.preheader

.preheader3.loopexit:                             ; preds = %.preheader
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv413, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond7, label %.preheader3._crit_edge, label %.preheader.preheader

.preheader3._crit_edge:                           ; preds = %.preheader3
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv815, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %3, %.preheader4._crit_edge
  %.0568 = phi i32 [ 1, %3 ], [ %86, %.preheader4._crit_edge ]
  br i1 false, label %.preheader4.preheader, label %.preheader3.preheader.preheader

.preheader3.preheader.preheader:                  ; preds = %.preheader5.preheader
  br label %.preheader3.preheader

.preheader4.preheader.loopexit:                   ; preds = %.preheader5
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.preheader.loopexit, %.preheader5.preheader
  br i1 true, label %.preheader2.preheader.preheader, label %.preheader4._crit_edge

.preheader2.preheader.preheader:                  ; preds = %.preheader4.preheader
  br label %.preheader2.preheader

.preheader3.preheader:                            ; preds = %.preheader3.preheader.preheader, %.preheader5
  %indvars.iv1028 = phi i64 [ %indvars.iv.next11, %.preheader5 ], [ 1, %.preheader3.preheader.preheader ]
  %4 = add nuw nsw i64 %indvars.iv1028, 1
  %5 = add nsw i64 %indvars.iv1028, -1
  br i1 false, label %.preheader5, label %.preheader1.preheader.preheader

.preheader1.preheader.preheader:                  ; preds = %.preheader3.preheader
  br label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.preheader1.preheader.preheader, %.preheader3
  %indvars.iv626 = phi i64 [ %indvars.iv.next7, %.preheader3 ], [ 1, %.preheader1.preheader.preheader ]
  %6 = add nuw nsw i64 %indvars.iv626, 1
  %7 = add nsw i64 %indvars.iv626, -1
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.preheader, %.preheader1
  %indvars.iv24 = phi i64 [ 1, %.preheader1.preheader ], [ %indvars.iv.next, %.preheader1 ]
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %indvars.iv626, i64 %indvars.iv24
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %indvars.iv626, i64 %indvars.iv24
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, 2.000000e+00
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %indvars.iv626, i64 %indvars.iv24
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %6, i64 %indvars.iv24
  %16 = load double, double* %15, align 8
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x double> undef, double %9, i32 0
  %20 = insertelement <2 x double> %19, double %16, i32 1
  %21 = fsub <2 x double> %20, %18
  %22 = extractelement <2 x double> %21, i32 0
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %7, i64 %indvars.iv24
  %24 = load double, double* %23, align 8
  %25 = insertelement <2 x double> undef, double %22, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = insertelement <2 x double> undef, double %14, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> %21, <2 x i32> <i32 0, i32 3>
  %29 = fadd <2 x double> %28, %26
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fadd double %31, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv24, 1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %indvars.iv626, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fsub double %35, %12
  %37 = add nsw i64 %indvars.iv24, -1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %indvars.iv626, i64 %37
  %39 = load double, double* %38, align 8
  %40 = fadd double %36, %39
  %41 = fmul double %40, 1.250000e-01
  %42 = fadd double %33, %41
  %43 = fadd double %11, %42
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv1028, i64 %indvars.iv626, i64 %indvars.iv24
  store double %43, double* %44, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %.preheader3, label %.preheader1

.preheader3:                                      ; preds = %.preheader1
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv626, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 119
  br i1 %exitcond9, label %.preheader5.loopexit, label %.preheader1.preheader

.preheader5.loopexit:                             ; preds = %.preheader3
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader3.preheader
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1028, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next11, 119
  br i1 %exitcond73, label %.preheader4.preheader.loopexit, label %.preheader3.preheader

.preheader2.preheader:                            ; preds = %.preheader2.preheader.preheader, %.preheader4
  %indvars.iv2051 = phi i64 [ %indvars.iv.next21, %.preheader4 ], [ 1, %.preheader2.preheader.preheader ]
  %45 = add nuw nsw i64 %indvars.iv2051, 1
  %46 = add nsw i64 %indvars.iv2051, -1
  br i1 false, label %.preheader4, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader2.preheader
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader2
  %indvars.iv1649 = phi i64 [ %indvars.iv.next17, %.preheader2 ], [ 1, %.preheader.preheader.preheader ]
  %47 = add nuw nsw i64 %indvars.iv1649, 1
  %48 = add nsw i64 %indvars.iv1649, -1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv1246 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next13, %.preheader ]
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %45, i64 %indvars.iv1649, i64 %indvars.iv1246
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2051, i64 %indvars.iv1649, i64 %indvars.iv1246
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, 2.000000e+00
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %46, i64 %indvars.iv1649, i64 %indvars.iv1246
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2051, i64 %47, i64 %indvars.iv1246
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = insertelement <2 x double> undef, double %50, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = fsub <2 x double> %61, %59
  %63 = extractelement <2 x double> %62, i32 0
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2051, i64 %48, i64 %indvars.iv1246
  %65 = load double, double* %64, align 8
  %66 = insertelement <2 x double> undef, double %63, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  %68 = insertelement <2 x double> undef, double %55, i32 0
  %69 = shufflevector <2 x double> %68, <2 x double> %62, <2 x i32> <i32 0, i32 3>
  %70 = fadd <2 x double> %69, %67
  %71 = fmul <2 x double> %70, <double 1.250000e-01, double 1.250000e-01>
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 1
  %74 = fadd double %72, %73
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1246, 1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2051, i64 %indvars.iv1649, i64 %indvars.iv.next13
  %76 = load double, double* %75, align 8
  %77 = fsub double %76, %53
  %78 = add nsw i64 %indvars.iv1246, -1
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2051, i64 %indvars.iv1649, i64 %78
  %80 = load double, double* %79, align 8
  %81 = fadd double %77, %80
  %82 = fmul double %81, 1.250000e-01
  %83 = fadd double %74, %82
  %84 = fadd double %52, %83
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv2051, i64 %indvars.iv1649, i64 %indvars.iv1246
  store double %84, double* %85, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 119
  br i1 %exitcond15, label %.preheader2, label %.preheader

.preheader2:                                      ; preds = %.preheader
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1649, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 119
  br i1 %exitcond19, label %.preheader4.loopexit, label %.preheader.preheader

.preheader4.loopexit:                             ; preds = %.preheader2
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader2.preheader
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2051, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next21, 119
  br i1 %exitcond75, label %.preheader4._crit_edge.loopexit, label %.preheader2.preheader

.preheader4._crit_edge.loopexit:                  ; preds = %.preheader4
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4._crit_edge.loopexit, %.preheader4.preheader
  %86 = add nuw nsw i32 %.0568, 1
  %exitcond22 = icmp eq i32 %86, 501
  br i1 %exitcond22, label %87, label %.preheader5.preheader

; <label>:87:                                     ; preds = %.preheader4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader3.preheader.preheader, label %._crit_edge

.preheader3.preheader.preheader:                  ; preds = %2
  br label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader3.preheader.preheader, %.preheader3._crit_edge
  %indvars.iv815 = phi i64 [ %indvars.iv.next9, %.preheader3._crit_edge ], [ 0, %.preheader3.preheader.preheader ]
  %7 = mul nsw i64 %indvars.iv815, 120
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader3
  %indvars.iv413 = phi i64 [ %indvars.iv.next5, %.preheader3 ], [ 0, %.preheader.preheader.preheader ]
  %8 = add i64 %indvars.iv413, %7
  %9 = mul i64 %8, 120
  br label %10

; <label>:10:                                     ; preds = %.preheader.preheader, %.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %11 = add i64 %indvars.iv11, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.preheader

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %.preheader

.preheader:                                       ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv815, i64 %indvars.iv413, i64 %indvars.iv11
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %.preheader3, label %10

.preheader3:                                      ; preds = %.preheader
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv413, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond7, label %.preheader3._crit_edge, label %.preheader.preheader

.preheader3._crit_edge:                           ; preds = %.preheader3
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv815, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond35, label %._crit_edge.loopexit, label %.preheader.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
