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
  %4 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
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
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) #2 {
.lr.ph2.split.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %vector.ph

vector.ph:                                        ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %4 = mul nuw nsw i64 %indvars.iv10, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nuw nsw <4 x i64> %broadcast.splat, %5
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv10, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 4096
  br i1 %exitcond13, label %._crit_edge3, label %vector.ph

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) #0 {
.lr.ph32.split.us.preheader:
  %7 = fsub float -0.000000e+00, %2
  %8 = call float @expf(float %7) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = call float @expf(float %7) #5
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %9, %11
  %13 = fmul float %2, 2.000000e+00
  %14 = call float @expf(float %7) #5
  %15 = fmul float %13, %14
  %16 = fadd float %15, 1.000000e+00
  %17 = call float @expf(float %13) #5
  %18 = fsub float %16, %17
  %19 = fdiv float %12, %18
  %20 = call float @expf(float %7) #5
  %21 = fmul float %19, %20
  %22 = call float @expf(float %7) #5
  %23 = fmul float %19, %22
  %24 = insertelement <2 x float> undef, float %2, i32 0
  %25 = shufflevector <2 x float> %24, <2 x float> undef, <2 x i32> zeroinitializer
  %26 = fadd <2 x float> %25, <float -1.000000e+00, float 1.000000e+00>
  %27 = insertelement <2 x float> undef, float %21, i32 0
  %28 = insertelement <2 x float> %27, float %23, i32 1
  %29 = fmul <2 x float> %28, %26
  %30 = extractelement <2 x float> %29, i32 0
  %31 = extractelement <2 x float> %29, i32 1
  %32 = fmul float %2, -2.000000e+00
  %33 = call float @expf(float %32) #5
  %34 = fmul float %19, %33
  %35 = fsub float -0.000000e+00, %34
  %exp2 = call float @llvm.exp2.f32(float %7)
  %36 = call float @expf(float %32) #5
  %37 = fsub float -0.000000e+00, %36
  %38 = insertelement <2 x float> undef, float %30, i32 0
  %39 = insertelement <2 x float> %38, float %19, i32 1
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %._crit_edge30.us
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge30.us ], [ 0, %.lr.ph32.split.us.preheader ]
  br label %40

; <label>:40:                                     ; preds = %40, %.lr.ph32.split.us
  %indvars.iv137 = phi i64 [ 0, %.lr.ph32.split.us ], [ %indvars.iv.next138.1, %40 ]
  %41 = phi float [ 0.000000e+00, %.lr.ph32.split.us ], [ %52, %40 ]
  %42 = phi float [ 0.000000e+00, %.lr.ph32.split.us ], [ %64, %40 ]
  %43 = phi float [ 0.000000e+00, %.lr.ph32.split.us ], [ %66, %40 ]
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv141, i64 %indvars.iv137
  %45 = load float, float* %44, align 4
  %46 = fmul float %19, %45
  %47 = fmul float %30, %43
  %48 = fadd float %46, %47
  %49 = fmul float %exp2, %42
  %50 = fadd float %48, %49
  %51 = fmul float %41, %37
  %52 = fadd float %50, %51
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141, i64 %indvars.iv137
  store float %52, float* %53, align 4
  %54 = bitcast float* %44 to <2 x float>*
  %indvars.iv.next138 = or i64 %indvars.iv137, 1
  %55 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv141, i64 %indvars.iv.next138
  %56 = load <2 x float>, <2 x float>* %54, align 4
  %57 = fmul <2 x float> %39, %56
  %58 = extractelement <2 x float> %57, i32 0
  %59 = extractelement <2 x float> %57, i32 1
  %60 = fadd float %59, %58
  %61 = fmul float %exp2, %52
  %62 = fadd float %60, %61
  %63 = fmul float %42, %37
  %64 = fadd float %62, %63
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141, i64 %indvars.iv.next138
  store float %64, float* %65, align 4
  %66 = load float, float* %55, align 4
  %indvars.iv.next138.1 = add nuw nsw i64 %indvars.iv137, 2
  %exitcond140.1 = icmp eq i64 %indvars.iv.next138.1, 2160
  br i1 %exitcond140.1, label %._crit_edge30.us, label %40

._crit_edge30.us:                                 ; preds = %40
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next142, 4096
  br i1 %exitcond144, label %.lr.ph26.split.us.preheader, label %.lr.ph32.split.us

