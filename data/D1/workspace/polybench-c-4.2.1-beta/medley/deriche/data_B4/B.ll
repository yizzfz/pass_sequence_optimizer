; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca float, align 4
  %4 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %8 = bitcast i8* %4 to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8)
  tail call void (...) @polybench_timer_start() #5
  %9 = load float, float* %3, align 4
  %10 = bitcast i8* %5 to [2160 x float]*
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %9, [2160 x float]* %8, [2160 x float]* %10, [2160 x float]* %11, [2160 x float]* %12)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %10)
  br label %18

; <label>:18:                                     ; preds = %14, %2, %17
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
.preheader.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %4 = mul nuw nsw i64 %indvars.iv6, 313
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, 991
  %7 = add nuw nsw i64 %6, %4
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 65536
  %10 = sitofp i32 %9 to float
  %11 = fdiv float %10, 6.553500e+04
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv6, i64 %indvars.iv
  store float %11, float* %12, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %5

._crit_edge.us:                                   ; preds = %5
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 4096
  br i1 %exitcond9, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.preheader30.lr.ph:
  %7 = fsub float -0.000000e+00, %2
  %8 = tail call float @expf(float %7) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = tail call float @expf(float %7) #5
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %9, %11
  %13 = fmul float %2, 2.000000e+00
  %14 = tail call float @expf(float %7) #5
  %15 = fmul float %13, %14
  %16 = fadd float %15, 1.000000e+00
  %17 = tail call float @expf(float %13) #5
  %18 = fsub float %16, %17
  %19 = fdiv float %12, %18
  %20 = tail call float @expf(float %7) #5
  %21 = fmul float %20, %19
  %22 = fadd float %2, -1.000000e+00
  %23 = fmul float %22, %21
  %24 = tail call float @expf(float %7) #5
  %25 = fmul float %24, %19
  %26 = fadd float %2, 1.000000e+00
  %27 = fmul float %26, %25
  %28 = fmul float %2, -2.000000e+00
  %29 = tail call float @expf(float %28) #5
  %30 = fmul float %19, %29
  %31 = fsub float -0.000000e+00, %30
  %exp2 = tail call float @llvm.exp2.f32(float %7)
  %32 = tail call float @expf(float %28) #5
  %33 = fsub float -0.000000e+00, %32
  br label %.preheader30.us

.preheader30.us:                                  ; preds = %._crit_edge68.us, %.preheader30.lr.ph
  %indvars.iv128 = phi i64 [ 0, %.preheader30.lr.ph ], [ %indvars.iv.next129, %._crit_edge68.us ]
  br label %.preheader30.us.new

.preheader30.us.new:                              ; preds = %.preheader30.us.new, %.preheader30.us
  %indvars.iv120 = phi i64 [ 0, %.preheader30.us ], [ %indvars.iv.next121.1, %.preheader30.us.new ]
  %.0766.us = phi float [ 0.000000e+00, %.preheader30.us ], [ %42, %.preheader30.us.new ]
  %.01764.us = phi float [ 0.000000e+00, %.preheader30.us ], [ %55, %.preheader30.us.new ]
  %.01963.us = phi float [ 0.000000e+00, %.preheader30.us ], [ %53, %.preheader30.us.new ]
  %34 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv128, i64 %indvars.iv120
  %35 = load float, float* %34, align 4
  %36 = fmul float %19, %35
  %37 = fmul float %23, %.01764.us
  %38 = fadd float %37, %36
  %39 = fmul float %exp2, %.01963.us
  %40 = fadd float %39, %38
  %41 = fmul float %.0766.us, %33
  %42 = fadd float %41, %40
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv128, i64 %indvars.iv120
  store float %42, float* %43, align 4
  %44 = load float, float* %34, align 4
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %45 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv128, i64 %indvars.iv.next121
  %46 = load float, float* %45, align 4
  %47 = fmul float %19, %46
  %48 = fmul float %23, %44
  %49 = fadd float %48, %47
  %50 = fmul float %exp2, %42
  %51 = fadd float %50, %49
  %52 = fmul float %.01963.us, %33
  %53 = fadd float %52, %51
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv128, i64 %indvars.iv.next121
  store float %53, float* %54, align 4
  %55 = load float, float* %45, align 4
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %exitcond123.1 = icmp eq i64 %indvars.iv.next121.1, 2160
  br i1 %exitcond123.1, label %._crit_edge68.us, label %.preheader30.us.new

