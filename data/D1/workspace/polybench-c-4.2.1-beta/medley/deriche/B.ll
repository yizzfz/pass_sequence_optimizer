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
define i32 @main(i32, i8**) #0 {
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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, float*, [2160 x float]*) #2 {
.preheader.lr.ph..preheader.us_crit_edge:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv12 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next13, %.loopexit.us ]
  %4 = mul nuw nsw i64 %indvars.iv12, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nuw nsw <4 x i64> %broadcast.splat, %5
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv12, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %.loopexit.us, label %vector.body, !llvm.loop !1

.loopexit.us:                                     ; preds = %vector.body
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 4096
  br i1 %exitcond14, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]*, [2160 x float]*, [2160 x float]*, [2160 x float]*) #0 {
.lr.ph39:
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
  %21 = fmul float %19, %20
  %22 = tail call float @expf(float %7) #5
  %23 = fmul float %19, %22
  %24 = insertelement <2 x float> undef, float %2, i32 0
  %25 = shufflevector <2 x float> %24, <2 x float> undef, <2 x i32> zeroinitializer
  %26 = fadd <2 x float> %25, <float -1.000000e+00, float 1.000000e+00>
  %27 = insertelement <2 x float> undef, float %21, i32 0
  %28 = insertelement <2 x float> %27, float %23, i32 1
  %29 = fmul <2 x float> %26, %28
  %30 = extractelement <2 x float> %29, i32 0
  %31 = extractelement <2 x float> %29, i32 1
  %32 = fmul float %2, -2.000000e+00
  %33 = tail call float @expf(float %32) #5
  %34 = fmul float %19, %33
  %35 = fsub float -0.000000e+00, %34
  %exp2 = tail call float @llvm.exp2.f32(float %7)
  %36 = tail call float @expf(float %32) #5
  %37 = fsub float -0.000000e+00, %36
  %38 = fmul float %30, 0.000000e+00
  %39 = fmul float %exp2, 0.000000e+00
  %40 = fmul float %36, -0.000000e+00
  br label %.lr.ph39.split.us

.lr.ph39.split.us:                                ; preds = %.loopexit45.us, %.lr.ph39
  %indvars.iv101 = phi i64 [ 0, %.lr.ph39 ], [ %indvars.iv.next102, %.loopexit45.us ]
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv101, i64 0
  %42 = load float, float* %41, align 4
  %43 = fmul float %19, %42
  %44 = fadd float %43, %38
  %45 = fadd float %44, %39
  %46 = fadd float %45, %40
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv101, i64 0
  store float %46, float* %47, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.1, %.lr.ph39.split.us
  %indvars.iv.next98118 = phi i64 [ 1, %.lr.ph39.split.us ], [ %indvars.iv.next98.1, %._crit_edge.1 ]
  %48 = phi float [ %46, %.lr.ph39.split.us ], [ %258, %._crit_edge.1 ]
  %49 = phi float* [ %41, %.lr.ph39.split.us ], [ %247, %._crit_edge.1 ]
  %50 = phi float [ 0.000000e+00, %.lr.ph39.split.us ], [ %63, %._crit_edge.1 ]
  %51 = bitcast float* %49 to <2 x float>*
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv101, i64 %indvars.iv.next98118
  %53 = load <2 x float>, <2 x float>* %51, align 4
  %54 = insertelement <2 x float> undef, float %30, i32 0
  %55 = insertelement <2 x float> %54, float %19, i32 1
  %56 = fmul <2 x float> %55, %53
  %57 = extractelement <2 x float> %56, i32 0
  %58 = extractelement <2 x float> %56, i32 1
  %59 = fadd float %58, %57
  %60 = fmul float %exp2, %48
  %61 = fadd float %59, %60
  %62 = fmul float %50, %37
  %63 = fadd float %61, %62
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv101, i64 %indvars.iv.next98118
  store float %63, float* %64, align 4
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv.next98118, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98118, 2159
  br i1 %exitcond100, label %.loopexit45.us, label %._crit_edge.1

.loopexit45.us:                                   ; preds = %._crit_edge
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next102, 4096
  br i1 %exitcond125, label %.lr.ph33.split.us.preheader, label %.lr.ph39.split.us