.lr.ph26.split.us.preheader:                      ; preds = %._crit_edge30.us
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %._crit_edge24.us, %.lr.ph26.split.us.preheader
  %indvars.iv132 = phi i64 [ 0, %.lr.ph26.split.us.preheader ], [ %indvars.iv.next133, %._crit_edge24.us ]
  br label %67

; <label>:67:                                     ; preds = %67, %.lr.ph26.split.us
  %indvars.iv130 = phi i64 [ 2160, %.lr.ph26.split.us ], [ %indvars.iv.next131.1, %67 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %78, %67 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %88, %67 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %81, %67 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %91, %67 ]
  %indvars.iv.next131 = add nsw i64 %indvars.iv130, -1
  %72 = fmul float %31, %71
  %73 = fmul float %70, %35
  %74 = fadd float %72, %73
  %75 = fmul float %exp2, %69
  %76 = fadd float %74, %75
  %77 = fmul float %68, %37
  %78 = fadd float %76, %77
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv132, i64 %indvars.iv.next131
  store float %78, float* %79, align 4
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv132, i64 %indvars.iv.next131
  %81 = load float, float* %80, align 4
  %indvars.iv.next131.1 = add nsw i64 %indvars.iv130, -2
  %82 = fmul float %31, %81
  %83 = fmul float %71, %35
  %84 = fadd float %82, %83
  %85 = fmul float %exp2, %78
  %86 = fadd float %84, %85
  %87 = fmul float %69, %37
  %88 = fadd float %86, %87
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv132, i64 %indvars.iv.next131.1
  store float %88, float* %89, align 4
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv132, i64 %indvars.iv.next131.1
  %91 = load float, float* %90, align 4
  %92 = icmp sgt i64 %indvars.iv.next131, 1
  br i1 %92, label %67, label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %67
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next133, 4096
  br i1 %exitcond135, label %.lr.ph20.split.us.preheader, label %.lr.ph26.split.us

.lr.ph20.split.us.preheader:                      ; preds = %._crit_edge24.us
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph20.split.us.preheader, %._crit_edge18.us
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %._crit_edge18.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %scevgep151 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 2
  %scevgep157 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 2
  %scevgep163 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 2
  %scevgep149 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 0
  %scevgep152 = getelementptr float, float* %scevgep151, i64 2158
  %scevgep155 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 0
  %scevgep158 = getelementptr float, float* %scevgep157, i64 2158
  %scevgep161 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 0
  %scevgep164 = getelementptr float, float* %scevgep163, i64 2158
  %bound0 = icmp ult float* %scevgep149, %scevgep158
  %bound1 = icmp ult float* %scevgep155, %scevgep152
  %found.conflict = and i1 %bound0, %bound1
  %bound0166 = icmp ult float* %scevgep149, %scevgep164
  %bound1167 = icmp ult float* %scevgep161, %scevgep152
  %found.conflict168 = and i1 %bound0166, %bound1167
  %conflict.rdx = or i1 %found.conflict, %found.conflict168
  br i1 %conflict.rdx, label %.lr.ph20.split.us.new.preheader227, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %93 = shl i64 %index, 1
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 %93
  %95 = bitcast float* %94 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %95, align 4, !alias.scope !4
  %96 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 %93
  %97 = bitcast float* %96 to <8 x float>*
  %wide.vec170 = load <8 x float>, <8 x float>* %97, align 4, !alias.scope !7
  %98 = fadd <8 x float> %wide.vec, %wide.vec170
  %99 = shufflevector <8 x float> %98, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %100 = add nuw nsw i64 %93, 1
  %101 = fadd <8 x float> %wide.vec, %wide.vec170
  %102 = shufflevector <8 x float> %101, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 %100
  %104 = getelementptr float, float* %103, i64 -1
  %105 = bitcast float* %104 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %99, <4 x float> %102, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %105, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %106 = icmp eq i64 %index.next, 1080
  br i1 %106, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge18.us, label %.lr.ph20.split.us.new.preheader227

.lr.ph20.split.us.new.preheader227:               ; preds = %middle.block, %vector.memcheck
  %indvars.iv117.ph = phi i64 [ 0, %vector.memcheck ], [ 2160, %middle.block ]
  br label %.lr.ph20.split.us.new

