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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge19

._crit_edge19:                                    ; preds = %12
  br label %16

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(double* %9)
  br label %16

; <label>:16:                                     ; preds = %._crit_edge19, %._crit_edge, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %5

; <label>:5:                                      ; preds = %._crit_edge1, %4
  %indvars.iv138 = phi i64 [ 0, %4 ], [ %indvars.iv.next139.1, %._crit_edge1 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv138
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  %9 = bitcast double* %8 to <2 x double>*
  %10 = trunc i64 %indvars.iv138 to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv138
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next139.1 = add nsw i64 %indvars.iv138, 2
  %14 = trunc i64 %indvars.iv.next139.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %12, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = fmul <2 x double> %18, <double 5.000000e-01, double 5.000000e-01>
  %20 = fadd <2 x double> %19, <double 4.000000e+00, double 4.000000e+00>
  %21 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %exitcond140.1 = icmp eq i64 %indvars.iv.next139.1, 2000
  br i1 %exitcond140.1, label %..lr.ph_crit_edge, label %._crit_edge1

._crit_edge1:                                     ; preds = %5
  br label %5

..lr.ph_crit_edge:                                ; preds = %5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %..lr.ph_crit_edge
  %indvars.iv135 = phi i64 [ 0, %..lr.ph_crit_edge ], [ %indvars.iv.next136, %.lr.ph.backedge ]
  %22 = mul nuw nsw i64 %indvars.iv135, 2001
  %23 = add nuw nsw i64 %22, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %23
  %24 = sub i64 1998, %indvars.iv135
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  %27 = add nuw nsw i64 %26, 8
  br label %28

; <label>:28:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %._crit_edge2 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv118
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv118
  store double %34, double* %35, align 8
  %exitcond126 = icmp eq i64 %indvars.iv118, %indvars.iv135
  br i1 %exitcond126, label %._crit_edge, label %._crit_edge2

._crit_edge2:                                     ; preds = %28
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  br label %28

._crit_edge:                                      ; preds = %28
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %36 = icmp slt i64 %indvars.iv.next136, 2000
  br i1 %36, label %._crit_edge93.thread, label %._crit_edge93

._crit_edge93.thread:                             ; preds = %._crit_edge
  %37 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %37, i8 0, i64 %27, i32 8, i1 false)
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv135
  store double 1.000000e+00, double* %38, align 8
  br label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge93.thread, %._crit_edge93..lr.ph_crit_edge
  br label %.lr.ph

._crit_edge93:                                    ; preds = %._crit_edge
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv135, i64 %indvars.iv135
  store double 1.000000e+00, double* %39, align 8
  %exitcond137 = icmp eq i64 %indvars.iv.next136, 2000
  br i1 %exitcond137, label %40, label %._crit_edge93..lr.ph_crit_edge

._crit_edge93..lr.ph_crit_edge:                   ; preds = %._crit_edge93
  br label %.lr.ph.backedge

; <label>:40:                                     ; preds = %._crit_edge93
  %41 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %41, i8 0, i64 32000000, i32 8, i1 false)
  %42 = bitcast i8* %41 to [2000 x [2000 x double]]*
  br label %43

; <label>:43:                                     ; preds = %._crit_edge5, %40
  %.07385 = phi i32 [ 0, %40 ], [ %67, %._crit_edge5 ]
  %44 = sext i32 %.07385 to i64
  br label %45

; <label>:45:                                     ; preds = %._crit_edge4, %43
  %.17784 = phi i32 [ 0, %43 ], [ %64, %._crit_edge4 ]
  %46 = sext i32 %.17784 to i64
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %46, i64 %44
  br label %48

; <label>:48:                                     ; preds = %._crit_edge3, %45
  %indvars.iv109 = phi i64 [ 0, %45 ], [ %indvars.iv.next110.1, %._crit_edge3 ]
  %49 = load double, double* %47, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %44
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %46, i64 %indvars.iv109
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %56 = load double, double* %47, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next110, i64 %44
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %46, i64 %indvars.iv.next110
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next110.1, 2000
  br i1 %exitcond111.1, label %63, label %._crit_edge3