.lr.ph33.split.us.preheader:                      ; preds = %.loopexit45.us
  %65 = fmul float %31, 0.000000e+00
  %66 = fmul float %34, -0.000000e+00
  %67 = fadd float %65, %66
  %68 = fmul float %exp2, 0.000000e+00
  %69 = fadd float %67, %68
  %70 = fmul float %36, -0.000000e+00
  %71 = fadd float %69, %70
  br label %.lr.ph33.split.us

.lr.ph33.split.us:                                ; preds = %.lr.ph33.split.us.preheader, %.loopexit44.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %.loopexit44.us ], [ 0, %.lr.ph33.split.us.preheader ]
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 2159
  store float %71, float* %72, align 4
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv92, i64 2159
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %.lr.ph33.split.us, %._crit_edge46
  %.in.in = phi float* [ %73, %.lr.ph33.split.us ], [ %88, %._crit_edge46 ]
  %74 = phi float [ %71, %.lr.ph33.split.us ], [ %86, %._crit_edge46 ]
  %indvars.iv.next91116 = phi i64 [ 2159, %.lr.ph33.split.us ], [ %indvars.iv.next91, %._crit_edge46 ]
  %75 = phi i32 [ 0, %.lr.ph33.split.us ], [ %77, %._crit_edge46 ]
  %76 = phi float [ 0.000000e+00, %.lr.ph33.split.us ], [ %74, %._crit_edge46 ]
  %.in = bitcast float* %.in.in to i32*
  %77 = load i32, i32* %.in, align 4
  %78 = bitcast i32 %75 to float
  %79 = bitcast i32 %77 to float
  %indvars.iv.next91 = add nsw i64 %indvars.iv.next91116, -1
  %80 = fmul float %31, %79
  %81 = fmul float %78, %35
  %82 = fadd float %80, %81
  %83 = fmul float %exp2, %74
  %84 = fadd float %82, %83
  %85 = fmul float %76, %37
  %86 = fadd float %84, %85
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv.next91
  store float %86, float* %87, align 4
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv92, i64 %indvars.iv.next91
  %89 = icmp sgt i64 %indvars.iv.next91116, 1
  br i1 %89, label %._crit_edge46, label %.loopexit44.us

.loopexit44.us:                                   ; preds = %._crit_edge46
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next93, 4096
  br i1 %exitcond124, label %.preheader14.preheader, label %.lr.ph33.split.us

.preheader14.preheader:                           ; preds = %.loopexit44.us
  br label %.preheader14

