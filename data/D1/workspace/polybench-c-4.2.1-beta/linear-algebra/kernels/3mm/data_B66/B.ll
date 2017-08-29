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
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader60.lr.ph, label %.preheader59

.preheader60.lr.ph:                               ; preds = %9
  %11 = icmp sgt i32 %2, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader60.us.preheader, label %.preheader57

.preheader60.us.preheader:                        ; preds = %.preheader60.lr.ph
  %14 = zext i32 %2 to i64
  %15 = zext i32 %0 to i64
  br label %.preheader60.us

.preheader60.us:                                  ; preds = %._crit_edge77.us, %.preheader60.us.preheader
  %indvars.iv111 = phi i64 [ 0, %.preheader60.us.preheader ], [ %indvars.iv.next112, %._crit_edge77.us ]
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader60.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %16 ], [ 0, %.preheader60.us ]
  %17 = mul nuw nsw i64 %indvars.iv107, %indvars.iv111
  %18 = add nuw nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %13
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv111, i64 %indvars.iv107
  store double %22, double* %23, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next108, %14
  br i1 %exitcond121, label %._crit_edge77.us, label %16

._crit_edge77.us:                                 ; preds = %16
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next112, %15
  br i1 %exitcond122, label %.preheader59.loopexit, label %.preheader60.us

.preheader59.loopexit:                            ; preds = %._crit_edge77.us
  br label %.preheader59

.preheader59:                                     ; preds = %.preheader59.loopexit, %9
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %.preheader58.lr.ph, label %.preheader57

.preheader58.lr.ph:                               ; preds = %.preheader59
  %25 = icmp sgt i32 %1, 0
  %26 = mul nsw i32 %1, 5
  %27 = sitofp i32 %26 to double
  br i1 %25, label %.preheader58.us.preheader, label %.preheader55

.preheader58.us.preheader:                        ; preds = %.preheader58.lr.ph
  %28 = zext i32 %1 to i64
  %29 = zext i32 %2 to i64
  br label %.preheader58.us

.preheader58.us:                                  ; preds = %._crit_edge72.us, %.preheader58.us.preheader
  %indvars.iv102 = phi i64 [ 0, %.preheader58.us.preheader ], [ %indvars.iv.next103, %._crit_edge72.us ]
  br label %30

; <label>:30:                                     ; preds = %30, %.preheader58.us
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %30 ], [ 0, %.preheader58.us ]
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %31 = mul nuw nsw i64 %indvars.iv.next99, %indvars.iv102
  %32 = add nuw nsw i64 %31, 2
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %27
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv102, i64 %indvars.iv98
  store double %36, double* %37, align 8
  %exitcond119 = icmp eq i64 %indvars.iv.next99, %28
  br i1 %exitcond119, label %._crit_edge72.us, label %30

._crit_edge72.us:                                 ; preds = %30
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next103, %29
  br i1 %exitcond120, label %.preheader57.loopexit, label %.preheader58.us

.preheader57.loopexit:                            ; preds = %._crit_edge72.us
  br label %.preheader57

.preheader57:                                     ; preds = %.preheader57.loopexit, %.preheader60.lr.ph, %.preheader59
  %38 = icmp sgt i32 %1, 0
  br i1 %38, label %.preheader56.lr.ph, label %.preheader55

.preheader56.lr.ph:                               ; preds = %.preheader57
  %39 = icmp sgt i32 %4, 0
  %40 = mul nsw i32 %3, 5
  %41 = sitofp i32 %40 to double
  br i1 %39, label %.preheader56.us.preheader, label %._crit_edge64

.preheader56.us.preheader:                        ; preds = %.preheader56.lr.ph
  %42 = zext i32 %4 to i64
  %43 = zext i32 %1 to i64
  br label %.preheader56.us

.preheader56.us:                                  ; preds = %._crit_edge67.us, %.preheader56.us.preheader
  %indvars.iv93 = phi i64 [ 0, %.preheader56.us.preheader ], [ %indvars.iv.next94, %._crit_edge67.us ]
  br label %44

; <label>:44:                                     ; preds = %44, %.preheader56.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %44 ], [ 0, %.preheader56.us ]
  %45 = add nuw nsw i64 %indvars.iv89, 3
  %46 = mul nuw nsw i64 %45, %indvars.iv93
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %3
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %41
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv93, i64 %indvars.iv89
  store double %50, double* %51, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next90, %42
  br i1 %exitcond117, label %._crit_edge67.us, label %44

._crit_edge67.us:                                 ; preds = %44
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next94, %43
  br i1 %exitcond118, label %.preheader55.loopexit, label %.preheader56.us

.preheader55.loopexit:                            ; preds = %._crit_edge67.us
  br label %.preheader55

