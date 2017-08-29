; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv61 = phi i64 [ 0, %4 ], [ %indvars.iv.next62.1, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv61
  %6 = bitcast double* %5 to <2 x double>*
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv61
  %8 = bitcast double* %7 to <2 x double>*
  %indvars.iv.next62 = or i64 %indvars.iv61, 1
  %9 = trunc i64 %indvars.iv.next62 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv61
  store <2 x double> zeroinitializer, <2 x double>* %6, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %12 = trunc i64 %indvars.iv.next62.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond63.1 = icmp eq i64 %indvars.iv.next62, 1999
  br i1 %exitcond63.1, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge20.._crit_edge1_crit_edge
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge20.._crit_edge1_crit_edge ], [ 0, %.lr.ph.preheader ]
  %20 = shl i64 %indvars.iv59, 32
  %sext = add i64 %20, 4294967296
  %21 = ashr exact i64 %sext, 32
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %21
  %22 = sub i64 1998, %indvars.iv59
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %27

._crit_edge2:                                     ; preds = %27
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %26 = icmp slt i64 %indvars.iv.next60, 2000
  br i1 %26, label %._crit_edge20.._crit_edge1_crit_edge, label %37

; <label>:27:                                     ; preds = %._crit_edge64, %.lr.ph
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge64 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv42
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv42
  store double %33, double* %34, align 8
  %exitcond50 = icmp eq i64 %indvars.iv42, %indvars.iv59
  br i1 %exitcond50, label %._crit_edge2, label %._crit_edge64

._crit_edge64:                                    ; preds = %27
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  br label %27

._crit_edge20.._crit_edge1_crit_edge:             ; preds = %._crit_edge2
  %35 = bitcast double* %scevgep57 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %35, i8 0, i64 %25, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %._crit_edge2
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %.._crit_edge3_crit_edge, %37
  %indvars.iv40 = phi i64 [ 0, %37 ], [ %indvars.iv.next41.7, %.._crit_edge3_crit_edge ]
  %40 = mul nuw nsw i64 %indvars.iv40, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %41 = mul nuw nsw i64 %indvars.iv.next41, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.1 = or i64 %indvars.iv40, 2
  %42 = mul nuw nsw i64 %indvars.iv.next41.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.2 = or i64 %indvars.iv40, 3
  %43 = mul nuw nsw i64 %indvars.iv.next41.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.3 = or i64 %indvars.iv40, 4
  %44 = mul nuw nsw i64 %indvars.iv.next41.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.4 = or i64 %indvars.iv40, 5
  %45 = mul nuw nsw i64 %indvars.iv.next41.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.5 = or i64 %indvars.iv40, 6
  %46 = mul nuw nsw i64 %indvars.iv.next41.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.6 = or i64 %indvars.iv40, 7
  %47 = mul nuw nsw i64 %indvars.iv.next41.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next41.7 = add nsw i64 %indvars.iv40, 8
  %48 = icmp slt i64 %indvars.iv.next41.7, 2000
  br i1 %48, label %.._crit_edge3_crit_edge, label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %.._crit_edge3_crit_edge
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.preheader, %61
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %61 ], [ 0, %._crit_edge5.preheader ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %59, %._crit_edge5
  %indvars.iv33 = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next34, %59 ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv35
  br label %51

; <label>:51:                                     ; preds = %._crit_edge65, %._crit_edge7
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge65 ], [ 0, %._crit_edge7 ]
  %52 = load double, double* %50, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv35
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv33, i64 %indvars.iv30
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %56, align 8
  %exitcond32 = icmp eq i64 %indvars.iv30, 1999
  br i1 %exitcond32, label %59, label %._crit_edge65

._crit_edge65:                                    ; preds = %51
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br label %51

; <label>:59:                                     ; preds = %51
  %indvars.iv.next34 = add nuw i64 %indvars.iv33, 1
  %60 = icmp slt i64 %indvars.iv.next34, 2000
  br i1 %60, label %._crit_edge7, label %61