.preheader14:                                     ; preds = %.preheader14.preheader, %.loopexit43
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %.loopexit43 ], [ 0, %.preheader14.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv86, i64 0
  %90 = add nuw nsw i64 %indvars.iv86, 1
  %scevgep132 = getelementptr [2160 x float], [2160 x float]* %4, i64 %90, i64 0
  %scevgep134 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv86, i64 0
  %scevgep136 = getelementptr [2160 x float], [2160 x float]* %5, i64 %90, i64 0
  %scevgep138 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv86, i64 0
  %scevgep140 = getelementptr [2160 x float], [2160 x float]* %6, i64 %90, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep136
  %bound1 = icmp ult float* %scevgep134, %scevgep132
  %found.conflict = and i1 %bound0, %bound1
  %bound0142 = icmp ult float* %scevgep, %scevgep140
  %bound1143 = icmp ult float* %scevgep138, %scevgep132
  %found.conflict144 = and i1 %bound0142, %bound1143
  %conflict.rdx = or i1 %found.conflict, %found.conflict144
  br i1 %conflict.rdx, label %.lr.ph28.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader14
  br label %vector.body

.lr.ph28.preheader:                               ; preds = %.preheader14
  br label %.lr.ph28

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv86, i64 %index
  %92 = bitcast float* %91 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %92, align 4, !alias.scope !4
  %93 = getelementptr float, float* %91, i64 4
  %94 = bitcast float* %93 to <4 x float>*
  %wide.load146 = load <4 x float>, <4 x float>* %94, align 4, !alias.scope !4
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv86, i64 %index
  %96 = bitcast float* %95 to <4 x float>*
  %wide.load147 = load <4 x float>, <4 x float>* %96, align 4, !alias.scope !7
  %97 = getelementptr float, float* %95, i64 4
  %98 = bitcast float* %97 to <4 x float>*
  %wide.load148 = load <4 x float>, <4 x float>* %98, align 4, !alias.scope !7
  %99 = fadd <4 x float> %wide.load, %wide.load147
  %100 = fadd <4 x float> %wide.load146, %wide.load148
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv86, i64 %index
  %102 = bitcast float* %101 to <4 x float>*
  store <4 x float> %99, <4 x float>* %102, align 4, !alias.scope !9, !noalias !11
  %103 = getelementptr float, float* %101, i64 4
  %104 = bitcast float* %103 to <4 x float>*
  store <4 x float> %100, <4 x float>* %104, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv86, i64 %index.next
  %106 = bitcast float* %105 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %106, align 4, !alias.scope !4
  %107 = getelementptr float, float* %105, i64 4
  %108 = bitcast float* %107 to <4 x float>*
  %wide.load146.1 = load <4 x float>, <4 x float>* %108, align 4, !alias.scope !4
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv86, i64 %index.next
  %110 = bitcast float* %109 to <4 x float>*
  %wide.load147.1 = load <4 x float>, <4 x float>* %110, align 4, !alias.scope !7
  %111 = getelementptr float, float* %109, i64 4
  %112 = bitcast float* %111 to <4 x float>*
  %wide.load148.1 = load <4 x float>, <4 x float>* %112, align 4, !alias.scope !7
  %113 = fadd <4 x float> %wide.load.1, %wide.load147.1
  %114 = fadd <4 x float> %wide.load146.1, %wide.load148.1
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv86, i64 %index.next
  %116 = bitcast float* %115 to <4 x float>*
  store <4 x float> %113, <4 x float>* %116, align 4, !alias.scope !9, !noalias !11
  %117 = getelementptr float, float* %115, i64 4
  %118 = bitcast float* %117 to <4 x float>*
  store <4 x float> %114, <4 x float>* %118, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %119 = icmp eq i64 %index.next.1, 2160
  br i1 %119, label %.loopexit43.loopexit190, label %vector.body, !llvm.loop !12

.lr.ph27.split.us:                                ; preds = %.lr.ph27.split.us.preheader, %.loopexit42.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %.loopexit42.us ], [ 0, %.lr.ph27.split.us.preheader ]
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv77
  %121 = load float, float* %120, align 4
  %122 = fmul float %19, %121
  %123 = fadd float %122, %166
  %124 = fadd float %123, %167
  %125 = fadd float %124, %168
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv77
  store float %125, float* %126, align 4
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.1, %.lr.ph27.split.us
  %indvars.iv.next74114 = phi i64 [ 1, %.lr.ph27.split.us ], [ %indvars.iv.next74.1, %._crit_edge47.1 ]
  %127 = phi float [ %125, %.lr.ph27.split.us ], [ %244, %._crit_edge47.1 ]
  %128 = phi float* [ %120, %.lr.ph27.split.us ], [ %236, %._crit_edge47.1 ]
  %129 = phi float [ 0.000000e+00, %.lr.ph27.split.us ], [ %139, %._crit_edge47.1 ]
  %130 = load float, float* %128, align 4
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next74114, i64 %indvars.iv77
  %132 = load float, float* %131, align 4
  %133 = fmul float %19, %132
  %134 = fmul float %30, %130
  %135 = fadd float %133, %134
  %136 = fmul float %exp2, %127
  %137 = fadd float %135, %136
  %138 = fmul float %129, %37
  %139 = fadd float %137, %138
  %140 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next74114, i64 %indvars.iv77
  store float %139, float* %140, align 4
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv.next74114, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74114, 4095
  br i1 %exitcond76, label %.loopexit42.us, label %._crit_edge47.1

.loopexit42.us:                                   ; preds = %._crit_edge47
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next78, 2160
  br i1 %exitcond121, label %.lr.ph22.split.us.preheader, label %.lr.ph27.split.us