.lr.ph20.split.us.new:                            ; preds = %.lr.ph20.split.us.new.preheader227, %.lr.ph20.split.us.new
  %indvars.iv117 = phi i64 [ %indvars.iv.next118.1, %.lr.ph20.split.us.new ], [ %indvars.iv117.ph, %.lr.ph20.split.us.new.preheader227 ]
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 %indvars.iv117
  %108 = load float, float* %107, align 4
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 %indvars.iv117
  %110 = load float, float* %109, align 4
  %111 = fadd float %108, %110
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 %indvars.iv117
  store float %111, float* %112, align 4
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 %indvars.iv.next118
  %114 = load float, float* %113, align 4
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 %indvars.iv.next118
  %116 = load float, float* %115, align 4
  %117 = fadd float %114, %116
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 %indvars.iv.next118
  store float %117, float* %118, align 4
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %exitcond120.1 = icmp eq i64 %indvars.iv.next118.1, 2160
  br i1 %exitcond120.1, label %._crit_edge18.us.loopexit, label %.lr.ph20.split.us.new, !llvm.loop !13

._crit_edge18.us.loopexit:                        ; preds = %.lr.ph20.split.us.new
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge18.us.loopexit, %middle.block
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next126, 4096
  br i1 %exitcond128, label %.lr.ph14.split.us.preheader, label %vector.memcheck

.lr.ph14.split.us.preheader:                      ; preds = %._crit_edge18.us
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge12.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge12.us ], [ 0, %.lr.ph14.split.us.preheader ]
  br label %119

; <label>:119:                                    ; preds = %119, %.lr.ph14.split.us
  %indvars.iv108 = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvars.iv.next109.1, %119 ]
  %120 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %131, %119 ]
  %121 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %142, %119 ]
  %122 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %144, %119 ]
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv112
  %124 = load float, float* %123, align 4
  %125 = fmul float %19, %124
  %126 = fmul float %30, %122
  %127 = fadd float %125, %126
  %128 = fmul float %exp2, %121
  %129 = fadd float %127, %128
  %130 = fmul float %120, %37
  %131 = fadd float %129, %130
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv112
  store float %131, float* %132, align 4
  %133 = load float, float* %123, align 4
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %134 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next109, i64 %indvars.iv112
  %135 = load float, float* %134, align 4
  %136 = fmul float %19, %135
  %137 = fmul float %30, %133
  %138 = fadd float %136, %137
  %139 = fmul float %exp2, %131
  %140 = fadd float %138, %139
  %141 = fmul float %121, %37
  %142 = fadd float %140, %141
  %143 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next109, i64 %indvars.iv112
  store float %142, float* %143, align 4
  %144 = load float, float* %134, align 4
  %indvars.iv.next109.1 = add nuw nsw i64 %indvars.iv108, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next109.1, 4096
  br i1 %exitcond111.1, label %._crit_edge12.us, label %119

._crit_edge12.us:                                 ; preds = %119
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 2160
  br i1 %exitcond115, label %.lr.ph8.split.us.preheader, label %.lr.ph14.split.us

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge12.us
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv103 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next104, %._crit_edge6.us ]
  br label %145

; <label>:145:                                    ; preds = %145, %.lr.ph8.split.us
  %indvars.iv101 = phi i64 [ 4096, %.lr.ph8.split.us ], [ %indvars.iv.next102.1, %145 ]
  %146 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %156, %145 ]
  %147 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %166, %145 ]
  %148 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %159, %145 ]
  %149 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %169, %145 ]
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, -1
  %150 = fmul float %31, %149
  %151 = fmul float %148, %35
  %152 = fadd float %150, %151
  %153 = fmul float %exp2, %147
  %154 = fadd float %152, %153
  %155 = fmul float %146, %37
  %156 = fadd float %154, %155
  %157 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next102, i64 %indvars.iv103
  store float %156, float* %157, align 4
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next102, i64 %indvars.iv103
  %159 = load float, float* %158, align 4
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, -2
  %160 = fmul float %31, %159
  %161 = fmul float %149, %35
  %162 = fadd float %160, %161
  %163 = fmul float %exp2, %156
  %164 = fadd float %162, %163
  %165 = fmul float %147, %37
  %166 = fadd float %164, %165
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next102.1, i64 %indvars.iv103
  store float %166, float* %167, align 4
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next102.1, i64 %indvars.iv103
  %169 = load float, float* %168, align 4
  %170 = icmp sgt i64 %indvars.iv.next102, 1
  br i1 %170, label %145, label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %145
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 2160
  br i1 %exitcond106, label %.lr.ph2.split.us.preheader, label %.lr.ph8.split.us

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge6.us
  br label %vector.memcheck208