.preheader55:                                     ; preds = %.preheader55.loopexit, %.preheader58.lr.ph, %.preheader57
  %52 = icmp sgt i32 %4, 0
  br i1 %52, label %.preheader.lr.ph, label %._crit_edge64

.preheader.lr.ph:                                 ; preds = %.preheader55
  %53 = icmp sgt i32 %3, 0
  %54 = mul nsw i32 %2, 5
  %55 = sitofp i32 %54 to double
  br i1 %53, label %.preheader.us.preheader, label %._crit_edge64

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %56 = zext i32 %3 to i64
  %57 = zext i32 %4 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv84 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next85, %._crit_edge.us ]
  br label %58

; <label>:58:                                     ; preds = %58, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %58 ], [ 0, %.preheader.us ]
  %59 = add nuw nsw i64 %indvars.iv, 2
  %60 = mul nuw nsw i64 %59, %indvars.iv84
  %61 = add nuw nsw i64 %60, 2
  %62 = trunc i64 %61 to i32
  %63 = srem i32 %62, %2
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %64, %55
  %66 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv84, i64 %indvars.iv
  store double %65, double* %66, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next, %56
  br i1 %exitcond116, label %._crit_edge.us, label %58

._crit_edge.us:                                   ; preds = %58
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond = icmp eq i64 %indvars.iv.next85, %57
  br i1 %exitcond, label %._crit_edge64.loopexit, label %.preheader.us

._crit_edge64.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge64

._crit_edge64:                                    ; preds = %._crit_edge64.loopexit, %.preheader56.lr.ph, %.preheader.lr.ph, %.preheader55
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader71.lr.ph, label %.preheader70

.preheader71.lr.ph:                               ; preds = %12
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader71.us.preheader, label %.preheader.lr.ph

.preheader71.us.preheader:                        ; preds = %.preheader71.lr.ph
  %16 = zext i32 %1 to i64
  %17 = shl nuw nsw i64 %16, 3
  %18 = zext i32 %2 to i64
  %19 = zext i32 %1 to i64
  %20 = zext i32 %0 to i64
  %xtraiter189 = and i64 %18, 1
  %lcmp.mod190 = icmp eq i64 %xtraiter189, 0
  %21 = icmp eq i32 %2, 1
  br label %.preheader71.us

.preheader71.us:                                  ; preds = %._crit_edge92.us, %.preheader71.us.preheader
  %indvars.iv160 = phi i64 [ 0, %.preheader71.us.preheader ], [ %indvars.iv.next161, %._crit_edge92.us ]
  br i1 %15, label %.lr.ph88.us.us.preheader, label %._crit_edge92.us.loopexit116

.lr.ph88.us.us.preheader:                         ; preds = %.preheader71.us
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv160, i64 0
  br label %.lr.ph88.us.us

._crit_edge92.us.loopexit116:                     ; preds = %.preheader71.us
  %scevgep184 = getelementptr [900 x double], [900 x double]* %5, i64 %indvars.iv160, i64 0
  %scevgep184185 = bitcast double* %scevgep184 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep184185, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge92.us

._crit_edge92.us.loopexit:                        ; preds = %._crit_edge89.us.us
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us.loopexit, %._crit_edge92.us.loopexit116
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %exitcond195 = icmp eq i64 %indvars.iv.next161, %20
  br i1 %exitcond195, label %.preheader70.loopexit, label %.preheader71.us

.lr.ph88.us.us:                                   ; preds = %.lr.ph88.us.us.preheader, %._crit_edge89.us.us
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %._crit_edge89.us.us ], [ 0, %.lr.ph88.us.us.preheader ]
  %23 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv160, i64 %indvars.iv156
  store double 0.000000e+00, double* %23, align 8
  br i1 %lcmp.mod190, label %.prol.loopexit188, label %.prol.preheader187

.prol.preheader187:                               ; preds = %.lr.ph88.us.us
  %24 = load double, double* %22, align 8
  %25 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 0, i64 %indvars.iv156
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %27, 0.000000e+00
  store double %28, double* %23, align 8
  br label %.prol.loopexit188

.prol.loopexit188:                                ; preds = %.prol.preheader187, %.lr.ph88.us.us
  %indvars.iv152.unr.ph = phi i64 [ 1, %.prol.preheader187 ], [ 0, %.lr.ph88.us.us ]
  %.unr191.ph = phi double [ %28, %.prol.preheader187 ], [ 0.000000e+00, %.lr.ph88.us.us ]
  br i1 %21, label %._crit_edge89.us.us, label %.lr.ph88.us.us.new.preheader

.lr.ph88.us.us.new.preheader:                     ; preds = %.prol.loopexit188
  br label %.lr.ph88.us.us.new