.lr.ph22.split.us.preheader:                      ; preds = %.loopexit42.us
  %141 = fmul float %31, 0.000000e+00
  %142 = fmul float %34, -0.000000e+00
  %143 = fadd float %141, %142
  %144 = fmul float %exp2, 0.000000e+00
  %145 = fadd float %143, %144
  %146 = fmul float %36, -0.000000e+00
  %147 = fadd float %145, %146
  br label %.lr.ph22.split.us

.lr.ph28:                                         ; preds = %.lr.ph28, %.lr.ph28.preheader
  %indvars.iv82 = phi i64 [ 0, %.lr.ph28.preheader ], [ %indvars.iv.next83.2, %.lr.ph28 ]
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv86, i64 %indvars.iv82
  %149 = load float, float* %148, align 4
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv86, i64 %indvars.iv82
  %151 = load float, float* %150, align 4
  %152 = fadd float %149, %151
  %153 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv86, i64 %indvars.iv82
  store float %152, float* %153, align 4
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %154 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv86, i64 %indvars.iv.next83
  %155 = load float, float* %154, align 4
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv86, i64 %indvars.iv.next83
  %157 = load float, float* %156, align 4
  %158 = fadd float %155, %157
  %159 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv86, i64 %indvars.iv.next83
  store float %158, float* %159, align 4
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82, 2
  %160 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv86, i64 %indvars.iv.next83.1
  %161 = load float, float* %160, align 4
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv86, i64 %indvars.iv.next83.1
  %163 = load float, float* %162, align 4
  %164 = fadd float %161, %163
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv86, i64 %indvars.iv.next83.1
  store float %164, float* %165, align 4
  %indvars.iv.next83.2 = add nsw i64 %indvars.iv82, 3
  %exitcond122.2 = icmp eq i64 %indvars.iv.next83.2, 2160
  br i1 %exitcond122.2, label %.loopexit43.loopexit, label %.lr.ph28, !llvm.loop !13

.loopexit43.loopexit:                             ; preds = %.lr.ph28
  br label %.loopexit43

.loopexit43.loopexit190:                          ; preds = %vector.body
  br label %.loopexit43

.loopexit43:                                      ; preds = %.loopexit43.loopexit190, %.loopexit43.loopexit
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next87, 4096
  br i1 %exitcond123, label %.lr.ph27.split.us.preheader, label %.preheader14

.lr.ph27.split.us.preheader:                      ; preds = %.loopexit43
  %166 = fmul float %30, 0.000000e+00
  %167 = fmul float %exp2, 0.000000e+00
  %168 = fmul float %36, -0.000000e+00
  br label %.lr.ph27.split.us

.lr.ph22.split.us:                                ; preds = %.lr.ph22.split.us.preheader, %.loopexit41.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %.loopexit41.us ], [ 0, %.lr.ph22.split.us.preheader ]
  %169 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 4095, i64 %indvars.iv68
  store float %147, float* %169, align 4
  %170 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 4095, i64 %indvars.iv68
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %.lr.ph22.split.us, %._crit_edge48
  %.in188.in = phi float* [ %170, %.lr.ph22.split.us ], [ %185, %._crit_edge48 ]
  %171 = phi float [ %147, %.lr.ph22.split.us ], [ %183, %._crit_edge48 ]
  %indvars.iv.next67112 = phi i64 [ 4095, %.lr.ph22.split.us ], [ %indvars.iv.next67, %._crit_edge48 ]
  %172 = phi i32 [ 0, %.lr.ph22.split.us ], [ %174, %._crit_edge48 ]
  %173 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %171, %._crit_edge48 ]
  %.in188 = bitcast float* %.in188.in to i32*
  %174 = load i32, i32* %.in188, align 4
  %175 = bitcast i32 %172 to float
  %176 = bitcast i32 %174 to float
  %indvars.iv.next67 = add nsw i64 %indvars.iv.next67112, -1
  %177 = fmul float %31, %176
  %178 = fmul float %175, %35
  %179 = fadd float %177, %178
  %180 = fmul float %exp2, %171
  %181 = fadd float %179, %180
  %182 = fmul float %173, %37
  %183 = fadd float %181, %182
  %184 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next67, i64 %indvars.iv68
  store float %183, float* %184, align 4
  %185 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next67, i64 %indvars.iv68
  %186 = icmp sgt i64 %indvars.iv.next67112, 1
  br i1 %186, label %._crit_edge48, label %.loopexit41.us