._crit_edge3:                                     ; preds = %48
  br label %48

; <label>:63:                                     ; preds = %48
  %64 = add nsw i32 %.17784, 1
  %65 = icmp slt i32 %64, 2000
  br i1 %65, label %._crit_edge4, label %66

._crit_edge4:                                     ; preds = %63
  br label %45

; <label>:66:                                     ; preds = %63
  %67 = add nsw i32 %.07385, 1
  %68 = icmp slt i32 %67, 2000
  br i1 %68, label %._crit_edge5, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %66
  br label %.preheader

._crit_edge5:                                     ; preds = %66
  br label %43

.preheader:                                       ; preds = %..preheader_crit_edge7, %..preheader_crit_edge
  %indvar = phi i64 [ %indvar.next, %..preheader_crit_edge7 ], [ 0, %..preheader_crit_edge ]
  %.27882 = phi i64 [ %97, %..preheader_crit_edge7 ], [ 0, %..preheader_crit_edge ]
  %sext = shl i64 %.27882, 32
  %69 = ashr exact i64 %sext, 32
  br label %70

; <label>:70:                                     ; preds = %._crit_edge6, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %._crit_edge6 ]
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %69, i64 %indvars.iv
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %69, i64 %indvars.iv
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %69, i64 %indvars.iv.next
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %69, i64 %indvars.iv.next
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %69, i64 %indvars.iv.next.1
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %69, i64 %indvars.iv.next.1
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %69, i64 %indvars.iv.next.2
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %69, i64 %indvars.iv.next.2
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %69, i64 %indvars.iv.next.3
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %69, i64 %indvars.iv.next.3
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %96, label %._crit_edge6

._crit_edge6:                                     ; preds = %70
  br label %70

; <label>:96:                                     ; preds = %70
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond, label %98, label %..preheader_crit_edge7

..preheader_crit_edge7:                           ; preds = %96
  %97 = add nsw i64 %69, 1
  br label %.preheader

; <label>:98:                                     ; preds = %96
  call void @free(i8* nonnull %41) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %5

; <label>:5:                                      ; preds = %._crit_edge123._crit_edge, %4
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %._crit_edge123._crit_edge ], [ 0, %4 ]
  %6 = add i64 %indvars.iv167, 4294967295
  %7 = icmp sgt i64 %indvars.iv167, 0
  br i1 %7, label %.lr.ph112.preheader, label %.._crit_edge123_crit_edge

.._crit_edge123_crit_edge:                        ; preds = %5
  br label %._crit_edge123

.lr.ph112.preheader:                              ; preds = %5
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv167, i64 0
  br label %.lr.ph112

.lr.ph112:                                        ; preds = %._crit_edge108..lr.ph112_crit_edge, %.lr.ph112.preheader
  %indvars.iv155 = phi i64 [ %indvars.iv.next156, %._crit_edge108..lr.ph112_crit_edge ], [ 0, %.lr.ph112.preheader ]
  %9 = add i64 %indvars.iv155, 4294967295
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv167, i64 %indvars.iv155
  %11 = load double, double* %10, align 8
  %12 = icmp sgt i64 %indvars.iv155, 0
  br i1 %12, label %..lr.ph107_crit_edge, label %.lr.ph112.._crit_edge108_crit_edge

.lr.ph112.._crit_edge108_crit_edge:               ; preds = %.lr.ph112
  br label %._crit_edge108

..lr.ph107_crit_edge:                             ; preds = %.lr.ph112
  %xtraiter150171 = and i64 %indvars.iv155, 1
  %lcmp.mod151 = icmp eq i64 %xtraiter150171, 0
  br i1 %lcmp.mod151, label %..lr.ph107_crit_edge..lr.ph107.prol.loopexit_crit_edge, label %.lr.ph107.prol