; <label>:61:                                     ; preds = %59
  %indvars.iv.next36 = add nuw i64 %indvars.iv35, 1
  %62 = icmp slt i64 %indvars.iv.next36, 2000
  br i1 %62, label %._crit_edge5, label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %61
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %76, %._crit_edge8.preheader
  %indvars.iv28 = phi i64 [ 0, %._crit_edge8.preheader ], [ %indvars.iv.next29.1, %76 ]
  br label %63

; <label>:63:                                     ; preds = %._crit_edge66, %._crit_edge8
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge66 ], [ 0, %._crit_edge8 ]
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv28, i64 %indvars.iv
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %._crit_edge8.167, label %._crit_edge66

._crit_edge66:                                    ; preds = %63
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %63

._crit_edge8.167:                                 ; preds = %63
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  br label %70

; <label>:69:                                     ; preds = %76
  tail call void @free(i8* nonnull %39) #4
  ret void

; <label>:70:                                     ; preds = %._crit_edge66.1, %._crit_edge8.167
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %._crit_edge66.1 ], [ 0, %._crit_edge8.167 ]
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv.next29, i64 %indvars.iv.1
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next29, i64 %indvars.iv.1
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond.1, label %76, label %._crit_edge66.1

._crit_edge66.1:                                  ; preds = %70
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %70

; <label>:76:                                     ; preds = %70
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %77 = icmp slt i64 %indvars.iv.next29.1, 2000
  br i1 %77, label %._crit_edge8, label %69
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge38.._crit_edge_crit_edge, %4
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge38.._crit_edge_crit_edge ], [ 0, %4 ]
  %indvars.iv85 = phi i32 [ %indvars.iv.next86, %._crit_edge38.._crit_edge_crit_edge ], [ -1, %4 ]
  %5 = icmp sgt i64 %indvars.iv93, 0
  br i1 %5, label %.lr.ph28.preheader, label %.lr.ph37.split.preheader

.lr.ph37.split.preheader:                         ; preds = %._crit_edge
  br label %.lr.ph37.split

.lr.ph28.preheader:                               ; preds = %._crit_edge
  br label %.lr.ph28

.lr.ph37.split.us.preheader:                      ; preds = %._crit_edge25
  %wide.trip.count87 = zext i32 %indvars.iv85 to i64
  br label %.lr.ph37.split.us

.lr.ph37.split.us:                                ; preds = %._crit_edge33.us, %.lr.ph37.split.us.preheader
  %indvars.iv91 = phi i64 [ %indvars.iv93, %.lr.ph37.split.us.preheader ], [ %indvars.iv.next92, %._crit_edge33.us ]
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv91
  %7 = load double, double* %6, align 8
  br label %8

