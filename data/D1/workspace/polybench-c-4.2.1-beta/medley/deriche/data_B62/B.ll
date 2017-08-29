; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca float, align 4
  %4 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %8 = bitcast i8* %4 to [2160 x float]*
  %9 = bitcast i8* %5 to [2160 x float]*
  call void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge19

.._crit_edge_crit_edge19:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge19, %.._crit_edge_crit_edge, %17
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) #2 {
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.preheader.lr.ph, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %4
  br label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %4
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge14_crit_edge

.preheader.lr.ph.._crit_edge14_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv15.us = phi i64 [ %indvars.iv.next16.us, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv15.us, 313
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge.._crit_edge_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv.us, 991
  %7 = add nuw nsw i64 %5, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 65536
  %10 = sitofp i32 %9 to float
  %11 = fdiv float %10, 6.553500e+04
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv15.us, i64 %indvars.iv.us
  store float %11, float* %12, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond18.us = icmp eq i64 %indvars.iv.next16.us, 4096
  br i1 %exitcond18.us, label %._crit_edge14.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.preheader.lr.ph.._crit_edge14_crit_edge, %.._crit_edge14_crit_edge, %._crit_edge14.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) #0 {
  %8 = fsub float -0.000000e+00, %2
  %9 = tail call float @expf(float %8) #5
  %10 = fsub float 1.000000e+00, %9
  %11 = tail call float @expf(float %8) #5
  %12 = fsub float 1.000000e+00, %11
  %13 = fmul float %10, %12
  %14 = fmul float %2, 2.000000e+00
  %15 = tail call float @expf(float %8) #5
  %16 = fmul float %14, %15
  %17 = fadd float %16, 1.000000e+00
  %18 = tail call float @expf(float %14) #5
  %19 = fsub float %17, %18
  %20 = fdiv float %13, %19
  %21 = tail call float @expf(float %8) #5
  %22 = fmul float %20, %21
  %23 = tail call float @expf(float %8) #5
  %24 = fmul float %20, %23
  %25 = insertelement <2 x float> undef, float %2, i32 0
  %26 = shufflevector <2 x float> %25, <2 x float> undef, <2 x i32> zeroinitializer
  %27 = fadd <2 x float> %26, <float -1.000000e+00, float 1.000000e+00>
  %28 = insertelement <2 x float> undef, float %22, i32 0
  %29 = insertelement <2 x float> %28, float %24, i32 1
  %30 = fmul <2 x float> %29, %27
  %31 = extractelement <2 x float> %30, i32 0
  %32 = extractelement <2 x float> %30, i32 1
  %33 = fmul float %2, -2.000000e+00
  %34 = tail call float @expf(float %33) #5
  %35 = fmul float %20, %34
  %36 = fsub float -0.000000e+00, %35
  %exp2 = call float @llvm.exp2.f32(float %8)
  %37 = tail call float @expf(float %33) #5
  %38 = fsub float -0.000000e+00, %37
  br i1 true, label %.preheader176.lr.ph, label %..preheader172_crit_edge

..preheader172_crit_edge:                         ; preds = %7
  br label %.preheader172

.preheader176.lr.ph:                              ; preds = %7
  br i1 true, label %.preheader176.us.preheader, label %.preheader176.lr.ph.._crit_edge179_crit_edge

.preheader176.lr.ph.._crit_edge179_crit_edge:     ; preds = %.preheader176.lr.ph
  br label %._crit_edge179

.preheader176.us.preheader:                       ; preds = %.preheader176.lr.ph
  %39 = insertelement <2 x float> undef, float %31, i32 0
  %40 = insertelement <2 x float> %39, float %20, i32 1
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %._crit_edge216.us..preheader176.us_crit_edge, %.preheader176.us.preheader
  %indvars.iv254.us = phi i64 [ 0, %.preheader176.us.preheader ], [ %indvars.iv.next255.us, %._crit_edge216.us..preheader176.us_crit_edge ]
  br i1 true, label %.preheader176.us..prol.loopexit280_crit_edge, label %.prol.preheader279