._crit_edge89.us.us.loopexit:                     ; preds = %.lr.ph88.us.us.new
  br label %._crit_edge89.us.us

._crit_edge89.us.us:                              ; preds = %._crit_edge89.us.us.loopexit, %.prol.loopexit188
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next157, %19
  br i1 %exitcond192, label %._crit_edge92.us.loopexit, label %.lr.ph88.us.us

.lr.ph88.us.us.new:                               ; preds = %.lr.ph88.us.us.new.preheader, %.lr.ph88.us.us.new
  %indvars.iv152 = phi i64 [ %indvars.iv.next153.1, %.lr.ph88.us.us.new ], [ %indvars.iv152.unr.ph, %.lr.ph88.us.us.new.preheader ]
  %29 = phi double [ %41, %.lr.ph88.us.us.new ], [ %.unr191.ph, %.lr.ph88.us.us.new.preheader ]
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv160, i64 %indvars.iv152
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv152, i64 %indvars.iv156
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %29, %34
  store double %35, double* %23, align 8
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv160, i64 %indvars.iv.next153
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next153, i64 %indvars.iv156
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %35, %40
  store double %41, double* %23, align 8
  %indvars.iv.next153.1 = add nuw nsw i64 %indvars.iv152, 2
  %exitcond186.1 = icmp eq i64 %indvars.iv.next153.1, %18
  br i1 %exitcond186.1, label %._crit_edge89.us.us.loopexit, label %.lr.ph88.us.us.new

.preheader70.loopexit:                            ; preds = %._crit_edge92.us
  br label %.preheader70

.preheader70:                                     ; preds = %.preheader70.loopexit, %12
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %.preheader69.lr.ph, label %.preheader68

.preheader69.lr.ph:                               ; preds = %.preheader70
  %43 = icmp sgt i32 %3, 0
  %44 = icmp sgt i32 %4, 0
  br i1 %43, label %.preheader69.us.preheader, label %.preheader68

.preheader69.us.preheader:                        ; preds = %.preheader69.lr.ph
  %45 = zext i32 %3 to i64
  %46 = shl nuw nsw i64 %45, 3
  %47 = zext i32 %4 to i64
  %48 = zext i32 %3 to i64
  %49 = zext i32 %1 to i64
  %xtraiter176 = and i64 %47, 1
  %lcmp.mod177 = icmp eq i64 %xtraiter176, 0
  %50 = icmp eq i32 %4, 1
  br label %.preheader69.us

.preheader69.us:                                  ; preds = %._crit_edge84.us, %.preheader69.us.preheader
  %indvars.iv143 = phi i64 [ 0, %.preheader69.us.preheader ], [ %indvars.iv.next144, %._crit_edge84.us ]
  br i1 %44, label %.lr.ph80.us.us.preheader, label %._crit_edge84.us.loopexit114

.lr.ph80.us.us.preheader:                         ; preds = %.preheader69.us
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 0
  br label %.lr.ph80.us.us

._crit_edge84.us.loopexit114:                     ; preds = %.preheader69.us
  %scevgep171 = getelementptr [1100 x double], [1100 x double]* %8, i64 %indvars.iv143, i64 0
  %scevgep171172 = bitcast double* %scevgep171 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep171172, i8 0, i64 %46, i32 8, i1 false)
  br label %._crit_edge84.us

._crit_edge84.us.loopexit:                        ; preds = %._crit_edge81.us.us
  br label %._crit_edge84.us

._crit_edge84.us:                                 ; preds = %._crit_edge84.us.loopexit, %._crit_edge84.us.loopexit114
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next144, %49
  br i1 %exitcond182, label %.preheader68.loopexit, label %.preheader69.us

.lr.ph80.us.us:                                   ; preds = %.lr.ph80.us.us.preheader, %._crit_edge81.us.us
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge81.us.us ], [ 0, %.lr.ph80.us.us.preheader ]
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv143, i64 %indvars.iv139
  store double 0.000000e+00, double* %52, align 8
  br i1 %lcmp.mod177, label %.prol.loopexit175, label %.prol.preheader174

.prol.preheader174:                               ; preds = %.lr.ph80.us.us
  %53 = load double, double* %51, align 8
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 0, i64 %indvars.iv139
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %56, 0.000000e+00
  store double %57, double* %52, align 8
  br label %.prol.loopexit175

.prol.loopexit175:                                ; preds = %.prol.preheader174, %.lr.ph80.us.us
  %indvars.iv135.unr.ph = phi i64 [ 1, %.prol.preheader174 ], [ 0, %.lr.ph80.us.us ]
  %.unr178.ph = phi double [ %57, %.prol.preheader174 ], [ 0.000000e+00, %.lr.ph80.us.us ]
  br i1 %50, label %._crit_edge81.us.us, label %.lr.ph80.us.us.new.preheader