..lr.ph107_crit_edge..lr.ph107.prol.loopexit_crit_edge: ; preds = %..lr.ph107_crit_edge
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol:                                   ; preds = %..lr.ph107_crit_edge
  %13 = load double, double* %8, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv155
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %11, %16
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.loopexit:                          ; preds = %..lr.ph107_crit_edge..lr.ph107.prol.loopexit_crit_edge, %.lr.ph107.prol
  %indvars.iv145.unr.ph = phi i64 [ 1, %.lr.ph107.prol ], [ 0, %..lr.ph107_crit_edge..lr.ph107.prol.loopexit_crit_edge ]
  %.0105.unr.ph = phi double [ %17, %.lr.ph107.prol ], [ %11, %..lr.ph107_crit_edge..lr.ph107.prol.loopexit_crit_edge ]
  %.lcssa131.unr.ph = phi double [ %17, %.lr.ph107.prol ], [ undef, %..lr.ph107_crit_edge..lr.ph107.prol.loopexit_crit_edge ]
  %18 = trunc i64 %9 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %.lr.ph107.prol.loopexit.._crit_edge108_crit_edge, label %.lr.ph107.prol.loopexit..lr.ph107_crit_edge

.lr.ph107.prol.loopexit..lr.ph107_crit_edge:      ; preds = %.lr.ph107.prol.loopexit
  br label %.lr.ph107

.lr.ph107.prol.loopexit.._crit_edge108_crit_edge: ; preds = %.lr.ph107.prol.loopexit
  br label %._crit_edge108