.preheader176.us..prol.loopexit280_crit_edge:     ; preds = %.preheader176.us
  br label %.prol.loopexit280

.prol.preheader279:                               ; preds = %.preheader176.us
  br label %.prol.loopexit280

.prol.loopexit280:                                ; preds = %.preheader176.us..prol.loopexit280_crit_edge, %.prol.preheader279
  %indvars.iv250.us.unr.ph = phi i64 [ 1, %.prol.preheader279 ], [ 0, %.preheader176.us..prol.loopexit280_crit_edge ]
  br i1 false, label %.prol.loopexit280.._crit_edge216.us_crit_edge, label %.preheader176.us.new.preheader

.prol.loopexit280.._crit_edge216.us_crit_edge:    ; preds = %.prol.loopexit280
  br label %._crit_edge216.us

.preheader176.us.new.preheader:                   ; preds = %.prol.loopexit280
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us.new.preheader, %.preheader176.us.new..preheader176.us.new_crit_edge
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us.1, %.preheader176.us.new..preheader176.us.new_crit_edge ], [ %indvars.iv250.us.unr.ph, %.preheader176.us.new.preheader ]
  %.0155213.us = phi float [ %63, %.preheader176.us.new..preheader176.us.new_crit_edge ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0157212.us = phi float [ %60, %.preheader176.us.new..preheader176.us.new_crit_edge ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0159211.us = phi float [ %49, %.preheader176.us.new..preheader176.us.new_crit_edge ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  %42 = load float, float* %41, align 4
  %43 = fmul float %20, %42
  %44 = fmul float %31, %.0155213.us
  %45 = fadd float %43, %44
  %46 = fmul float %exp2, %.0157212.us
  %47 = fadd float %45, %46
  %48 = fmul float %.0159211.us, %38
  %49 = fadd float %47, %48
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  store float %49, float* %50, align 4
  %51 = bitcast float* %41 to <2 x float>*
  %indvars.iv.next251.us = add nuw nsw i64 %indvars.iv250.us, 1
  %52 = load <2 x float>, <2 x float>* %51, align 4
  %53 = fmul <2 x float> %40, %52
  %54 = extractelement <2 x float> %53, i32 0
  %55 = extractelement <2 x float> %53, i32 1
  %56 = fadd float %55, %54
  %57 = fmul float %exp2, %49
  %58 = fadd float %56, %57
  %59 = fmul float %.0157212.us, %38
  %60 = fadd float %58, %59
  %61 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  store float %60, float* %61, align 4
  %indvars.iv.next251.us.1 = add nsw i64 %indvars.iv250.us, 2
  %exitcond253.us.1 = icmp eq i64 %indvars.iv.next251.us.1, 2160
  br i1 %exitcond253.us.1, label %._crit_edge216.us.loopexit, label %.preheader176.us.new..preheader176.us.new_crit_edge

.preheader176.us.new..preheader176.us.new_crit_edge: ; preds = %.preheader176.us.new
  %62 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  %63 = load float, float* %62, align 4
  br label %.preheader176.us.new

._crit_edge216.us.loopexit:                       ; preds = %.preheader176.us.new
  br label %._crit_edge216.us

._crit_edge216.us:                                ; preds = %.prol.loopexit280.._crit_edge216.us_crit_edge, %._crit_edge216.us.loopexit
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.preheader175, label %._crit_edge216.us..preheader176.us_crit_edge

._crit_edge216.us..preheader176.us_crit_edge:     ; preds = %._crit_edge216.us
  br label %.preheader176.us

.preheader175:                                    ; preds = %._crit_edge216.us
  br i1 true, label %.lr.ph210, label %.preheader175..preheader172_crit_edge

.preheader175..preheader172_crit_edge:            ; preds = %.preheader175
  br label %.preheader172

.lr.ph210:                                        ; preds = %.preheader175
  br i1 true, label %.lr.ph210.split.us.preheader, label %.lr.ph210.._crit_edge179_crit_edge

.lr.ph210.._crit_edge179_crit_edge:               ; preds = %.lr.ph210
  br label %._crit_edge179

.lr.ph210.split.us.preheader:                     ; preds = %.lr.ph210
  br label %.lr.ph210.split.us

.lr.ph210.split.us:                               ; preds = %._crit_edge208.us..lr.ph210.split.us_crit_edge, %.lr.ph210.split.us.preheader
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge208.us..lr.ph210.split.us_crit_edge ], [ 0, %.lr.ph210.split.us.preheader ]
  br label %64

; <label>:64:                                     ; preds = %._crit_edge, %.lr.ph210.split.us
  %indvars.iv244.us = phi i64 [ 2159, %.lr.ph210.split.us ], [ %indvars.iv.next245.us, %._crit_edge ]
  %.0161204.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %75, %._crit_edge ]
  %.0162203.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %.0161204.us, %._crit_edge ]
  %.0165202.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %71, %._crit_edge ]
  %.0167201.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %.0165202.us, %._crit_edge ]
  %65 = fmul float %32, %.0161204.us
  %66 = fmul float %.0162203.us, %36
  %67 = fadd float %65, %66
  %68 = fmul float %exp2, %.0165202.us
  %69 = fadd float %67, %68
  %70 = fmul float %.0167201.us, %38
  %71 = fadd float %69, %70
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %71, float* %72, align 4
  %73 = icmp sgt i64 %indvars.iv244.us, 0
  br i1 %73, label %._crit_edge, label %._crit_edge208.us