.lr.ph80.us.us.new.preheader:                     ; preds = %.prol.loopexit175
  br label %.lr.ph80.us.us.new

._crit_edge81.us.us.loopexit:                     ; preds = %.lr.ph80.us.us.new
  br label %._crit_edge81.us.us

._crit_edge81.us.us:                              ; preds = %._crit_edge81.us.us.loopexit, %.prol.loopexit175
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond179 = icmp eq i64 %indvars.iv.next140, %48
  br i1 %exitcond179, label %._crit_edge84.us.loopexit, label %.lr.ph80.us.us

.lr.ph80.us.us.new:                               ; preds = %.lr.ph80.us.us.new.preheader, %.lr.ph80.us.us.new
  %indvars.iv135 = phi i64 [ %indvars.iv.next136.1, %.lr.ph80.us.us.new ], [ %indvars.iv135.unr.ph, %.lr.ph80.us.us.new.preheader ]
  %58 = phi double [ %70, %.lr.ph80.us.us.new ], [ %.unr178.ph, %.lr.ph80.us.us.new.preheader ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 %indvars.iv135
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv135, i64 %indvars.iv139
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %52, align 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv143, i64 %indvars.iv.next136
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next136, i64 %indvars.iv139
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %64, %69
  store double %70, double* %52, align 8
  %indvars.iv.next136.1 = add nuw nsw i64 %indvars.iv135, 2
  %exitcond173.1 = icmp eq i64 %indvars.iv.next136.1, %47
  br i1 %exitcond173.1, label %._crit_edge81.us.us.loopexit, label %.lr.ph80.us.us.new

.preheader68.loopexit:                            ; preds = %._crit_edge84.us
  br label %.preheader68

.preheader68:                                     ; preds = %.preheader68.loopexit, %.preheader69.lr.ph, %.preheader70
  %71 = icmp sgt i32 %0, 0
  br i1 %71, label %.preheader.lr.ph, label %._crit_edge77

.preheader.lr.ph:                                 ; preds = %.preheader71.lr.ph, %.preheader68
  %72 = icmp sgt i32 %3, 0
  %73 = icmp sgt i32 %1, 0
  br i1 %72, label %.preheader.us.preheader, label %._crit_edge77

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %74 = zext i32 %3 to i64
  %75 = shl nuw nsw i64 %74, 3
  %76 = zext i32 %1 to i64
  %77 = zext i32 %3 to i64
  %78 = zext i32 %0 to i64
  %xtraiter = and i64 %76, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %79 = icmp eq i32 %1, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge75.us, %.preheader.us.preheader
  %indvars.iv126 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next127, %._crit_edge75.us ]
  br i1 %73, label %.lr.ph.us.us.preheader, label %._crit_edge75.us.loopexit112

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %80 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv126, i64 0
  br label %.lr.ph.us.us

._crit_edge75.us.loopexit112:                     ; preds = %.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %11, i64 %indvars.iv126, i64 0
  %scevgep166 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep166, i8 0, i64 %75, i32 8, i1 false)
  br label %._crit_edge75.us

._crit_edge75.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge75.us

._crit_edge75.us:                                 ; preds = %._crit_edge75.us.loopexit, %._crit_edge75.us.loopexit112
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next127, %78
  br i1 %exitcond169, label %._crit_edge77.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %81 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv126, i64 %indvars.iv122
  store double 0.000000e+00, double* %81, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %82 = load double, double* %80, align 8
  %83 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 0, i64 %indvars.iv122
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %85, 0.000000e+00
  store double %86, double* %81, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv118.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %.unr.ph = phi double [ %86, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  br i1 %79, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond = icmp eq i64 %indvars.iv.next123, %77
  br i1 %exitcond, label %._crit_edge75.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.1, %.lr.ph.us.us.new ], [ %indvars.iv118.unr.ph, %.lr.ph.us.us.new.preheader ]
  %87 = phi double [ %99, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %88 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv126, i64 %indvars.iv118
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv118, i64 %indvars.iv122
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = fadd double %87, %92
  store double %93, double* %81, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %94 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv126, i64 %indvars.iv.next119
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next119, i64 %indvars.iv122
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fadd double %93, %98
  store double %99, double* %81, align 8
  %indvars.iv.next119.1 = add nuw nsw i64 %indvars.iv118, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next119.1, %76
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge77.loopexit:                           ; preds = %._crit_edge75.us
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %.preheader.lr.ph, %.preheader68
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %11 = zext i32 %1 to i64
  %12 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv17 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next18, %._crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv17, %10
  br label %14

; <label>:14:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %21 ], [ 0, %.preheader.us ]
  %15 = add nsw i64 %indvars.iv, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %19, %14
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond22, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, %12
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %3
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