; <label>:8:                                      ; preds = %._crit_edge104, %.lr.ph37.split.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge104 ], [ 0, %.lr.ph37.split.us ]
  %.130.us = phi double [ %14, %._crit_edge104 ], [ %7, %.lr.ph37.split.us ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv80
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv80, i64 %indvars.iv91
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.130.us, %13
  %exitcond88 = icmp eq i64 %indvars.iv80, %wide.trip.count87
  br i1 %exitcond88, label %._crit_edge33.us, label %._crit_edge104

._crit_edge104:                                   ; preds = %8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  br label %8

._crit_edge33.us:                                 ; preds = %8
  store double %14, double* %6, align 8
  %indvars.iv.next92 = add nuw i64 %indvars.iv91, 1
  %15 = icmp slt i64 %indvars.iv.next92, 2000
  br i1 %15, label %.lr.ph37.split.us, label %._crit_edge38.loopexit

.lr.ph28:                                         ; preds = %.lr.ph28.preheader, %._crit_edge25..lr.ph28_crit_edge
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge25..lr.ph28_crit_edge ], [ 0, %.lr.ph28.preheader ]
  %indvars.iv68 = phi i32 [ %indvars.iv.next69, %._crit_edge25..lr.ph28_crit_edge ], [ -1, %.lr.ph28.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv72
  %17 = load double, double* %16, align 8
  %18 = icmp sgt i64 %indvars.iv72, 0
  br i1 %18, label %.lr.ph24.preheader, label %._crit_edge25

.lr.ph24.preheader:                               ; preds = %.lr.ph28
  %wide.trip.count70 = zext i32 %indvars.iv68 to i64
  br label %.lr.ph24

.lr.ph24:                                         ; preds = %.lr.ph24..lr.ph24_crit_edge, %.lr.ph24.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.lr.ph24..lr.ph24_crit_edge ], [ 0, %.lr.ph24.preheader ]
  %.022 = phi double [ %24, %.lr.ph24..lr.ph24_crit_edge ], [ %17, %.lr.ph24.preheader ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv63
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv72
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %.022, %23
  %exitcond71 = icmp eq i64 %indvars.iv63, %wide.trip.count70
  br i1 %exitcond71, label %._crit_edge25.loopexit, label %.lr.ph24..lr.ph24_crit_edge

.lr.ph24..lr.ph24_crit_edge:                      ; preds = %.lr.ph24
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %.lr.ph24

._crit_edge25.loopexit:                           ; preds = %.lr.ph24
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.lr.ph28
  %.0.lcssa = phi double [ %17, %.lr.ph28 ], [ %24, %._crit_edge25.loopexit ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv72, i64 %indvars.iv72
  %26 = load double, double* %25, align 8
  %27 = fdiv double %.0.lcssa, %26
  store double %27, double* %16, align 8
  %indvars.iv.next73 = add nuw i64 %indvars.iv72, 1
  %28 = icmp slt i64 %indvars.iv.next73, %indvars.iv93
  br i1 %28, label %._crit_edge25..lr.ph28_crit_edge, label %.lr.ph37.split.us.preheader

._crit_edge25..lr.ph28_crit_edge:                 ; preds = %._crit_edge25
  %indvars.iv.next69 = add nsw i32 %indvars.iv68, 1
  br label %.lr.ph28

.lr.ph37.split:                                   ; preds = %.lr.ph37.split.preheader, %.lr.ph37.split..lr.ph37.split_crit_edge
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %.lr.ph37.split..lr.ph37.split_crit_edge ], [ %indvars.iv93, %.lr.ph37.split.preheader ]
  %exitcond78 = icmp eq i64 %indvars.iv76, 1999
  br i1 %exitcond78, label %._crit_edge38.loopexit108, label %.lr.ph37.split..lr.ph37.split_crit_edge

.lr.ph37.split..lr.ph37.split_crit_edge:          ; preds = %.lr.ph37.split
  %indvars.iv.next77 = add nuw i64 %indvars.iv76, 1
  br label %.lr.ph37.split

._crit_edge38.loopexit:                           ; preds = %._crit_edge33.us
  br label %._crit_edge38

._crit_edge38.loopexit108:                        ; preds = %.lr.ph37.split
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit108, %._crit_edge38.loopexit
  %indvars.iv.next94 = add nuw i64 %indvars.iv93, 1
  %29 = icmp slt i64 %indvars.iv.next94, 2000
  br i1 %29, label %._crit_edge38.._crit_edge_crit_edge, label %._crit_edge1.preheader

._crit_edge1.preheader:                           ; preds = %._crit_edge38
  br label %._crit_edge1

._crit_edge38.._crit_edge_crit_edge:              ; preds = %._crit_edge38
  %indvars.iv.next86 = add nsw i32 %indvars.iv85, 1
  br label %._crit_edge

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge17.._crit_edge1_crit_edge
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge17.._crit_edge1_crit_edge ], [ 0, %._crit_edge1.preheader ]
  %indvars.iv57 = phi i32 [ %indvars.iv.next58, %._crit_edge17.._crit_edge1_crit_edge ], [ -1, %._crit_edge1.preheader ]
  %30 = getelementptr inbounds double, double* %1, i64 %indvars.iv61
  %31 = load double, double* %30, align 8
  %32 = icmp sgt i64 %indvars.iv61, 0
  br i1 %32, label %.lr.ph16.preheader, label %._crit_edge17