._crit_edge:                                      ; preds = %64
  %indvars.iv.next245.us = add nsw i64 %indvars.iv244.us, -1
  %74 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %75 = load float, float* %74, align 4
  br label %64

._crit_edge208.us:                                ; preds = %64
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader174, label %._crit_edge208.us..lr.ph210.split.us_crit_edge

._crit_edge208.us..lr.ph210.split.us_crit_edge:   ; preds = %._crit_edge208.us
  br label %.lr.ph210.split.us

.preheader174:                                    ; preds = %._crit_edge208.us
  br i1 true, label %.preheader173.lr.ph, label %.preheader174..preheader172_crit_edge

.preheader174..preheader172_crit_edge:            ; preds = %.preheader174
  br label %.preheader172

.preheader173.lr.ph:                              ; preds = %.preheader174
  br i1 true, label %.preheader173.us.preheader, label %.preheader173.lr.ph.._crit_edge179_crit_edge

.preheader173.lr.ph.._crit_edge179_crit_edge:     ; preds = %.preheader173.lr.ph
  br label %._crit_edge179

.preheader173.us.preheader:                       ; preds = %.preheader173.lr.ph
  br label %.preheader173.us

.preheader173.us:                                 ; preds = %._crit_edge199.us..preheader173.us_crit_edge, %.preheader173.us.preheader
  %indvars.iv240.us = phi i64 [ 0, %.preheader173.us.preheader ], [ %indvars.iv.next241.us, %._crit_edge199.us..preheader173.us_crit_edge ]
  br i1 true, label %.preheader173.us..prol.loopexit276_crit_edge, label %.prol.preheader275

.preheader173.us..prol.loopexit276_crit_edge:     ; preds = %.preheader173.us
  br label %.prol.loopexit276

.prol.preheader275:                               ; preds = %.preheader173.us
  br label %.prol.loopexit276

.prol.loopexit276:                                ; preds = %.preheader173.us..prol.loopexit276_crit_edge, %.prol.preheader275
  %indvars.iv236.us.unr.ph = phi i64 [ 1, %.prol.preheader275 ], [ 0, %.preheader173.us..prol.loopexit276_crit_edge ]
  br i1 false, label %.prol.loopexit276.._crit_edge199.us_crit_edge, label %.preheader173.us.new.preheader

.prol.loopexit276.._crit_edge199.us_crit_edge:    ; preds = %.prol.loopexit276
  br label %._crit_edge199.us