.loopexit41.us:                                   ; preds = %._crit_edge48
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next69, 2160
  br i1 %exitcond120, label %.preheader.us.preheader, label %.lr.ph22.split.us

.preheader.us.preheader:                          ; preds = %.loopexit41.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  %scevgep154 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv61, i64 0
  %187 = add nuw nsw i64 %indvars.iv61, 1
  %scevgep156 = getelementptr [2160 x float], [2160 x float]* %4, i64 %187, i64 0
  %scevgep158 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv61, i64 0
  %scevgep160 = getelementptr [2160 x float], [2160 x float]* %5, i64 %187, i64 0
  %scevgep162 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv61, i64 0
  %scevgep164 = getelementptr [2160 x float], [2160 x float]* %6, i64 %187, i64 0
  %bound0166 = icmp ult float* %scevgep154, %scevgep160
  %bound1167 = icmp ult float* %scevgep158, %scevgep156
  %found.conflict168 = and i1 %bound0166, %bound1167
  %bound0169 = icmp ult float* %scevgep154, %scevgep164
  %bound1170 = icmp ult float* %scevgep162, %scevgep156
  %found.conflict171 = and i1 %bound0169, %bound1170
  %conflict.rdx172 = or i1 %found.conflict168, %found.conflict171
  br i1 %conflict.rdx172, label %._crit_edge49.preheader, label %vector.body149.preheader

vector.body149.preheader:                         ; preds = %.preheader.us
  br label %vector.body149

._crit_edge49.preheader:                          ; preds = %.preheader.us
  br label %._crit_edge49

vector.body149:                                   ; preds = %vector.body149, %vector.body149.preheader
  %index176 = phi i64 [ 0, %vector.body149.preheader ], [ %index.next177.1, %vector.body149 ]
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv61, i64 %index176
  %189 = bitcast float* %188 to <4 x float>*
  %wide.load184 = load <4 x float>, <4 x float>* %189, align 4, !alias.scope !14
  %190 = getelementptr float, float* %188, i64 4
  %191 = bitcast float* %190 to <4 x float>*
  %wide.load185 = load <4 x float>, <4 x float>* %191, align 4, !alias.scope !14
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv61, i64 %index176
  %193 = bitcast float* %192 to <4 x float>*
  %wide.load186 = load <4 x float>, <4 x float>* %193, align 4, !alias.scope !17
  %194 = getelementptr float, float* %192, i64 4
  %195 = bitcast float* %194 to <4 x float>*
  %wide.load187 = load <4 x float>, <4 x float>* %195, align 4, !alias.scope !17
  %196 = fadd <4 x float> %wide.load184, %wide.load186
  %197 = fadd <4 x float> %wide.load185, %wide.load187
  %198 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv61, i64 %index176
  %199 = bitcast float* %198 to <4 x float>*
  store <4 x float> %196, <4 x float>* %199, align 4, !alias.scope !19, !noalias !21
  %200 = getelementptr float, float* %198, i64 4
  %201 = bitcast float* %200 to <4 x float>*
  store <4 x float> %197, <4 x float>* %201, align 4, !alias.scope !19, !noalias !21
  %index.next177 = or i64 %index176, 8
  %202 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv61, i64 %index.next177
  %203 = bitcast float* %202 to <4 x float>*
  %wide.load184.1 = load <4 x float>, <4 x float>* %203, align 4, !alias.scope !14
  %204 = getelementptr float, float* %202, i64 4
  %205 = bitcast float* %204 to <4 x float>*
  %wide.load185.1 = load <4 x float>, <4 x float>* %205, align 4, !alias.scope !14
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv61, i64 %index.next177
  %207 = bitcast float* %206 to <4 x float>*
  %wide.load186.1 = load <4 x float>, <4 x float>* %207, align 4, !alias.scope !17
  %208 = getelementptr float, float* %206, i64 4
  %209 = bitcast float* %208 to <4 x float>*
  %wide.load187.1 = load <4 x float>, <4 x float>* %209, align 4, !alias.scope !17
  %210 = fadd <4 x float> %wide.load184.1, %wide.load186.1
  %211 = fadd <4 x float> %wide.load185.1, %wide.load187.1
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv61, i64 %index.next177
  %213 = bitcast float* %212 to <4 x float>*
  store <4 x float> %210, <4 x float>* %213, align 4, !alias.scope !19, !noalias !21
  %214 = getelementptr float, float* %212, i64 4
  %215 = bitcast float* %214 to <4 x float>*
  store <4 x float> %211, <4 x float>* %215, align 4, !alias.scope !19, !noalias !21
  %index.next177.1 = add nsw i64 %index176, 16
  %216 = icmp eq i64 %index.next177.1, 2160
  br i1 %216, label %.loopexit.us.loopexit189, label %vector.body149, !llvm.loop !22

