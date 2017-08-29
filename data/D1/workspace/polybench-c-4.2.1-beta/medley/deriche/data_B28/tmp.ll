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
  call void @init_array(float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %9 = load float, float* %3, align 4
  %10 = bitcast i8* %5 to [2160 x float]*
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call void @kernel_deriche(float %9, [2160 x float]* %8, [2160 x float]* %10, [2160 x float]* %11, [2160 x float]* %12)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call void @print_array([2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %2, %17
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(float* nocapture, [2160 x float]* nocapture) #2 {
.preheader.us.preheader:
  store float 2.500000e-01, float* %0, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %sext = mul nuw nsw i64 %indvars.iv.us, 1344324763648
  %2 = lshr exact i64 %sext, 32
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %2, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %3 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %4 = add <4 x i64> %broadcast.splat, %3
  %5 = trunc <4 x i64> %4 to <4 x i32>
  %6 = srem <4 x i32> %5, <i32 65536, i32 65536, i32 65536, i32 65536>
  %7 = sitofp <4 x i32> %6 to <4 x float>
  %8 = fdiv <4 x float> %7, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %9 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv.us, i64 %index
  %10 = bitcast float* %9 to <4 x float>*
  store <4 x float> %8, <4 x float>* %10, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %11 = icmp eq i64 %index.next, 2160
  br i1 %11, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 4096
  br i1 %exitcond.us, label %.loopexit, label %.preheader.us

.loopexit:                                        ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(float, [2160 x float]*, [2160 x float]*, [2160 x float]*, [2160 x float]*) #0 {
.lr.ph94.split.us.preheader:
  %5 = alloca [2160 x float]*, align 8
  %6 = alloca [2160 x float]*, align 8
  %7 = alloca [2160 x float]*, align 8
  %8 = alloca [2160 x float]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  store [2160 x float]* %1, [2160 x float]** %5, align 8
  store [2160 x float]* %2, [2160 x float]** %6, align 8
  store [2160 x float]* %3, [2160 x float]** %7, align 8
  store [2160 x float]* %4, [2160 x float]** %8, align 8
  %15 = fsub float -0.000000e+00, %0
  %16 = tail call float @expf(float %15) #5
  %17 = fsub float 1.000000e+00, %16
  %18 = tail call float @expf(float %15) #5
  %19 = fsub float 1.000000e+00, %18
  %20 = fmul float %17, %19
  %21 = fmul float %0, 2.000000e+00
  %22 = tail call float @expf(float %15) #5
  %23 = fmul float %21, %22
  %24 = fadd float %23, 1.000000e+00
  %25 = tail call float @expf(float %21) #5
  %26 = fsub float %24, %25
  %27 = fdiv float %20, %26
  %28 = tail call float @expf(float %15) #5
  %29 = fmul float %27, %28
  %30 = tail call float @expf(float %15) #5
  %31 = fmul float %27, %30
  %32 = insertelement <2 x float> undef, float %0, i32 0
  %33 = shufflevector <2 x float> %32, <2 x float> undef, <2 x i32> zeroinitializer
  %34 = fadd <2 x float> %33, <float -1.000000e+00, float 1.000000e+00>
  %35 = insertelement <2 x float> undef, float %29, i32 0
  %36 = insertelement <2 x float> %35, float %31, i32 1
  %37 = fmul <2 x float> %36, %34
  %38 = extractelement <2 x float> %37, i32 0
  %39 = fmul float %0, -2.000000e+00
  %40 = tail call float @expf(float %39) #5
  %41 = fmul float %27, %40
  %exp2 = tail call float @llvm.exp2.f32(float %15)
  %42 = tail call float @expf(float %39) #5
  %43 = fsub float -0.000000e+00, %42
  store i32 0, i32* %9, align 4
  %44 = bitcast float* %11 to i32*
  br label %.lr.ph94.split.us

.lr.ph94.split.us:                                ; preds = %._crit_edge88.us, %.lr.ph94.split.us.preheader
  %storemerge92.us = phi i32 [ 0, %.lr.ph94.split.us.preheader ], [ %81, %._crit_edge88.us ]
  %45 = phi [2160 x float]* [ %3, %.lr.ph94.split.us.preheader ], [ %74, %._crit_edge88.us ]
  %46 = phi [2160 x float]* [ %1, %.lr.ph94.split.us.preheader ], [ %66, %._crit_edge88.us ]
  store float 0.000000e+00, float* %11, align 4
  store i32 0, i32* %10, align 4
  br label %47

; <label>:47:                                     ; preds = %47, %.lr.ph94.split.us
  %storemerge1185.us = phi i32 [ 0, %.lr.ph94.split.us ], [ %78, %47 ]
  %48 = phi [2160 x float]* [ %45, %.lr.ph94.split.us ], [ %74, %47 ]
  %49 = phi i32 [ %storemerge92.us, %.lr.ph94.split.us ], [ %67, %47 ]
  %50 = phi [2160 x float]* [ %46, %.lr.ph94.split.us ], [ %66, %47 ]
  %51 = phi float [ 0.000000e+00, %.lr.ph94.split.us ], [ %72, %47 ]
  %52 = phi float [ 0.000000e+00, %.lr.ph94.split.us ], [ %79, %47 ]
  %53 = phi float [ 0.000000e+00, %.lr.ph94.split.us ], [ %73, %47 ]
  %54 = sext i32 %49 to i64
  %55 = sext i32 %storemerge1185.us to i64
  %56 = getelementptr inbounds [2160 x float], [2160 x float]* %50, i64 %54, i64 %55
  %57 = load float, float* %56, align 4
  %58 = fmul float %27, %57
  %59 = fmul float %38, %51
  %60 = fadd float %58, %59
  %61 = fmul float %exp2, %52
  %62 = fadd float %60, %61
  %63 = fmul float %53, %43
  %64 = fadd float %62, %63
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %48, i64 %54, i64 %55
  store float %64, float* %65, align 4
  %66 = load [2160 x float]*, [2160 x float]** %5, align 8
  %67 = load i32, i32* %9, align 4
  %68 = sext i32 %67 to i64
  %69 = load i32, i32* %10, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %66, i64 %68, i64 %70
  %72 = load float, float* %71, align 4
  %73 = load float, float* %11, align 4
  %74 = load [2160 x float]*, [2160 x float]** %7, align 8
  %75 = getelementptr inbounds [2160 x float], [2160 x float]* %74, i64 %68, i64 %70
  %76 = bitcast float* %75 to i32*
  %77 = load i32, i32* %76, align 4
  store i32 %77, i32* %44, align 4
  %78 = add nsw i32 %69, 1
  %79 = bitcast i32 %77 to float
  store i32 %78, i32* %10, align 4
  %80 = icmp slt i32 %78, 2160
  br i1 %80, label %47, label %._crit_edge88.us

._crit_edge88.us:                                 ; preds = %47
  %81 = add nsw i32 %67, 1
  store i32 %81, i32* %9, align 4
  %82 = icmp slt i32 %81, 4096
  br i1 %82, label %.lr.ph94.split.us, label %.lr.ph81.split.us.preheader

.lr.ph81.split.us.preheader:                      ; preds = %._crit_edge88.us
  %83 = extractelement <2 x float> %37, i32 1
  %84 = fsub float -0.000000e+00, %41
  store i32 0, i32* %9, align 4
  %85 = bitcast float* %12 to i32*
  %86 = bitcast float* %14 to i32*
  br label %.lr.ph81.split.us

.lr.ph81.split.us:                                ; preds = %._crit_edge77.us, %.lr.ph81.split.us.preheader
  %storemerge180.us = phi i32 [ 0, %.lr.ph81.split.us.preheader ], [ %122, %._crit_edge77.us ]
  %87 = phi [2160 x float]* [ %4, %.lr.ph81.split.us.preheader ], [ %115, %._crit_edge77.us ]
  store float 0.000000e+00, float* %14, align 4
  store float 0.000000e+00, float* %12, align 4
  store i32 2159, i32* %10, align 4
  br label %88

; <label>:88:                                     ; preds = %88, %.lr.ph81.split.us
  %storemerge1074.us = phi i32 [ 2159, %.lr.ph81.split.us ], [ %storemerge10.us, %88 ]
  %89 = phi [2160 x float]* [ %87, %.lr.ph81.split.us ], [ %115, %88 ]
  %90 = phi i32 [ %storemerge180.us, %.lr.ph81.split.us ], [ %107, %88 ]
  %91 = phi float [ 0.000000e+00, %.lr.ph81.split.us ], [ %119, %88 ]
  %92 = phi float [ 0.000000e+00, %.lr.ph81.split.us ], [ %105, %88 ]
  %93 = phi float [ 0.000000e+00, %.lr.ph81.split.us ], [ %120, %88 ]
  %94 = phi float [ 0.000000e+00, %.lr.ph81.split.us ], [ %114, %88 ]
  %95 = fmul float %83, %91
  %96 = fmul float %92, %84
  %97 = fadd float %95, %96
  %98 = fmul float %exp2, %93
  %99 = fadd float %97, %98
  %100 = fmul float %94, %43
  %101 = fadd float %99, %100
  %102 = sext i32 %90 to i64
  %103 = sext i32 %storemerge1074.us to i64
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %89, i64 %102, i64 %103
  store float %101, float* %104, align 4
  %105 = load float, float* %12, align 4
  %106 = load [2160 x float]*, [2160 x float]** %5, align 8
  %107 = load i32, i32* %9, align 4
  %108 = sext i32 %107 to i64
  %109 = load i32, i32* %10, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %106, i64 %108, i64 %110
  %112 = bitcast float* %111 to i32*
  %113 = load i32, i32* %112, align 4
  store i32 %113, i32* %85, align 4
  %114 = load float, float* %14, align 4
  %115 = load [2160 x float]*, [2160 x float]** %8, align 8
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %115, i64 %108, i64 %110
  %117 = bitcast float* %116 to i32*
  %118 = load i32, i32* %117, align 4
  store i32 %118, i32* %86, align 4
  %119 = bitcast i32 %113 to float
  %120 = bitcast i32 %118 to float
  %storemerge10.us = add nsw i32 %109, -1
  store i32 %storemerge10.us, i32* %10, align 4
  %121 = icmp sgt i32 %109, 0
  br i1 %121, label %88, label %._crit_edge77.us

._crit_edge77.us:                                 ; preds = %88
  %122 = add nsw i32 %107, 1
  store i32 %122, i32* %9, align 4
  %123 = icmp slt i32 %122, 4096
  br i1 %123, label %.lr.ph81.split.us, label %.preheader33.us.preheader

.preheader33.us.preheader:                        ; preds = %._crit_edge77.us
  store i32 0, i32* %9, align 4
  br label %.preheader33.us

.preheader33.us:                                  ; preds = %._crit_edge67.us, %.preheader33.us.preheader
  %indvars.iv.us = phi i64 [ 0, %.preheader33.us.preheader ], [ %indvars.iv.next.us, %._crit_edge67.us ]
  br label %124

; <label>:124:                                    ; preds = %124, %.preheader33.us
  %indvars.iv130 = phi i64 [ 0, %.preheader33.us ], [ %indvars.iv.next131.1, %124 ]
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %74, i64 %indvars.iv.us, i64 %indvars.iv130
  %126 = load float, float* %125, align 4
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %115, i64 %indvars.iv.us, i64 %indvars.iv130
  %128 = load float, float* %127, align 4
  %129 = fadd float %126, %128
  %130 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.us, i64 %indvars.iv130
  store float %129, float* %130, align 4
  %indvars.iv.next131 = or i64 %indvars.iv130, 1
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %74, i64 %indvars.iv.us, i64 %indvars.iv.next131
  %132 = load float, float* %131, align 4
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %115, i64 %indvars.iv.us, i64 %indvars.iv.next131
  %134 = load float, float* %133, align 4
  %135 = fadd float %132, %134
  %136 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.us, i64 %indvars.iv.next131
  store float %135, float* %136, align 4
  %indvars.iv.next131.1 = add nuw nsw i64 %indvars.iv130, 2
  %exitcond133.1 = icmp eq i64 %indvars.iv.next131.1, 2160
  br i1 %exitcond133.1, label %._crit_edge67.us, label %124

._crit_edge67.us:                                 ; preds = %124
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 4096
  br i1 %exitcond.us, label %.lr.ph60.split.us.preheader, label %.preheader33.us

.lr.ph60.split.us.preheader:                      ; preds = %._crit_edge67.us
  store i32 2160, i32* %10, align 4
  store i32 4096, i32* %9, align 4
  store i32 0, i32* %10, align 4
  %137 = bitcast float* %11 to i32*
  br label %.lr.ph60.split.us

.lr.ph60.split.us:                                ; preds = %._crit_edge55.us, %.lr.ph60.split.us.preheader
  %storemerge359.us = phi i32 [ 0, %.lr.ph60.split.us.preheader ], [ %174, %._crit_edge55.us ]
  %138 = phi [2160 x float]* [ %74, %.lr.ph60.split.us.preheader ], [ %167, %._crit_edge55.us ]
  %139 = phi [2160 x float]* [ %2, %.lr.ph60.split.us.preheader ], [ %159, %._crit_edge55.us ]
  store float 0.000000e+00, float* %11, align 4
  store i32 0, i32* %9, align 4
  br label %140

; <label>:140:                                    ; preds = %140, %.lr.ph60.split.us
  %storemerge852.us = phi i32 [ 0, %.lr.ph60.split.us ], [ %171, %140 ]
  %141 = phi [2160 x float]* [ %138, %.lr.ph60.split.us ], [ %167, %140 ]
  %142 = phi [2160 x float]* [ %139, %.lr.ph60.split.us ], [ %159, %140 ]
  %143 = phi i32 [ %storemerge359.us, %.lr.ph60.split.us ], [ %162, %140 ]
  %144 = phi float [ 0.000000e+00, %.lr.ph60.split.us ], [ %165, %140 ]
  %145 = phi float [ 0.000000e+00, %.lr.ph60.split.us ], [ %172, %140 ]
  %146 = phi float [ 0.000000e+00, %.lr.ph60.split.us ], [ %166, %140 ]
  %147 = sext i32 %storemerge852.us to i64
  %148 = sext i32 %143 to i64
  %149 = getelementptr inbounds [2160 x float], [2160 x float]* %142, i64 %147, i64 %148
  %150 = load float, float* %149, align 4
  %151 = fmul float %27, %150
  %152 = fmul float %38, %144
  %153 = fadd float %151, %152
  %154 = fmul float %exp2, %145
  %155 = fadd float %153, %154
  %156 = fmul float %146, %43
  %157 = fadd float %155, %156
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %141, i64 %147, i64 %148
  store float %157, float* %158, align 4
  %159 = load [2160 x float]*, [2160 x float]** %6, align 8
  %160 = load i32, i32* %9, align 4
  %161 = sext i32 %160 to i64
  %162 = load i32, i32* %10, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [2160 x float], [2160 x float]* %159, i64 %161, i64 %163
  %165 = load float, float* %164, align 4
  %166 = load float, float* %11, align 4
  %167 = load [2160 x float]*, [2160 x float]** %7, align 8
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %167, i64 %161, i64 %163
  %169 = bitcast float* %168 to i32*
  %170 = load i32, i32* %169, align 4
  store i32 %170, i32* %137, align 4
  %171 = add nsw i32 %160, 1
  %172 = bitcast i32 %170 to float
  store i32 %171, i32* %9, align 4
  %173 = icmp slt i32 %171, 4096
  br i1 %173, label %140, label %._crit_edge55.us

._crit_edge55.us:                                 ; preds = %140
  %174 = add nsw i32 %162, 1
  store i32 %174, i32* %10, align 4
  %175 = icmp slt i32 %174, 2160
  br i1 %175, label %.lr.ph60.split.us, label %.lr.ph47.split.us.preheader

.lr.ph47.split.us.preheader:                      ; preds = %._crit_edge55.us
  store i32 0, i32* %10, align 4
  %176 = bitcast float* %13 to i32*
  %177 = bitcast float* %14 to i32*
  br label %.lr.ph47.split.us

.lr.ph47.split.us:                                ; preds = %._crit_edge43.us, %.lr.ph47.split.us.preheader
  %storemerge446.us = phi i32 [ 0, %.lr.ph47.split.us.preheader ], [ %213, %._crit_edge43.us ]
  %178 = phi [2160 x float]* [ %115, %.lr.ph47.split.us.preheader ], [ %206, %._crit_edge43.us ]
  store float 0.000000e+00, float* %13, align 4
  store float 0.000000e+00, float* %14, align 4
  store i32 4095, i32* %9, align 4
  br label %179

; <label>:179:                                    ; preds = %179, %.lr.ph47.split.us
  %storemerge740.us = phi i32 [ 4095, %.lr.ph47.split.us ], [ %storemerge7.us, %179 ]
  %180 = phi [2160 x float]* [ %178, %.lr.ph47.split.us ], [ %206, %179 ]
  %181 = phi i32 [ %storemerge446.us, %.lr.ph47.split.us ], [ %200, %179 ]
  %182 = phi float [ 0.000000e+00, %.lr.ph47.split.us ], [ %210, %179 ]
  %183 = phi float [ 0.000000e+00, %.lr.ph47.split.us ], [ %196, %179 ]
  %184 = phi float [ 0.000000e+00, %.lr.ph47.split.us ], [ %211, %179 ]
  %185 = phi float [ 0.000000e+00, %.lr.ph47.split.us ], [ %205, %179 ]
  %186 = fmul float %83, %182
  %187 = fmul float %183, %84
  %188 = fadd float %186, %187
  %189 = fmul float %exp2, %184
  %190 = fadd float %188, %189
  %191 = fmul float %185, %43
  %192 = fadd float %190, %191
  %193 = sext i32 %storemerge740.us to i64
  %194 = sext i32 %181 to i64
  %195 = getelementptr inbounds [2160 x float], [2160 x float]* %180, i64 %193, i64 %194
  store float %192, float* %195, align 4
  %196 = load float, float* %13, align 4
  %197 = load [2160 x float]*, [2160 x float]** %6, align 8
  %198 = load i32, i32* %9, align 4
  %199 = sext i32 %198 to i64
  %200 = load i32, i32* %10, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [2160 x float], [2160 x float]* %197, i64 %199, i64 %201
  %203 = bitcast float* %202 to i32*
  %204 = load i32, i32* %203, align 4
  store i32 %204, i32* %176, align 4
  %205 = load float, float* %14, align 4
  %206 = load [2160 x float]*, [2160 x float]** %8, align 8
  %207 = getelementptr inbounds [2160 x float], [2160 x float]* %206, i64 %199, i64 %201
  %208 = bitcast float* %207 to i32*
  %209 = load i32, i32* %208, align 4
  store i32 %209, i32* %177, align 4
  %210 = bitcast i32 %204 to float
  %211 = bitcast i32 %209 to float
  %storemerge7.us = add nsw i32 %198, -1
  store i32 %storemerge7.us, i32* %9, align 4
  %212 = icmp sgt i32 %198, 0
  br i1 %212, label %179, label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %179
  %213 = add nsw i32 %200, 1
  store i32 %213, i32* %10, align 4
  %214 = icmp slt i32 %213, 2160
  br i1 %214, label %.lr.ph47.split.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge43.us
  store i32 0, i32* %9, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge98.us

._crit_edge98.us:                                 ; preds = %._crit_edge98.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.2, %._crit_edge98.us ]
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %167, i64 %indvars.iv26, i64 %indvars.iv
  %216 = load float, float* %215, align 4
  %217 = getelementptr inbounds [2160 x float], [2160 x float]* %206, i64 %indvars.iv26, i64 %indvars.iv
  %218 = load float, float* %217, align 4
  %219 = fadd float %216, %218
  %220 = getelementptr inbounds [2160 x float], [2160 x float]* %197, i64 %indvars.iv26, i64 %indvars.iv
  store float %219, float* %220, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %221 = getelementptr inbounds [2160 x float], [2160 x float]* %167, i64 %indvars.iv26, i64 %indvars.iv.next
  %222 = load float, float* %221, align 4
  %223 = getelementptr inbounds [2160 x float], [2160 x float]* %206, i64 %indvars.iv26, i64 %indvars.iv.next
  %224 = load float, float* %223, align 4
  %225 = fadd float %222, %224
  %226 = getelementptr inbounds [2160 x float], [2160 x float]* %197, i64 %indvars.iv26, i64 %indvars.iv.next
  store float %225, float* %226, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %227 = getelementptr inbounds [2160 x float], [2160 x float]* %167, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %228 = load float, float* %227, align 4
  %229 = getelementptr inbounds [2160 x float], [2160 x float]* %206, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %230 = load float, float* %229, align 4
  %231 = fadd float %228, %230
  %232 = getelementptr inbounds [2160 x float], [2160 x float]* %197, i64 %indvars.iv26, i64 %indvars.iv.next.1
  store float %231, float* %232, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond.2, label %._crit_edge.us, label %._crit_edge98.us

._crit_edge.us:                                   ; preds = %._crit_edge98.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 4096
  br i1 %exitcond28, label %._crit_edge38, label %.preheader.us

._crit_edge38:                                    ; preds = %._crit_edge.us
  store i32 2160, i32* %10, align 4
  store i32 4096, i32* %9, align 4
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2160 x float]* nocapture readonly) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv4.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5.us, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv4.us, 2160
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv.us
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %0, i64 %indvars.iv4.us, i64 %indvars.iv.us
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv4.us, 1
  %exitcond7.us = icmp eq i64 %indvars.iv.next5.us, 4096
  br i1 %exitcond7.us, label %.loopexit, label %.preheader.us

.loopexit:                                        ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