.lr.ph107:                                        ; preds = %.lr.ph107..lr.ph107_crit_edge, %.lr.ph107.prol.loopexit..lr.ph107_crit_edge
  %indvars.iv145 = phi i64 [ %indvars.iv.next146.1, %.lr.ph107..lr.ph107_crit_edge ], [ %indvars.iv145.unr.ph, %.lr.ph107.prol.loopexit..lr.ph107_crit_edge ]
  %.0105 = phi double [ %33, %.lr.ph107..lr.ph107_crit_edge ], [ %.0105.unr.ph, %.lr.ph107.prol.loopexit..lr.ph107_crit_edge ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv167, i64 %indvars.iv145
  %21 = bitcast double* %20 to <2 x double>*
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv145, i64 %indvars.iv155
  %23 = load double, double* %22, align 8
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %24 = load <2 x double>, <2 x double>* %21, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next146, i64 %indvars.iv155
  %26 = load double, double* %25, align 8
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fmul <2 x double> %24, %28
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fsub double %.0105, %30
  %33 = fsub double %32, %31
  %indvars.iv.next146.1 = add nsw i64 %indvars.iv145, 2
  %exitcond147.1 = icmp eq i64 %indvars.iv.next146.1, %indvars.iv155
  br i1 %exitcond147.1, label %.lr.ph107.._crit_edge108_crit_edge, label %.lr.ph107..lr.ph107_crit_edge

.lr.ph107..lr.ph107_crit_edge:                    ; preds = %.lr.ph107
  br label %.lr.ph107

.lr.ph107.._crit_edge108_crit_edge:               ; preds = %.lr.ph107
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %.lr.ph107.._crit_edge108_crit_edge, %.lr.ph107.prol.loopexit.._crit_edge108_crit_edge, %.lr.ph112.._crit_edge108_crit_edge
  %.0.lcssa = phi double [ %11, %.lr.ph112.._crit_edge108_crit_edge ], [ %.lcssa131.unr.ph, %.lr.ph107.prol.loopexit.._crit_edge108_crit_edge ], [ %33, %.lr.ph107.._crit_edge108_crit_edge ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv155, i64 %indvars.iv155
  %35 = load double, double* %34, align 8
  %36 = fdiv double %.0.lcssa, %35
  store double %36, double* %10, align 8
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %exitcond154 = icmp eq i64 %indvars.iv.next156, %indvars.iv167
  br i1 %exitcond154, label %.lr.ph122, label %._crit_edge108..lr.ph112_crit_edge

._crit_edge108..lr.ph112_crit_edge:               ; preds = %._crit_edge108
  br label %.lr.ph112

.lr.ph122:                                        ; preds = %._crit_edge108
  br i1 true, label %.lr.ph122..lr.ph122.split.us_crit_edge, label %.lr.ph122.._crit_edge123_crit_edge

.lr.ph122.._crit_edge123_crit_edge:               ; preds = %.lr.ph122
  br label %._crit_edge123

.lr.ph122..lr.ph122.split.us_crit_edge:           ; preds = %.lr.ph122
  %37 = trunc i64 %indvars.iv167 to i32
  %xtraiter163170 = and i64 %indvars.iv167, 1
  %38 = trunc i64 %6 to i32
  %39 = icmp eq i64 %xtraiter163170, 0
  %40 = icmp eq i32 %38, 0
  br label %.lr.ph122.split.us

.lr.ph122.split.us:                               ; preds = %._crit_edge118.us..lr.ph122.split.us_crit_edge, %.lr.ph122..lr.ph122.split.us_crit_edge
  %.187120.us = phi i32 [ %37, %.lr.ph122..lr.ph122.split.us_crit_edge ], [ %63, %._crit_edge118.us..lr.ph122.split.us_crit_edge ]
  %41 = sext i32 %.187120.us to i64
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv167, i64 %41
  %43 = load double, double* %42, align 8
  br i1 %39, label %.lr.ph122.split.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph122.split.us..prol.loopexit_crit_edge:      ; preds = %.lr.ph122.split.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph122.split.us
  %44 = load double, double* %8, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %41
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %43, %47
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph122.split.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv158.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph122.split.us..prol.loopexit_crit_edge ]
  %.1115.us.unr.ph = phi double [ %48, %.prol.preheader ], [ %43, %.lr.ph122.split.us..prol.loopexit_crit_edge ]
  %.lcssa.unr.ph = phi double [ %48, %.prol.preheader ], [ undef, %.lr.ph122.split.us..prol.loopexit_crit_edge ]
  br i1 %40, label %.prol.loopexit.._crit_edge118.us_crit_edge, label %.prol.loopexit..lr.ph122.split.us.new_crit_edge

.prol.loopexit..lr.ph122.split.us.new_crit_edge:  ; preds = %.prol.loopexit
  br label %.lr.ph122.split.us.new

.prol.loopexit.._crit_edge118.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge118.us

.lr.ph122.split.us.new:                           ; preds = %.lr.ph122.split.us.new..lr.ph122.split.us.new_crit_edge, %.prol.loopexit..lr.ph122.split.us.new_crit_edge
  %indvars.iv158 = phi i64 [ %indvars.iv.next159.1, %.lr.ph122.split.us.new..lr.ph122.split.us.new_crit_edge ], [ %indvars.iv158.unr.ph, %.prol.loopexit..lr.ph122.split.us.new_crit_edge ]
  %.1115.us = phi double [ %62, %.lr.ph122.split.us.new..lr.ph122.split.us.new_crit_edge ], [ %.1115.us.unr.ph, %.prol.loopexit..lr.ph122.split.us.new_crit_edge ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv167, i64 %indvars.iv158
  %50 = bitcast double* %49 to <2 x double>*
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv158, i64 %41
  %52 = load double, double* %51, align 8
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %53 = load <2 x double>, <2 x double>* %50, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next159, i64 %41
  %55 = load double, double* %54, align 8
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  %58 = fmul <2 x double> %53, %57
  %59 = extractelement <2 x double> %58, i32 0
  %60 = extractelement <2 x double> %58, i32 1
  %61 = fsub double %.1115.us, %59
  %62 = fsub double %61, %60
  %indvars.iv.next159.1 = add nsw i64 %indvars.iv158, 2
  %exitcond162.1 = icmp eq i64 %indvars.iv.next159.1, %indvars.iv167
  br i1 %exitcond162.1, label %.lr.ph122.split.us.new.._crit_edge118.us_crit_edge, label %.lr.ph122.split.us.new..lr.ph122.split.us.new_crit_edge

.lr.ph122.split.us.new..lr.ph122.split.us.new_crit_edge: ; preds = %.lr.ph122.split.us.new
  br label %.lr.ph122.split.us.new

.lr.ph122.split.us.new.._crit_edge118.us_crit_edge: ; preds = %.lr.ph122.split.us.new
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %.lr.ph122.split.us.new.._crit_edge118.us_crit_edge, %.prol.loopexit.._crit_edge118.us_crit_edge
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit.._crit_edge118.us_crit_edge ], [ %62, %.lr.ph122.split.us.new.._crit_edge118.us_crit_edge ]
  store double %.lcssa, double* %42, align 8
  %63 = add nsw i32 %.187120.us, 1
  %64 = icmp slt i32 %63, 2000
  br i1 %64, label %._crit_edge118.us..lr.ph122.split.us_crit_edge, label %._crit_edge118.us.._crit_edge123_crit_edge

._crit_edge118.us.._crit_edge123_crit_edge:       ; preds = %._crit_edge118.us
  br label %._crit_edge123

._crit_edge118.us..lr.ph122.split.us_crit_edge:   ; preds = %._crit_edge118.us
  br label %.lr.ph122.split.us

._crit_edge123:                                   ; preds = %._crit_edge118.us.._crit_edge123_crit_edge, %.lr.ph122.._crit_edge123_crit_edge, %.._crit_edge123_crit_edge
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond169 = icmp eq i64 %indvars.iv.next168, 2000
  br i1 %exitcond169, label %._crit_edge123.._crit_edge123._crit_edge126_crit_edge, label %._crit_edge123._crit_edge

._crit_edge123._crit_edge:                        ; preds = %._crit_edge123
  br label %5

._crit_edge123.._crit_edge123._crit_edge126_crit_edge: ; preds = %._crit_edge123
  br label %._crit_edge123._crit_edge126

._crit_edge123._crit_edge126:                     ; preds = %._crit_edge101.._crit_edge123._crit_edge126_crit_edge, %._crit_edge123.._crit_edge123._crit_edge126_crit_edge
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge101.._crit_edge123._crit_edge126_crit_edge ], [ 0, %._crit_edge123.._crit_edge123._crit_edge126_crit_edge ]
  %65 = add i64 %indvars.iv143, 4294967295
  %66 = getelementptr inbounds double, double* %1, i64 %indvars.iv143
  %67 = load double, double* %66, align 8
  %68 = icmp sgt i64 %indvars.iv143, 0
  br i1 %68, label %..lr.ph100_crit_edge, label %._crit_edge123._crit_edge126.._crit_edge101_crit_edge