._crit_edge49:                                    ; preds = %._crit_edge49, %._crit_edge49.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge49.preheader ], [ %indvars.iv.next.2, %._crit_edge49 ]
  %217 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv61, i64 %indvars.iv
  %218 = load float, float* %217, align 4
  %219 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv61, i64 %indvars.iv
  %220 = load float, float* %219, align 4
  %221 = fadd float %218, %220
  %222 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv61, i64 %indvars.iv
  store float %221, float* %222, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %223 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv61, i64 %indvars.iv.next
  %224 = load float, float* %223, align 4
  %225 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv61, i64 %indvars.iv.next
  %226 = load float, float* %225, align 4
  %227 = fadd float %224, %226
  %228 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv61, i64 %indvars.iv.next
  store float %227, float* %228, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %229 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv61, i64 %indvars.iv.next.1
  %230 = load float, float* %229, align 4
  %231 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv61, i64 %indvars.iv.next.1
  %232 = load float, float* %231, align 4
  %233 = fadd float %230, %232
  %234 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv61, i64 %indvars.iv.next.1
  store float %233, float* %234, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond119.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond119.2, label %.loopexit.us.loopexit, label %._crit_edge49, !llvm.loop !23

.loopexit.us.loopexit:                            ; preds = %._crit_edge49
  br label %.loopexit.us

.loopexit.us.loopexit189:                         ; preds = %vector.body149
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %.loopexit.us.loopexit189, %.loopexit.us.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond = icmp eq i64 %indvars.iv.next62, 4096
  br i1 %exitcond, label %.loopexit40, label %.preheader.us

.loopexit40:                                      ; preds = %.loopexit.us
  ret void

._crit_edge47.1:                                  ; preds = %._crit_edge47
  %235 = load float, float* %131, align 4
  %236 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next74, i64 %indvars.iv77
  %237 = load float, float* %236, align 4
  %238 = fmul float %19, %237
  %239 = fmul float %30, %235
  %240 = fadd float %238, %239
  %241 = fmul float %exp2, %139
  %242 = fadd float %240, %241
  %243 = fmul float %127, %37
  %244 = fadd float %242, %243
  %245 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next74, i64 %indvars.iv77
  store float %244, float* %245, align 4
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv.next74114, 2
  br label %._crit_edge47

._crit_edge.1:                                    ; preds = %._crit_edge
  %246 = bitcast float* %52 to <2 x float>*
  %247 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv101, i64 %indvars.iv.next98
  %248 = load <2 x float>, <2 x float>* %246, align 4
  %249 = insertelement <2 x float> undef, float %30, i32 0
  %250 = insertelement <2 x float> %249, float %19, i32 1
  %251 = fmul <2 x float> %250, %248
  %252 = extractelement <2 x float> %251, i32 0
  %253 = extractelement <2 x float> %251, i32 1
  %254 = fadd float %253, %252
  %255 = fmul float %exp2, %63
  %256 = fadd float %254, %255
  %257 = fmul float %48, %37
  %258 = fadd float %256, %257
  %259 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv101, i64 %indvars.iv.next98
  store float %258, float* %259, align 4
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv.next98118, 2
  br label %._crit_edge
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %7 = mul nuw nsw i64 %indvars.iv14, 2160
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge11

; <label>:12:                                     ; preds = %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 4096
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
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