._crit_edge68.us:                                 ; preds = %.preheader30.us.new
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next129, 4096
  br i1 %exitcond131, label %.preheader28.us.preheader, label %.preheader30.us

.preheader28.us.preheader:                        ; preds = %._crit_edge68.us
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %.preheader28.us.preheader, %._crit_edge61.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge61.us ], [ 0, %.preheader28.us.preheader ]
  br label %56

; <label>:56:                                     ; preds = %56, %.preheader28.us
  %indvars.iv113 = phi i64 [ 2160, %.preheader28.us ], [ %indvars.iv.next114.1, %56 ]
  %.058.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %63, %56 ]
  %.0157.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %73, %56 ]
  %.0556.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %66, %56 ]
  %.0655.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %76, %56 ]
  %indvars.iv.next114 = add nsw i64 %indvars.iv113, -1
  %57 = fmul float %27, %.0655.us
  %58 = fmul float %.0556.us, %31
  %59 = fadd float %57, %58
  %60 = fmul float %exp2, %.0157.us
  %61 = fadd float %59, %60
  %62 = fmul float %.058.us, %33
  %63 = fadd float %61, %62
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv115, i64 %indvars.iv.next114
  store float %63, float* %64, align 4
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv115, i64 %indvars.iv.next114
  %66 = load float, float* %65, align 4
  %indvars.iv.next114.1 = add nsw i64 %indvars.iv113, -2
  %67 = fmul float %27, %66
  %68 = fmul float %.0655.us, %31
  %69 = fadd float %67, %68
  %70 = fmul float %exp2, %63
  %71 = fadd float %69, %70
  %72 = fmul float %.0157.us, %33
  %73 = fadd float %71, %72
  %74 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv115, i64 %indvars.iv.next114.1
  store float %73, float* %74, align 4
  %75 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv115, i64 %indvars.iv.next114.1
  %76 = load float, float* %75, align 4
  %77 = icmp sgt i64 %indvars.iv.next114, 1
  br i1 %77, label %56, label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %56
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next116, 4096
  br i1 %exitcond118, label %.preheader26.us.preheader, label %.preheader28.us

.preheader26.us.preheader:                        ; preds = %._crit_edge61.us
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %.preheader26.us.preheader, %._crit_edge52.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge52.us ], [ 0, %.preheader26.us.preheader ]
  br label %.preheader26.us.new

.preheader26.us.new:                              ; preds = %.preheader26.us.new, %.preheader26.us
  %indvars.iv100 = phi i64 [ 0, %.preheader26.us ], [ %indvars.iv.next101.1, %.preheader26.us.new ]
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv100
  %79 = load float, float* %78, align 4
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv100
  %81 = load float, float* %80, align 4
  %82 = fadd float %79, %81
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv100
  store float %82, float* %83, align 4
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %84 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv.next101
  %85 = load float, float* %84, align 4
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv.next101
  %87 = load float, float* %86, align 4
  %88 = fadd float %85, %87
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv.next101
  store float %88, float* %89, align 4
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, 2160
  br i1 %exitcond103.1, label %._crit_edge52.us, label %.preheader26.us.new

._crit_edge52.us:                                 ; preds = %.preheader26.us.new
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 4096
  br i1 %exitcond111, label %.preheader24.us.preheader, label %.preheader26.us

.preheader24.us.preheader:                        ; preds = %._crit_edge52.us
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %.preheader24.us.preheader, %._crit_edge48.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge48.us ], [ 0, %.preheader24.us.preheader ]
  br label %.preheader24.us.new