.preheader173.us.new.preheader:                   ; preds = %.prol.loopexit276
  br label %.preheader173.us.new

.preheader173.us.new:                             ; preds = %.preheader173.us.new..preheader173.us.new_crit_edge, %.preheader173.us.new.preheader
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %.preheader173.us.new..preheader173.us.new_crit_edge ], [ %indvars.iv236.us.unr.ph, %.preheader173.us.new.preheader ]
  %76 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %77 = load float, float* %76, align 4
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %79 = load float, float* %78, align 4
  %80 = fadd float %77, %79
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %80, float* %81, align 4
  %indvars.iv.next237.us = add nuw nsw i64 %indvars.iv236.us, 1
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %83 = load float, float* %82, align 4
  %84 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %85 = load float, float* %84, align 4
  %86 = fadd float %83, %85
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %86, float* %87, align 4
  %indvars.iv.next237.us.1 = add nuw nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge199.us.loopexit, label %.preheader173.us.new..preheader173.us.new_crit_edge

.preheader173.us.new..preheader173.us.new_crit_edge: ; preds = %.preheader173.us.new
  br label %.preheader173.us.new

._crit_edge199.us.loopexit:                       ; preds = %.preheader173.us.new
  br label %._crit_edge199.us

._crit_edge199.us:                                ; preds = %.prol.loopexit276.._crit_edge199.us_crit_edge, %._crit_edge199.us.loopexit
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader172.loopexit, label %._crit_edge199.us..preheader173.us_crit_edge

._crit_edge199.us..preheader173.us_crit_edge:     ; preds = %._crit_edge199.us
  br label %.preheader173.us

.preheader172.loopexit:                           ; preds = %._crit_edge199.us
  br label %.preheader172

.preheader172:                                    ; preds = %.preheader174..preheader172_crit_edge, %.preheader175..preheader172_crit_edge, %..preheader172_crit_edge, %.preheader172.loopexit
  br i1 true, label %.preheader171.lr.ph, label %.preheader172..preheader169_crit_edge

.preheader172..preheader169_crit_edge:            ; preds = %.preheader172
  br label %.preheader169

.preheader171.lr.ph:                              ; preds = %.preheader172
  br i1 true, label %.preheader171.us.preheader, label %.preheader171.lr.ph.._crit_edge179_crit_edge

.preheader171.lr.ph.._crit_edge179_crit_edge:     ; preds = %.preheader171.lr.ph
  br label %._crit_edge179

.preheader171.us.preheader:                       ; preds = %.preheader171.lr.ph
  br label %.preheader171.us

.preheader171.us:                                 ; preds = %._crit_edge195.us..preheader171.us_crit_edge, %.preheader171.us.preheader
  %indvars.iv232.us = phi i64 [ 0, %.preheader171.us.preheader ], [ %indvars.iv.next233.us, %._crit_edge195.us..preheader171.us_crit_edge ]
  br i1 true, label %.preheader171.us..prol.loopexit272_crit_edge, label %.prol.preheader271

.preheader171.us..prol.loopexit272_crit_edge:     ; preds = %.preheader171.us
  br label %.prol.loopexit272

.prol.preheader271:                               ; preds = %.preheader171.us
  br label %.prol.loopexit272

.prol.loopexit272:                                ; preds = %.preheader171.us..prol.loopexit272_crit_edge, %.prol.preheader271
  %indvars.iv228.us.unr.ph = phi i64 [ 1, %.prol.preheader271 ], [ 0, %.preheader171.us..prol.loopexit272_crit_edge ]
  br i1 false, label %.prol.loopexit272.._crit_edge195.us_crit_edge, label %.preheader171.us.new.preheader

.prol.loopexit272.._crit_edge195.us_crit_edge:    ; preds = %.prol.loopexit272
  br label %._crit_edge195.us

.preheader171.us.new.preheader:                   ; preds = %.prol.loopexit272
  br label %.preheader171.us.new