.lr.ph16.preheader:                               ; preds = %._crit_edge1
  %wide.trip.count59 = zext i32 %indvars.iv57 to i64
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %.lr.ph16..lr.ph16_crit_edge, %.lr.ph16.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %.lr.ph16..lr.ph16_crit_edge ], [ 0, %.lr.ph16.preheader ]
  %.214 = phi double [ %38, %.lr.ph16..lr.ph16_crit_edge ], [ %31, %.lr.ph16.preheader ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv61, i64 %indvars.iv52
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv52
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %.214, %37
  %exitcond60 = icmp eq i64 %indvars.iv52, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge17.loopexit, label %.lr.ph16..lr.ph16_crit_edge

.lr.ph16..lr.ph16_crit_edge:                      ; preds = %.lr.ph16
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  br label %.lr.ph16

._crit_edge17.loopexit:                           ; preds = %.lr.ph16
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %._crit_edge1
  %.2.lcssa = phi double [ %31, %._crit_edge1 ], [ %38, %._crit_edge17.loopexit ]
  %39 = getelementptr inbounds double, double* %3, i64 %indvars.iv61
  store double %.2.lcssa, double* %39, align 8
  %indvars.iv.next62 = add nuw i64 %indvars.iv61, 1
  %40 = icmp slt i64 %indvars.iv.next62, 2000
  br i1 %40, label %._crit_edge17.._crit_edge1_crit_edge, label %._crit_edge3.preheader

._crit_edge3.preheader:                           ; preds = %._crit_edge17
  br label %._crit_edge3

._crit_edge17.._crit_edge1_crit_edge:             ; preds = %._crit_edge17
  %indvars.iv.next58 = add nsw i32 %indvars.iv57, 1
  br label %._crit_edge1

._crit_edge3:                                     ; preds = %._crit_edge3.preheader, %._crit_edge10.._crit_edge3_crit_edge
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge10.._crit_edge3_crit_edge ], [ 1999, %._crit_edge3.preheader ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge10.._crit_edge3_crit_edge ], [ 2000, %._crit_edge3.preheader ]
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv49
  %42 = load double, double* %41, align 8
  %43 = add nsw i64 %indvars.iv49, 1
  %44 = icmp slt i64 %43, 2000
  br i1 %44, label %._crit_edge3..lr.ph_crit_edge, label %._crit_edge10.thread

._crit_edge10.thread:                             ; preds = %._crit_edge3
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv49
  %46 = load double, double* %45, align 8
  %47 = fdiv double %42, %46
  %48 = getelementptr inbounds double, double* %2, i64 %indvars.iv49
  store double %47, double* %48, align 8
  br label %._crit_edge10.._crit_edge3_crit_edge

._crit_edge3..lr.ph_crit_edge:                    ; preds = %._crit_edge3
  %49 = sext i32 %indvars.iv to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %._crit_edge3..lr.ph_crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %.lr.ph..lr.ph_crit_edge ], [ %49, %._crit_edge3..lr.ph_crit_edge ]
  %.37 = phi double [ %55, %.lr.ph..lr.ph_crit_edge ], [ %42, %._crit_edge3..lr.ph_crit_edge ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv47
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds double, double* %2, i64 %indvars.iv47
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %.37, %54
  %exitcond = icmp eq i64 %indvars.iv47, 1999
  br i1 %exitcond, label %._crit_edge10, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next48 = add nsw i64 %indvars.iv47, 1
  br label %.lr.ph

._crit_edge10:                                    ; preds = %.lr.ph
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv49
  %57 = load double, double* %56, align 8
  %58 = fdiv double %55, %57
  %59 = getelementptr inbounds double, double* %2, i64 %indvars.iv49
  store double %58, double* %59, align 8
  %60 = icmp sgt i64 %indvars.iv49, 0
  br i1 %60, label %._crit_edge10.._crit_edge3_crit_edge, label %61

._crit_edge10.._crit_edge3_crit_edge:             ; preds = %._crit_edge10, %._crit_edge10.thread
  %indvars.iv.next50 = add i64 %indvars.iv49, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  br label %._crit_edge3

; <label>:61:                                     ; preds = %._crit_edge10
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge2
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %15 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %15, label %._crit_edge2, label %16

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