vector.memcheck208:                               ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %scevgep185 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 2
  %scevgep191 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 2
  %scevgep197 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 2
  %scevgep183 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 0
  %scevgep186 = getelementptr float, float* %scevgep185, i64 2158
  %scevgep189 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 0
  %scevgep192 = getelementptr float, float* %scevgep191, i64 2158
  %scevgep195 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 0
  %scevgep198 = getelementptr float, float* %scevgep197, i64 2158
  %bound0200 = icmp ult float* %scevgep183, %scevgep192
  %bound1201 = icmp ult float* %scevgep189, %scevgep186
  %found.conflict202 = and i1 %bound0200, %bound1201
  %bound0203 = icmp ult float* %scevgep183, %scevgep198
  %bound1204 = icmp ult float* %scevgep195, %scevgep186
  %found.conflict205 = and i1 %bound0203, %bound1204
  %conflict.rdx206 = or i1 %found.conflict202, %found.conflict205
  br i1 %conflict.rdx206, label %.lr.ph2.split.us.new.preheader226, label %vector.body173.preheader

vector.body173.preheader:                         ; preds = %vector.memcheck208
  br label %vector.body173

vector.body173:                                   ; preds = %vector.body173.preheader, %vector.body173
  %index210 = phi i64 [ %index.next211, %vector.body173 ], [ 0, %vector.body173.preheader ]
  %171 = shl i64 %index210, 1
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %171
  %173 = bitcast float* %172 to <8 x float>*
  %wide.vec219 = load <8 x float>, <8 x float>* %173, align 4, !alias.scope !14
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %171
  %175 = bitcast float* %174 to <8 x float>*
  %wide.vec222 = load <8 x float>, <8 x float>* %175, align 4, !alias.scope !17
  %176 = fadd <8 x float> %wide.vec219, %wide.vec222
  %177 = shufflevector <8 x float> %176, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %178 = add nuw nsw i64 %171, 1
  %179 = fadd <8 x float> %wide.vec219, %wide.vec222
  %180 = shufflevector <8 x float> %179, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %181 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %178
  %182 = getelementptr float, float* %181, i64 -1
  %183 = bitcast float* %182 to <8 x float>*
  %interleaved.vec225 = shufflevector <4 x float> %177, <4 x float> %180, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec225, <8 x float>* %183, align 4, !alias.scope !19, !noalias !21
  %index.next211 = add nuw nsw i64 %index210, 4
  %184 = icmp eq i64 %index.next211, 1080
  br i1 %184, label %middle.block174, label %vector.body173, !llvm.loop !22

middle.block174:                                  ; preds = %vector.body173
  br i1 true, label %._crit_edge.us, label %.lr.ph2.split.us.new.preheader226

.lr.ph2.split.us.new.preheader226:                ; preds = %middle.block174, %vector.memcheck208
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck208 ], [ 2160, %middle.block174 ]
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new.preheader226, %.lr.ph2.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph2.split.us.new ], [ %indvars.iv.ph, %.lr.ph2.split.us.new.preheader226 ]
  %185 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %indvars.iv
  %186 = load float, float* %185, align 4
  %187 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv
  %188 = load float, float* %187, align 4
  %189 = fadd float %186, %188
  %190 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %indvars.iv
  store float %189, float* %190, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %indvars.iv.next
  %192 = load float, float* %191, align 4
  %193 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv.next
  %194 = load float, float* %193, align 4
  %195 = fadd float %192, %194
  %196 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %indvars.iv.next
  store float %195, float* %196, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph2.split.us.new, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %.lr.ph2.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block174
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond = icmp eq i64 %indvars.iv.next98, 4096
  br i1 %exitcond, label %._crit_edge3, label %vector.memcheck208

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
.lr.ph2.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv10, 2160
  br label %8

; <label>:8:                                      ; preds = %15, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.lr.ph2.split.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 4096
  br i1 %exitcond13, label %._crit_edge3, label %.lr.ph2.split.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}
!14 = !{!15}
!15 = distinct !{!15, !16}
!16 = distinct !{!16, !"LVerDomain"}
!17 = !{!18}
!18 = distinct !{!18, !16}
!19 = !{!20}
!20 = distinct !{!20, !16}
!21 = !{!15, !18}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !2, !3}