.preheader171.us.new:                             ; preds = %.preheader171.us.new.preheader, %.preheader171.us.new..preheader171.us.new_crit_edge
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us.1, %.preheader171.us.new..preheader171.us.new_crit_edge ], [ %indvars.iv228.us.unr.ph, %.preheader171.us.new.preheader ]
  %.0156192.us = phi float [ %109, %.preheader171.us.new..preheader171.us.new_crit_edge ], [ 0.000000e+00, %.preheader171.us.new.preheader ]
  %.1158191.us = phi float [ %107, %.preheader171.us.new..preheader171.us.new_crit_edge ], [ 0.000000e+00, %.preheader171.us.new.preheader ]
  %.1160190.us = phi float [ %96, %.preheader171.us.new..preheader171.us.new_crit_edge ], [ 0.000000e+00, %.preheader171.us.new.preheader ]
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %89 = load float, float* %88, align 4
  %90 = fmul float %20, %89
  %91 = fmul float %31, %.0156192.us
  %92 = fadd float %90, %91
  %93 = fmul float %exp2, %.1158191.us
  %94 = fadd float %92, %93
  %95 = fmul float %.1160190.us, %38
  %96 = fadd float %94, %95
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %96, float* %97, align 4
  %98 = load float, float* %88, align 4
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv228.us, 1
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %100 = load float, float* %99, align 4
  %101 = fmul float %20, %100
  %102 = fmul float %31, %98
  %103 = fadd float %101, %102
  %104 = fmul float %exp2, %96
  %105 = fadd float %103, %104
  %106 = fmul float %.1158191.us, %38
  %107 = fadd float %105, %106
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %107, float* %108, align 4
  %indvars.iv.next229.us.1 = add nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge195.us.loopexit, label %.preheader171.us.new..preheader171.us.new_crit_edge

.preheader171.us.new..preheader171.us.new_crit_edge: ; preds = %.preheader171.us.new
  %109 = load float, float* %99, align 4
  br label %.preheader171.us.new

._crit_edge195.us.loopexit:                       ; preds = %.preheader171.us.new
  br label %._crit_edge195.us

._crit_edge195.us:                                ; preds = %.prol.loopexit272.._crit_edge195.us_crit_edge, %._crit_edge195.us.loopexit
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.preheader170, label %._crit_edge195.us..preheader171.us_crit_edge

._crit_edge195.us..preheader171.us_crit_edge:     ; preds = %._crit_edge195.us
  br label %.preheader171.us

.preheader170:                                    ; preds = %._crit_edge195.us
  br i1 true, label %.lr.ph189, label %.preheader170..preheader169_crit_edge

.preheader170..preheader169_crit_edge:            ; preds = %.preheader170
  br label %.preheader169

.lr.ph189:                                        ; preds = %.preheader170
  br i1 true, label %.lr.ph189.split.us.preheader, label %.lr.ph189.._crit_edge179_crit_edge

.lr.ph189.._crit_edge179_crit_edge:               ; preds = %.lr.ph189
  br label %._crit_edge179

.lr.ph189.split.us.preheader:                     ; preds = %.lr.ph189
  br label %.lr.ph189.split.us

.lr.ph189.split.us:                               ; preds = %._crit_edge187.us..lr.ph189.split.us_crit_edge, %.lr.ph189.split.us.preheader
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge187.us..lr.ph189.split.us_crit_edge ], [ 0, %.lr.ph189.split.us.preheader ]
  br label %110

; <label>:110:                                    ; preds = %._crit_edge290, %.lr.ph189.split.us
  %indvars.iv222.us = phi i64 [ 4095, %.lr.ph189.split.us ], [ %indvars.iv.next223.us, %._crit_edge290 ]
  %.0163183.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %121, %._crit_edge290 ]
  %.0164182.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %.0163183.us, %._crit_edge290 ]
  %.1166181.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %117, %._crit_edge290 ]
  %.1168180.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %.1166181.us, %._crit_edge290 ]
  %111 = fmul float %32, %.0163183.us
  %112 = fmul float %.0164182.us, %36
  %113 = fadd float %111, %112
  %114 = fmul float %exp2, %.1166181.us
  %115 = fadd float %113, %114
  %116 = fmul float %.1168180.us, %38
  %117 = fadd float %115, %116
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %117, float* %118, align 4
  %119 = icmp sgt i64 %indvars.iv222.us, 0
  br i1 %119, label %._crit_edge290, label %._crit_edge187.us