._crit_edge123._crit_edge126.._crit_edge101_crit_edge: ; preds = %._crit_edge123._crit_edge126
  br label %._crit_edge101

..lr.ph100_crit_edge:                             ; preds = %._crit_edge123._crit_edge126
  %69 = trunc i64 %indvars.iv143 to i32
  %xtraiter138 = and i32 %69, 3
  %lcmp.mod139 = icmp eq i32 %xtraiter138, 0
  br i1 %lcmp.mod139, label %..lr.ph100_crit_edge..lr.ph100.prol.loopexit_crit_edge, label %..lr.ph100_crit_edge..lr.ph100.prol_crit_edge

..lr.ph100_crit_edge..lr.ph100.prol_crit_edge:    ; preds = %..lr.ph100_crit_edge
  br label %.lr.ph100.prol

..lr.ph100_crit_edge..lr.ph100.prol.loopexit_crit_edge: ; preds = %..lr.ph100_crit_edge
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol:                                   ; preds = %.lr.ph100.prol..lr.ph100.prol_crit_edge, %..lr.ph100_crit_edge..lr.ph100.prol_crit_edge
  %indvars.iv134.prol = phi i64 [ %indvars.iv.next135.prol, %.lr.ph100.prol..lr.ph100.prol_crit_edge ], [ 0, %..lr.ph100_crit_edge..lr.ph100.prol_crit_edge ]
  %.298.prol = phi double [ %75, %.lr.ph100.prol..lr.ph100.prol_crit_edge ], [ %67, %..lr.ph100_crit_edge..lr.ph100.prol_crit_edge ]
  %prol.iter141 = phi i32 [ %prol.iter141.sub, %.lr.ph100.prol..lr.ph100.prol_crit_edge ], [ %xtraiter138, %..lr.ph100_crit_edge..lr.ph100.prol_crit_edge ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv143, i64 %indvars.iv134.prol
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %3, i64 %indvars.iv134.prol
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fsub double %.298.prol, %74
  %indvars.iv.next135.prol = add nuw nsw i64 %indvars.iv134.prol, 1
  %prol.iter141.sub = add i32 %prol.iter141, -1
  %prol.iter141.cmp = icmp eq i32 %prol.iter141.sub, 0
  br i1 %prol.iter141.cmp, label %.lr.ph100.prol..lr.ph100.prol.loopexit_crit_edge, label %.lr.ph100.prol..lr.ph100.prol_crit_edge, !llvm.loop !1

.lr.ph100.prol..lr.ph100.prol_crit_edge:          ; preds = %.lr.ph100.prol
  br label %.lr.ph100.prol

.lr.ph100.prol..lr.ph100.prol.loopexit_crit_edge: ; preds = %.lr.ph100.prol
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol.loopexit:                          ; preds = %.lr.ph100.prol..lr.ph100.prol.loopexit_crit_edge, %..lr.ph100_crit_edge..lr.ph100.prol.loopexit_crit_edge
  %indvars.iv134.unr = phi i64 [ 0, %..lr.ph100_crit_edge..lr.ph100.prol.loopexit_crit_edge ], [ %indvars.iv.next135.prol, %.lr.ph100.prol..lr.ph100.prol.loopexit_crit_edge ]
  %.298.unr = phi double [ %67, %..lr.ph100_crit_edge..lr.ph100.prol.loopexit_crit_edge ], [ %75, %.lr.ph100.prol..lr.ph100.prol.loopexit_crit_edge ]
  %.lcssa130.unr = phi double [ undef, %..lr.ph100_crit_edge..lr.ph100.prol.loopexit_crit_edge ], [ %75, %.lr.ph100.prol..lr.ph100.prol.loopexit_crit_edge ]
  %76 = trunc i64 %65 to i32
  %77 = icmp ult i32 %76, 3
  br i1 %77, label %.lr.ph100.prol.loopexit.._crit_edge101_crit_edge, label %.lr.ph100.prol.loopexit..lr.ph100_crit_edge

.lr.ph100.prol.loopexit..lr.ph100_crit_edge:      ; preds = %.lr.ph100.prol.loopexit
  br label %.lr.ph100

.lr.ph100.prol.loopexit.._crit_edge101_crit_edge: ; preds = %.lr.ph100.prol.loopexit
  br label %._crit_edge101

.lr.ph100:                                        ; preds = %.lr.ph100..lr.ph100_crit_edge, %.lr.ph100.prol.loopexit..lr.ph100_crit_edge
  %indvars.iv134 = phi i64 [ %indvars.iv.next135.3, %.lr.ph100..lr.ph100_crit_edge ], [ %indvars.iv134.unr, %.lr.ph100.prol.loopexit..lr.ph100_crit_edge ]
  %.298 = phi double [ %99, %.lr.ph100..lr.ph100_crit_edge ], [ %.298.unr, %.lr.ph100.prol.loopexit..lr.ph100_crit_edge ]
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv143, i64 %indvars.iv134
  %79 = bitcast double* %78 to <2 x double>*
  %80 = getelementptr inbounds double, double* %3, i64 %indvars.iv134
  %81 = bitcast double* %80 to <2 x double>*
  %82 = load <2 x double>, <2 x double>* %79, align 8
  %83 = load <2 x double>, <2 x double>* %81, align 8
  %84 = fmul <2 x double> %82, %83
  %85 = extractelement <2 x double> %84, i32 0
  %86 = extractelement <2 x double> %84, i32 1
  %87 = fsub double %.298, %85
  %88 = fsub double %87, %86
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv143, i64 %indvars.iv.next135.1
  %90 = bitcast double* %89 to <2 x double>*
  %91 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next135.1
  %92 = bitcast double* %91 to <2 x double>*
  %93 = load <2 x double>, <2 x double>* %90, align 8
  %94 = load <2 x double>, <2 x double>* %92, align 8
  %95 = fmul <2 x double> %93, %94
  %96 = extractelement <2 x double> %95, i32 0
  %97 = extractelement <2 x double> %95, i32 1
  %98 = fsub double %88, %96
  %99 = fsub double %98, %97
  %indvars.iv.next135.3 = add nsw i64 %indvars.iv134, 4
  %exitcond.3142 = icmp eq i64 %indvars.iv.next135.3, %indvars.iv143
  br i1 %exitcond.3142, label %.lr.ph100.._crit_edge101_crit_edge, label %.lr.ph100..lr.ph100_crit_edge

.lr.ph100..lr.ph100_crit_edge:                    ; preds = %.lr.ph100
  br label %.lr.ph100

.lr.ph100.._crit_edge101_crit_edge:               ; preds = %.lr.ph100
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %.lr.ph100.._crit_edge101_crit_edge, %.lr.ph100.prol.loopexit.._crit_edge101_crit_edge, %._crit_edge123._crit_edge126.._crit_edge101_crit_edge
  %.2.lcssa = phi double [ %67, %._crit_edge123._crit_edge126.._crit_edge101_crit_edge ], [ %.lcssa130.unr, %.lr.ph100.prol.loopexit.._crit_edge101_crit_edge ], [ %99, %.lr.ph100.._crit_edge101_crit_edge ]
  %100 = getelementptr inbounds double, double* %3, i64 %indvars.iv143
  store double %.2.lcssa, double* %100, align 8
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond = icmp eq i64 %indvars.iv.next144, 2000
  br i1 %exitcond, label %._crit_edge101.._crit_edge101._crit_edge127_crit_edge, label %._crit_edge101.._crit_edge123._crit_edge126_crit_edge

._crit_edge101.._crit_edge123._crit_edge126_crit_edge: ; preds = %._crit_edge101
  br label %._crit_edge123._crit_edge126

._crit_edge101.._crit_edge101._crit_edge127_crit_edge: ; preds = %._crit_edge101
  br label %._crit_edge101._crit_edge127

._crit_edge101._crit_edge127:                     ; preds = %._crit_edge101.._crit_edge101._crit_edge127_crit_edge, %._crit_edge._crit_edge
  %indvar = phi i32 [ %indvar.next, %._crit_edge._crit_edge ], [ 0, %._crit_edge101.._crit_edge101._crit_edge127_crit_edge ]
  %indvars.iv = phi i32 [ %indvars.iv.next, %._crit_edge._crit_edge ], [ 2000, %._crit_edge101.._crit_edge101._crit_edge127_crit_edge ]
  %.29296 = phi i64 [ %.292, %._crit_edge._crit_edge ], [ 1999, %._crit_edge101.._crit_edge101._crit_edge127_crit_edge ]
  %101 = add i32 %indvar, -1
  %102 = sext i32 %indvars.iv to i64
  %sext = shl i64 %.29296, 32
  %103 = ashr exact i64 %sext, 32
  %104 = getelementptr inbounds double, double* %3, i64 %103
  %105 = load double, double* %104, align 8
  %106 = icmp slt i32 %indvars.iv, 2000
  br i1 %106, label %..lr.ph_crit_edge, label %._crit_edge101._crit_edge127.._crit_edge_crit_edge

._crit_edge101._crit_edge127.._crit_edge_crit_edge: ; preds = %._crit_edge101._crit_edge127
  br label %._crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge101._crit_edge127
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge, label %..lr.ph_crit_edge..lr.ph.prol_crit_edge

..lr.ph_crit_edge..lr.ph.prol_crit_edge:          ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge: ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol.loopexit

.lr.ph.prol:                                      ; preds = %.lr.ph.prol..lr.ph.prol_crit_edge, %..lr.ph_crit_edge..lr.ph.prol_crit_edge
  %indvars.iv132.prol = phi i64 [ %indvars.iv.next133.prol, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %102, %..lr.ph_crit_edge..lr.ph.prol_crit_edge ]
  %.394.prol = phi double [ %112, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %105, %..lr.ph_crit_edge..lr.ph.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %xtraiter, %..lr.ph_crit_edge..lr.ph.prol_crit_edge ]
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv132.prol
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds double, double* %2, i64 %indvars.iv132.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = fsub double %.394.prol, %111
  %indvars.iv.next133.prol = add nsw i64 %indvars.iv132.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol..lr.ph.prol_crit_edge, !llvm.loop !3

.lr.ph.prol..lr.ph.prol_crit_edge:                ; preds = %.lr.ph.prol
  br label %.lr.ph.prol

.lr.ph.prol..lr.ph.prol.loopexit_crit_edge:       ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, %..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge
  %indvars.iv132.unr = phi i64 [ %102, %..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge ], [ %indvars.iv.next133.prol, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ]
  %.394.unr = phi double [ %105, %..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge ], [ %112, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ]
  %.lcssa129.unr = phi double [ undef, %..lr.ph_crit_edge..lr.ph.prol.loopexit_crit_edge ], [ %112, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ]
  %113 = icmp ult i32 %101, 3
  br i1 %113, label %.lr.ph.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.prol.loopexit..lr.ph_crit_edge

.lr.ph.prol.loopexit..lr.ph_crit_edge:            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph.prol.loopexit.._crit_edge_crit_edge:       ; preds = %.lr.ph.prol.loopexit
  br label %._crit_edge

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.prol.loopexit..lr.ph_crit_edge
  %indvars.iv132 = phi i64 [ %indvars.iv.next133.3, %.lr.ph..lr.ph_crit_edge ], [ %indvars.iv132.unr, %.lr.ph.prol.loopexit..lr.ph_crit_edge ]
  %.394 = phi double [ %135, %.lr.ph..lr.ph_crit_edge ], [ %.394.unr, %.lr.ph.prol.loopexit..lr.ph_crit_edge ]
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv132
  %115 = bitcast double* %114 to <2 x double>*
  %116 = getelementptr inbounds double, double* %2, i64 %indvars.iv132
  %117 = bitcast double* %116 to <2 x double>*
  %118 = load <2 x double>, <2 x double>* %115, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = fmul <2 x double> %118, %119
  %121 = extractelement <2 x double> %120, i32 0
  %122 = extractelement <2 x double> %120, i32 1
  %123 = fsub double %.394, %121
  %124 = fsub double %123, %122
  %indvars.iv.next133.1 = add nsw i64 %indvars.iv132, 2
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %indvars.iv.next133.1
  %126 = bitcast double* %125 to <2 x double>*
  %127 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next133.1
  %128 = bitcast double* %127 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %126, align 8
  %130 = load <2 x double>, <2 x double>* %128, align 8
  %131 = fmul <2 x double> %129, %130
  %132 = extractelement <2 x double> %131, i32 0
  %133 = extractelement <2 x double> %131, i32 1
  %134 = fsub double %124, %132
  %135 = fsub double %134, %133
  %indvars.iv.next133.3 = add nsw i64 %indvars.iv132, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next133.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %.lr.ph.._crit_edge_crit_edge, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.._crit_edge_crit_edge, %.lr.ph.prol.loopexit.._crit_edge_crit_edge, %._crit_edge101._crit_edge127.._crit_edge_crit_edge
  %.3.lcssa = phi double [ %105, %._crit_edge101._crit_edge127.._crit_edge_crit_edge ], [ %.lcssa129.unr, %.lr.ph.prol.loopexit.._crit_edge_crit_edge ], [ %135, %.lr.ph.._crit_edge_crit_edge ]
  %136 = trunc i64 %103 to i32
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %103, i64 %103
  %138 = load double, double* %137, align 8
  %139 = fdiv double %.3.lcssa, %138
  %140 = getelementptr inbounds double, double* %2, i64 %103
  store double %139, double* %140, align 8
  %141 = icmp sgt i32 %136, 0
  br i1 %141, label %._crit_edge._crit_edge, label %142

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %.292 = add nsw i64 %103, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge101._crit_edge127

; <label>:142:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %._crit_edge1, %1
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge1 ], [ 0, %1 ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %._crit_edge, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %._crit_edge1

._crit_edge1:                                     ; preds = %12
  br label %6

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