.preheader24.us.new:                              ; preds = %.preheader24.us.new, %.preheader24.us
  %indvars.iv87 = phi i64 [ 0, %.preheader24.us ], [ %indvars.iv.next88.1, %.preheader24.us.new ]
  %.1846.us = phi float [ 0.000000e+00, %.preheader24.us ], [ %98, %.preheader24.us.new ]
  %.01844.us = phi float [ 0.000000e+00, %.preheader24.us ], [ %111, %.preheader24.us.new ]
  %.12043.us = phi float [ 0.000000e+00, %.preheader24.us ], [ %109, %.preheader24.us.new ]
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv87, i64 %indvars.iv95
  %91 = load float, float* %90, align 4
  %92 = fmul float %19, %91
  %93 = fmul float %23, %.01844.us
  %94 = fadd float %93, %92
  %95 = fmul float %exp2, %.12043.us
  %96 = fadd float %95, %94
  %97 = fmul float %.1846.us, %33
  %98 = fadd float %97, %96
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv87, i64 %indvars.iv95
  store float %98, float* %99, align 4
  %100 = load float, float* %90, align 4
  %indvars.iv.next88 = or i64 %indvars.iv87, 1
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next88, i64 %indvars.iv95
  %102 = load float, float* %101, align 4
  %103 = fmul float %19, %102
  %104 = fmul float %23, %100
  %105 = fadd float %104, %103
  %106 = fmul float %exp2, %98
  %107 = fadd float %106, %105
  %108 = fmul float %.12043.us, %33
  %109 = fadd float %108, %107
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next88, i64 %indvars.iv95
  store float %109, float* %110, align 4
  %111 = load float, float* %101, align 4
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next88.1, 4096
  br i1 %exitcond90.1, label %._crit_edge48.us, label %.preheader24.us.new

._crit_edge48.us:                                 ; preds = %.preheader24.us.new
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, 2160
  br i1 %exitcond98, label %.preheader22.us.preheader, label %.preheader24.us

.preheader22.us.preheader:                        ; preds = %._crit_edge48.us
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %.preheader22.us.preheader, %._crit_edge41.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge41.us ], [ 0, %.preheader22.us.preheader ]
  br label %112

; <label>:112:                                    ; preds = %112, %.preheader22.us
  %indvars.iv80 = phi i64 [ 4096, %.preheader22.us ], [ %indvars.iv.next81.1, %112 ]
  %.138.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %119, %112 ]
  %.1237.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %129, %112 ]
  %.0336.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %122, %112 ]
  %.0435.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %132, %112 ]
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, -1
  %113 = fmul float %27, %.0435.us
  %114 = fmul float %.0336.us, %31
  %115 = fadd float %113, %114
  %116 = fmul float %exp2, %.1237.us
  %117 = fadd float %115, %116
  %118 = fmul float %.138.us, %33
  %119 = fadd float %117, %118
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next81, i64 %indvars.iv82
  store float %119, float* %120, align 4
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next81, i64 %indvars.iv82
  %122 = load float, float* %121, align 4
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, -2
  %123 = fmul float %27, %122
  %124 = fmul float %.0435.us, %31
  %125 = fadd float %123, %124
  %126 = fmul float %exp2, %119
  %127 = fadd float %125, %126
  %128 = fmul float %.1237.us, %33
  %129 = fadd float %127, %128
  %130 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next81.1, i64 %indvars.iv82
  store float %129, float* %130, align 4
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next81.1, i64 %indvars.iv82
  %132 = load float, float* %131, align 4
  %133 = icmp sgt i64 %indvars.iv.next81, 1
  br i1 %133, label %112, label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %112
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, 2160
  br i1 %exitcond85, label %.preheader.us.preheader, label %.preheader22.us

.preheader.us.preheader:                          ; preds = %._crit_edge41.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %.preheader.us.new ]
  %134 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv
  %135 = load float, float* %134, align 4
  %136 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv
  %137 = load float, float* %136, align 4
  %138 = fadd float %135, %137
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv
  store float %138, float* %139, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %140 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv.next
  %141 = load float, float* %140, align 4
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv.next
  %143 = load float, float* %142, align 4
  %144 = fadd float %141, %143
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv.next
  store float %144, float* %145, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond = icmp eq i64 %indvars.iv.next77, 4096
  br i1 %exitcond, label %._crit_edge33, label %.preheader.us

._crit_edge33:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv6, 2160
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 4096
  br i1 %exitcond9, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

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