._crit_edge290:                                   ; preds = %110
  %indvars.iv.next223.us = add nsw i64 %indvars.iv222.us, -1
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %121 = load float, float* %120, align 4
  br label %110

._crit_edge187.us:                                ; preds = %110
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader169.loopexit, label %._crit_edge187.us..lr.ph189.split.us_crit_edge

._crit_edge187.us..lr.ph189.split.us_crit_edge:   ; preds = %._crit_edge187.us
  br label %.lr.ph189.split.us

.preheader169.loopexit:                           ; preds = %._crit_edge187.us
  br label %.preheader169

.preheader169:                                    ; preds = %.preheader170..preheader169_crit_edge, %.preheader172..preheader169_crit_edge, %.preheader169.loopexit
  br i1 true, label %.preheader.lr.ph, label %.preheader169.._crit_edge179_crit_edge

.preheader169.._crit_edge179_crit_edge:           ; preds = %.preheader169
  br label %._crit_edge179

.preheader.lr.ph:                                 ; preds = %.preheader169
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge179_crit_edge

.preheader.lr.ph.._crit_edge179_crit_edge:        ; preds = %.preheader.lr.ph
  br label %._crit_edge179

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv218.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next219.us, %._crit_edge.us..preheader.us_crit_edge ]
  br i1 true, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us..prol.loopexit_crit_edge ]
  br i1 false, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.us.unr.ph, %.preheader.us.new.preheader ]
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %123 = load float, float* %122, align 4
  %124 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %125 = load float, float* %124, align 4
  %126 = fadd float %123, %125
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %126, float* %127, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %129 = load float, float* %128, align 4
  %130 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %131 = load float, float* %130, align 4
  %132 = fadd float %129, %131
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %132, float* %133, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next219.us = add nuw nsw i64 %indvars.iv218.us, 1
  %exitcond221.us = icmp eq i64 %indvars.iv.next219.us, 4096
  br i1 %exitcond221.us, label %._crit_edge179.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge179.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge179

._crit_edge179:                                   ; preds = %.preheader.lr.ph.._crit_edge179_crit_edge, %.preheader169.._crit_edge179_crit_edge, %.lr.ph189.._crit_edge179_crit_edge, %.preheader171.lr.ph.._crit_edge179_crit_edge, %.preheader173.lr.ph.._crit_edge179_crit_edge, %.lr.ph210.._crit_edge179_crit_edge, %.preheader176.lr.ph.._crit_edge179_crit_edge, %._crit_edge179.loopexit
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader.lr.ph, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %3
  br label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge14_crit_edge

.preheader.lr.ph.._crit_edge14_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv15.us = phi i64 [ %indvars.iv.next16.us, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %8 = mul nsw i64 %indvars.iv15.us, 2160
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge.._crit_edge21_crit_edge, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge.._crit_edge21_crit_edge ]
  %9 = add nsw i64 %8, %indvars.iv.us
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge21.._crit_edge_crit_edge

._crit_edge21.._crit_edge_crit_edge:              ; preds = %._crit_edge21
  br label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge21
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21.._crit_edge_crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv15.us, i64 %indvars.iv.us
  %17 = load float, float* %16, align 4
  %18 = fpext float %17 to double
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge.._crit_edge21_crit_edge

._crit_edge.._crit_edge21_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond18.us = icmp eq i64 %indvars.iv.next16.us, 4096
  br i1 %exitcond18.us, label %._crit_edge14.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.preheader.lr.ph.._crit_edge14_crit_edge, %.._crit_edge14_crit_edge, %._crit_edge14.loopexit
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare float @expf(float) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
