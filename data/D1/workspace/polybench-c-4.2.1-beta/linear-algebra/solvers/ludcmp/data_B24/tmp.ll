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
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #5
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 2000, double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #5
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge138

._crit_edge138:                                   ; preds = %._crit_edge138, %5
  %indvars.iv115137 = phi i64 [ 0, %5 ], [ %indvars.iv.next116.1, %._crit_edge138 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv115137
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv115137
  store double 0.000000e+00, double* %7, align 8
  %indvars.iv.next116 = or i64 %indvars.iv115137, 1
  %8 = trunc i64 %indvars.iv.next116 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fmul double %10, 5.000000e-01
  %12 = fadd double %11, 4.000000e+00
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv115137
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next116
  store double 0.000000e+00, double* %14, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next116
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next116.1 = add nsw i64 %indvars.iv115137, 2
  %16 = trunc i64 %indvars.iv.next116.1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = fadd double %19, 4.000000e+00
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next116
  store double %20, double* %21, align 8
  %exitcond151.1 = icmp eq i64 %indvars.iv.next116, 1999
  br i1 %exitcond151.1, label %.preheader121.preheader, label %._crit_edge138

.preheader121.preheader:                          ; preds = %._crit_edge138
  br label %.preheader121

.preheader121:                                    ; preds = %.preheader121.preheader, %._crit_edge..preheader121_crit_edge
  %22 = phi i64 [ %36, %._crit_edge..preheader121_crit_edge ], [ 1, %.preheader121.preheader ]
  %indvars.iv104136 = phi i32 [ %indvars.iv.next105, %._crit_edge..preheader121_crit_edge ], [ 1, %.preheader121.preheader ]
  %indvars.iv108135 = phi [2000 x double]* [ %37, %._crit_edge..preheader121_crit_edge ], [ %1, %.preheader121.preheader ]
  %indvars.iv111134 = phi i64 [ %indvars.iv.next112, %._crit_edge..preheader121_crit_edge ], [ 1, %.preheader121.preheader ]
  %indvars.iv113132 = phi i64 [ %indvars.iv.next114, %._crit_edge..preheader121_crit_edge ], [ 0, %.preheader121.preheader ]
  %23 = shl i64 %indvars.iv113132, 32
  %sext = add i64 %23, 4294967296
  %24 = ashr exact i64 %sext, 32
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv113132, i64 %24
  %25 = ashr exact i64 %sext, 29
  br label %._crit_edge139

.preheader120:                                    ; preds = %._crit_edge139
  %exitcond110130 = icmp eq i64 %22, 2000
  br i1 %exitcond110130, label %._crit_edge, label %.lr.ph.._crit_edge_crit_edge

._crit_edge139:                                   ; preds = %._crit_edge139, %.preheader121
  %indvars.iv98129 = phi i64 [ 0, %.preheader121 ], [ %indvars.iv.next99, %._crit_edge139 ]
  %26 = sub nsw i64 0, %indvars.iv98129
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv113132, i64 %indvars.iv98129
  store double %31, double* %32, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98129, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next99, %indvars.iv111134
  br i1 %exitcond103, label %.preheader120, label %._crit_edge139

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.preheader120
  %33 = sub nsw i64 16000, %25
  %scevgep149150 = bitcast double* %scevgep149 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep149150, i8 0, i64 %33, i32 8, i1 false)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader120, %.lr.ph.._crit_edge_crit_edge
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv108135, i64 0, i64 %indvars.iv113132
  store double 1.000000e+00, double* %34, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113132, 1
  %indvars.iv.next105 = add nuw i32 %indvars.iv104136, 1
  %35 = icmp slt i64 %indvars.iv.next114, 2000
  br i1 %35, label %._crit_edge..preheader121_crit_edge, label %38

._crit_edge..preheader121_crit_edge:              ; preds = %._crit_edge
  %36 = sext i32 %indvars.iv.next105 to i64
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv108135, i64 1, i64 0
  %37 = bitcast double* %scevgep to [2000 x double]*
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111134, 1
  br label %.preheader121

; <label>:38:                                     ; preds = %._crit_edge
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %40

; <label>:40:                                     ; preds = %40, %38
  %indvars.iv96128 = phi i64 [ 0, %38 ], [ %indvars.iv.next97.7, %40 ]
  %41 = mul nuw nsw i64 %indvars.iv96128, 16000
  %scevgep147 = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep147, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97 = or i64 %indvars.iv96128, 1
  %42 = mul nuw nsw i64 %indvars.iv.next97, 16000
  %scevgep147.1 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep147.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.1 = or i64 %indvars.iv96128, 2
  %43 = mul nuw nsw i64 %indvars.iv.next97.1, 16000
  %scevgep147.2 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep147.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.2 = or i64 %indvars.iv96128, 3
  %44 = mul nuw nsw i64 %indvars.iv.next97.2, 16000
  %scevgep147.3 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep147.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.3 = or i64 %indvars.iv96128, 4
  %45 = mul nuw nsw i64 %indvars.iv.next97.3, 16000
  %scevgep147.4 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep147.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.4 = or i64 %indvars.iv96128, 5
  %46 = mul nuw nsw i64 %indvars.iv.next97.4, 16000
  %scevgep147.5 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep147.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.5 = or i64 %indvars.iv96128, 6
  %47 = mul nuw nsw i64 %indvars.iv.next97.5, 16000
  %scevgep147.6 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep147.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next97.6 = or i64 %indvars.iv96128, 7
  %48 = mul nuw nsw i64 %indvars.iv.next97.6, 16000
  %scevgep147.7 = getelementptr i8, i8* %39, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep147.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond152.7 = icmp eq i64 %indvars.iv.next97.6, 1999
  %indvars.iv.next97.7 = add nsw i64 %indvars.iv96128, 8
  br i1 %exitcond152.7, label %.preheader79.preheader.preheader, label %40

.preheader79.preheader.preheader:                 ; preds = %40
  %49 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader79.preheader

.preheader79.preheader:                           ; preds = %.preheader79.preheader.preheader, %97
  %indvars.iv90126 = phi i64 [ %52, %97 ], [ 0, %.preheader79.preheader.preheader ]
  %scevgep155 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv90126
  %scevgep155156 = bitcast double* %scevgep155 to i8*
  %52 = add i64 %indvars.iv90126, 1
  %scevgep157 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %52
  %scevgep157158 = bitcast double* %scevgep157 to i8*
  br label %.preheader118

.preheader118:                                    ; preds = %.preheader79, %.preheader79.preheader
  %indvars.iv86125 = phi i64 [ 0, %.preheader79.preheader ], [ %indvars.iv.next87, %.preheader79 ]
  %53 = mul i64 %indvars.iv86125, 16000
  %scevgep153 = getelementptr i8, i8* %39, i64 %53
  %54 = add i64 %53, 16000
  %scevgep154 = getelementptr i8, i8* %39, i64 %54
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv86125, i64 %indvars.iv90126
  %bound0 = icmp ult i8* %scevgep153, %scevgep157158
  %bound1 = icmp ult i8* %scevgep155156, %scevgep154
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %55 to i8*
  %bound0160 = icmp ult i8* %scevgep153, %bc
  %bound1161 = icmp ult i8* %bc, %scevgep154
  %found.conflict162 = and i1 %bound0160, %bound1161
  %conflict.rdx = or i1 %found.conflict, %found.conflict162
  br i1 %conflict.rdx, label %._crit_edge141.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader118
  br label %vector.body

._crit_edge141.preheader:                         ; preds = %.preheader118
  br label %._crit_edge141

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %56 = or i64 %index, 1
  %57 = or i64 %index, 2
  %58 = or i64 %index, 3
  %59 = load double, double* %55, align 8, !alias.scope !1
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv90126
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv90126
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv90126
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv90126
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = load double, double* %65, align 8, !alias.scope !4
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = fmul <2 x double> %61, %71
  %75 = fmul <2 x double> %61, %73
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv86125, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %80 = fadd <2 x double> %wide.load, %74
  %81 = fadd <2 x double> %wide.load164, %75
  store <2 x double> %80, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %81, <2 x double>* %79, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %82 = icmp eq i64 %index.next, 2000
  br i1 %82, label %.preheader79.loopexit193, label %vector.body, !llvm.loop !9

._crit_edge141:                                   ; preds = %._crit_edge141, %._crit_edge141.preheader
  %indvars.iv82124 = phi i64 [ 0, %._crit_edge141.preheader ], [ %indvars.iv.next83.1, %._crit_edge141 ]
  %83 = load double, double* %55, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv82124, i64 %indvars.iv90126
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv86125, i64 %indvars.iv82124
  %88 = load double, double* %87, align 8
  %89 = fadd double %88, %86
  store double %89, double* %87, align 8
  %indvars.iv.next83 = or i64 %indvars.iv82124, 1
  %90 = load double, double* %55, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next83, i64 %indvars.iv90126
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv86125, i64 %indvars.iv.next83
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82124, 2
  %exitcond85.1 = icmp eq i64 %indvars.iv.next83.1, 2000
  br i1 %exitcond85.1, label %.preheader79.loopexit, label %._crit_edge141, !llvm.loop !12

.preheader79.loopexit:                            ; preds = %._crit_edge141
  br label %.preheader79

.preheader79.loopexit193:                         ; preds = %vector.body
  br label %.preheader79

.preheader79:                                     ; preds = %.preheader79.loopexit193, %.preheader79.loopexit
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86125, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, 2000
  br i1 %exitcond89, label %97, label %.preheader118

; <label>:97:                                     ; preds = %.preheader79
  %98 = icmp slt i64 %52, 2000
  br i1 %98, label %.preheader79.preheader, label %.preheader117.preheader

.preheader117.preheader:                          ; preds = %97
  %99 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %39 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader117

.preheader117:                                    ; preds = %.preheader117.preheader, %middle.block166
  %indvars.iv80123 = phi i64 [ %106, %middle.block166 ], [ 0, %.preheader117.preheader ]
  %scevgep170 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv80123, i64 0
  %scevgep170171 = bitcast double* %scevgep170 to i8*
  %106 = add i64 %indvars.iv80123, 1
  %scevgep172 = getelementptr [2000 x double], [2000 x double]* %1, i64 %106, i64 0
  %scevgep172173 = bitcast double* %scevgep172 to i8*
  %107 = mul i64 %indvars.iv80123, 16000
  %scevgep174 = getelementptr i8, i8* %39, i64 %107
  %108 = add i64 %107, 16000
  %scevgep175 = getelementptr i8, i8* %39, i64 %108
  %bound0176 = icmp ult i8* %scevgep170171, %scevgep175
  %bound1177 = icmp ult i8* %scevgep174, %scevgep172173
  %memcheck.conflict179 = and i1 %bound0176, %bound1177
  br i1 %memcheck.conflict179, label %._crit_edge143.preheader, label %vector.body165.preheader

vector.body165.preheader:                         ; preds = %.preheader117
  br label %vector.body165

._crit_edge143.preheader:                         ; preds = %.preheader117
  br label %._crit_edge143

vector.body165:                                   ; preds = %vector.body165, %vector.body165.preheader
  %index182 = phi i64 [ 0, %vector.body165.preheader ], [ %index.next183.1, %vector.body165 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv80123, i64 %index182
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load190 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load191 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80123, i64 %index182
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load190, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load191, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %index.next183 = or i64 %index182, 4
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv80123, i64 %index.next183
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load190.1 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !13
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load191.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80123, i64 %index.next183
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load190.1, <2 x i64>* %122, align 8, !alias.scope !16, !noalias !13
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load191.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %index.next183.1 = add nsw i64 %index182, 8
  %125 = icmp eq i64 %index.next183.1, 2000
  br i1 %125, label %middle.block166.loopexit192, label %vector.body165, !llvm.loop !18

._crit_edge143:                                   ; preds = %._crit_edge143, %._crit_edge143.preheader
  %indvars.iv122 = phi i64 [ 0, %._crit_edge143.preheader ], [ %indvars.iv.next.4, %._crit_edge143 ]
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv80123, i64 %indvars.iv122
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80123, i64 %indvars.iv122
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv122, 1
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv80123, i64 %indvars.iv.next
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80123, i64 %indvars.iv.next
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv122, 2
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv80123, i64 %indvars.iv.next.1
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80123, i64 %indvars.iv.next.1
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv122, 3
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv80123, i64 %indvars.iv.next.2
  %142 = bitcast double* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80123, i64 %indvars.iv.next.2
  %145 = bitcast double* %144 to i64*
  store i64 %143, i64* %145, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv122, 4
  %146 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv80123, i64 %indvars.iv.next.3
  %147 = bitcast double* %146 to i64*
  %148 = load i64, i64* %147, align 8
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80123, i64 %indvars.iv.next.3
  %150 = bitcast double* %149 to i64*
  store i64 %148, i64* %150, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv122, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block166.loopexit, label %._crit_edge143, !llvm.loop !19

middle.block166.loopexit:                         ; preds = %._crit_edge143
  br label %middle.block166

middle.block166.loopexit192:                      ; preds = %vector.body165
  br label %middle.block166

middle.block166:                                  ; preds = %middle.block166.loopexit192, %middle.block166.loopexit
  %151 = icmp slt i64 %106, 2000
  br i1 %151, label %.preheader117, label %152

; <label>:152:                                    ; preds = %middle.block166
  call void @free(i8* nonnull %39) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader127

.preheader127:                                    ; preds = %._crit_edge162, %5
  %indvars.iv125163 = phi i64 [ 0, %5 ], [ %indvars.iv.next126, %._crit_edge162 ]
  %exitcond113149 = icmp eq i64 %indvars.iv125163, 0
  br i1 %exitcond113149, label %vector.body.preheader, label %.lr.ph151.preheader

.lr.ph151.preheader:                              ; preds = %.preheader127
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 0
  br label %.lr.ph151

.lr.ph161:                                        ; preds = %._crit_edge147
  br i1 false, label %.lr.ph161.vector.body.preheader_crit_edge, label %.lr.ph161.split.preheader

.lr.ph161.vector.body.preheader_crit_edge:        ; preds = %.lr.ph161
  br label %vector.body.preheader

.lr.ph161.split.preheader:                        ; preds = %.lr.ph161
  %xtraiter196 = and i64 %indvars.iv125163, 1
  %lcmp.mod197 = icmp eq i64 %xtraiter196, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 0
  %8 = icmp eq i64 %indvars.iv125163, 1
  br label %.lr.ph161.split

vector.body.preheader:                            ; preds = %.lr.ph161.vector.body.preheader_crit_edge, %.preheader127
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.3, %vector.body ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %index
  %10 = bitcast double* %9 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %10, align 8
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x i64>*
  %wide.load183 = load <2 x i64>, <2 x i64>* %12, align 8
  store <2 x i64> %wide.load, <2 x i64>* %10, align 8
  store <2 x i64> %wide.load183, <2 x i64>* %12, align 8
  %index.next = or i64 %index, 4
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %index.next
  %14 = bitcast double* %13 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load183.1 = load <2 x i64>, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %14, align 8
  store <2 x i64> %wide.load183.1, <2 x i64>* %16, align 8
  %index.next.1 = or i64 %index, 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %index.next.1
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %18, align 8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load183.2 = load <2 x i64>, <2 x i64>* %20, align 8
  store <2 x i64> %wide.load.2, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load183.2, <2 x i64>* %20, align 8
  %index.next.2 = or i64 %index, 12
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %index.next.2
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load183.3 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load.3, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load183.3, <2 x i64>* %24, align 8
  %index.next.3 = add nsw i64 %index, 16
  %25 = icmp eq i64 %index.next.3, 2000
  br i1 %25, label %._crit_edge162.loopexit, label %vector.body, !llvm.loop !20

.lr.ph151:                                        ; preds = %.lr.ph151.preheader, %._crit_edge147
  %indvars.iv108150 = phi i64 [ %indvars.iv.next109, %._crit_edge147 ], [ 0, %.lr.ph151.preheader ]
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %indvars.iv108150
  %27 = load double, double* %26, align 8
  %exitcond107142 = icmp eq i64 %indvars.iv108150, 0
  br i1 %exitcond107142, label %._crit_edge147, label %.lr.ph146.preheader

.lr.ph146.preheader:                              ; preds = %.lr.ph151
  %xtraiter194 = and i64 %indvars.iv108150, 1
  %lcmp.mod195 = icmp eq i64 %xtraiter194, 0
  br i1 %lcmp.mod195, label %.lr.ph146.prol.loopexit.unr-lcssa, label %.lr.ph146.prol.preheader

.lr.ph146.prol.preheader:                         ; preds = %.lr.ph146.preheader
  br label %.lr.ph146.prol

.lr.ph146.prol:                                   ; preds = %.lr.ph146.prol.preheader
  %28 = load double, double* %6, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv108150
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %27, %31
  br label %.lr.ph146.prol.loopexit.unr-lcssa

.lr.ph146.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph146.preheader, %.lr.ph146.prol
  %.lcssa189.unr.ph = phi double [ %32, %.lr.ph146.prol ], [ undef, %.lr.ph146.preheader ]
  %.0144.unr.ph = phi double [ %32, %.lr.ph146.prol ], [ %27, %.lr.ph146.preheader ]
  %indvars.iv103143.unr.ph = phi i64 [ 1, %.lr.ph146.prol ], [ 0, %.lr.ph146.preheader ]
  br label %.lr.ph146.prol.loopexit

.lr.ph146.prol.loopexit:                          ; preds = %.lr.ph146.prol.loopexit.unr-lcssa
  %33 = icmp eq i64 %indvars.iv108150, 1
  br i1 %33, label %._crit_edge147.loopexit, label %.lr.ph146.preheader.new

.lr.ph146.preheader.new:                          ; preds = %.lr.ph146.prol.loopexit
  br label %.lr.ph146

.lr.ph146:                                        ; preds = %.lr.ph146, %.lr.ph146.preheader.new
  %.0144 = phi double [ %.0144.unr.ph, %.lr.ph146.preheader.new ], [ %45, %.lr.ph146 ]
  %indvars.iv103143 = phi i64 [ %indvars.iv103143.unr.ph, %.lr.ph146.preheader.new ], [ %indvars.iv.next104.1, %.lr.ph146 ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %indvars.iv103143
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv103143, i64 %indvars.iv108150
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fsub double %.0144, %38
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103143, 1
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %indvars.iv.next104
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next104, i64 %indvars.iv108150
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fsub double %39, %44
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv103143, 2
  %exitcond107.1 = icmp eq i64 %indvars.iv.next104.1, %indvars.iv108150
  br i1 %exitcond107.1, label %._crit_edge147.loopexit.unr-lcssa, label %.lr.ph146

._crit_edge147.loopexit.unr-lcssa:                ; preds = %.lr.ph146
  br label %._crit_edge147.loopexit

._crit_edge147.loopexit:                          ; preds = %.lr.ph146.prol.loopexit, %._crit_edge147.loopexit.unr-lcssa
  %.lcssa189 = phi double [ %.lcssa189.unr.ph, %.lr.ph146.prol.loopexit ], [ %45, %._crit_edge147.loopexit.unr-lcssa ]
  br label %._crit_edge147

._crit_edge147:                                   ; preds = %._crit_edge147.loopexit, %.lr.ph151
  %.0.lcssa = phi double [ %27, %.lr.ph151 ], [ %.lcssa189, %._crit_edge147.loopexit ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108150, i64 %indvars.iv108150
  %47 = load double, double* %46, align 8
  %48 = fdiv double %.0.lcssa, %47
  store double %48, double* %26, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108150, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next109, %indvars.iv125163
  br i1 %exitcond113, label %.lr.ph161, label %.lr.ph151

.lr.ph161.split:                                  ; preds = %.lr.ph161.split.preheader, %._crit_edge157
  %indvars.iv121160 = phi i64 [ %indvars.iv.next122, %._crit_edge157 ], [ %indvars.iv125163, %.lr.ph161.split.preheader ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %indvars.iv121160
  %50 = load double, double* %49, align 8
  br i1 %lcmp.mod197, label %._crit_edge165.prol.loopexit.unr-lcssa, label %._crit_edge165.prol.preheader

._crit_edge165.prol.preheader:                    ; preds = %.lr.ph161.split
  br label %._crit_edge165.prol

._crit_edge165.prol:                              ; preds = %._crit_edge165.prol.preheader
  %51 = load double, double* %7, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv121160
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %50, %54
  br label %._crit_edge165.prol.loopexit.unr-lcssa

._crit_edge165.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph161.split, %._crit_edge165.prol
  %.lcssa190.unr.ph = phi double [ %55, %._crit_edge165.prol ], [ undef, %.lr.ph161.split ]
  %.1154.unr.ph = phi double [ %55, %._crit_edge165.prol ], [ %50, %.lr.ph161.split ]
  %indvars.iv114153.unr.ph = phi i64 [ 1, %._crit_edge165.prol ], [ 0, %.lr.ph161.split ]
  br label %._crit_edge165.prol.loopexit

._crit_edge165.prol.loopexit:                     ; preds = %._crit_edge165.prol.loopexit.unr-lcssa
  br i1 %8, label %._crit_edge157, label %.lr.ph161.split.new

.lr.ph161.split.new:                              ; preds = %._crit_edge165.prol.loopexit
  br label %._crit_edge165

._crit_edge165:                                   ; preds = %._crit_edge165, %.lr.ph161.split.new
  %.1154 = phi double [ %.1154.unr.ph, %.lr.ph161.split.new ], [ %67, %._crit_edge165 ]
  %indvars.iv114153 = phi i64 [ %indvars.iv114153.unr.ph, %.lr.ph161.split.new ], [ %indvars.iv.next115.1, %._crit_edge165 ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %indvars.iv114153
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv114153, i64 %indvars.iv121160
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fsub double %.1154, %60
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114153, 1
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv125163, i64 %indvars.iv.next115
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next115, i64 %indvars.iv121160
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %61, %66
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114153, 2
  %exitcond118.1 = icmp eq i64 %indvars.iv.next115.1, %indvars.iv125163
  br i1 %exitcond118.1, label %._crit_edge157.unr-lcssa, label %._crit_edge165

._crit_edge157.unr-lcssa:                         ; preds = %._crit_edge165
  br label %._crit_edge157

._crit_edge157:                                   ; preds = %._crit_edge165.prol.loopexit, %._crit_edge157.unr-lcssa
  %.lcssa190 = phi double [ %.lcssa190.unr.ph, %._crit_edge165.prol.loopexit ], [ %67, %._crit_edge157.unr-lcssa ]
  store double %.lcssa190, double* %49, align 8
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121160, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next122, 2000
  br i1 %exitcond124, label %._crit_edge162.loopexit184, label %.lr.ph161.split

._crit_edge162.loopexit:                          ; preds = %vector.body
  br label %._crit_edge162

._crit_edge162.loopexit184:                       ; preds = %._crit_edge157
  br label %._crit_edge162

._crit_edge162:                                   ; preds = %._crit_edge162.loopexit184, %._crit_edge162.loopexit
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125163, 1
  %68 = icmp slt i64 %indvars.iv.next126, 2000
  br i1 %68, label %.preheader127, label %._crit_edge162._crit_edge.preheader

._crit_edge162._crit_edge.preheader:              ; preds = %._crit_edge162
  br label %._crit_edge162._crit_edge

._crit_edge162._crit_edge:                        ; preds = %._crit_edge162._crit_edge.backedge, %._crit_edge162._crit_edge.preheader
  %indvars.iv101140 = phi i64 [ 0, %._crit_edge162._crit_edge.preheader ], [ %indvars.iv101140.be, %._crit_edge162._crit_edge.backedge ]
  %69 = getelementptr inbounds double, double* %2, i64 %indvars.iv101140
  %70 = load double, double* %69, align 8
  %exitcond133 = icmp eq i64 %indvars.iv101140, 0
  br i1 %exitcond133, label %._crit_edge138.thread, label %.lr.ph137.preheader

.lr.ph137.preheader:                              ; preds = %._crit_edge162._crit_edge
  %71 = add i64 %indvars.iv101140, -1
  %xtraiter191 = and i64 %indvars.iv101140, 3
  %lcmp.mod192 = icmp eq i64 %xtraiter191, 0
  br i1 %lcmp.mod192, label %.lr.ph137.prol.loopexit, label %.lr.ph137.prol.preheader

.lr.ph137.prol.preheader:                         ; preds = %.lr.ph137.preheader
  br label %.lr.ph137.prol

.lr.ph137.prol:                                   ; preds = %.lr.ph137.prol, %.lr.ph137.prol.preheader
  %.2135.prol = phi double [ %77, %.lr.ph137.prol ], [ %70, %.lr.ph137.prol.preheader ]
  %indvars.iv97134.prol = phi i64 [ %indvars.iv.next98.prol, %.lr.ph137.prol ], [ 0, %.lr.ph137.prol.preheader ]
  %prol.iter193 = phi i64 [ %prol.iter193.sub, %.lr.ph137.prol ], [ %xtraiter191, %.lr.ph137.prol.preheader ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101140, i64 %indvars.iv97134.prol
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds double, double* %4, i64 %indvars.iv97134.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fsub double %.2135.prol, %76
  %indvars.iv.next98.prol = add nuw nsw i64 %indvars.iv97134.prol, 1
  %prol.iter193.sub = add i64 %prol.iter193, -1
  %prol.iter193.cmp = icmp eq i64 %prol.iter193.sub, 0
  br i1 %prol.iter193.cmp, label %.lr.ph137.prol.loopexit.unr-lcssa, label %.lr.ph137.prol, !llvm.loop !21

.lr.ph137.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph137.prol
  br label %.lr.ph137.prol.loopexit

.lr.ph137.prol.loopexit:                          ; preds = %.lr.ph137.preheader, %.lr.ph137.prol.loopexit.unr-lcssa
  %.lcssa188.unr = phi double [ undef, %.lr.ph137.preheader ], [ %77, %.lr.ph137.prol.loopexit.unr-lcssa ]
  %.2135.unr = phi double [ %70, %.lr.ph137.preheader ], [ %77, %.lr.ph137.prol.loopexit.unr-lcssa ]
  %indvars.iv97134.unr = phi i64 [ 0, %.lr.ph137.preheader ], [ %indvars.iv.next98.prol, %.lr.ph137.prol.loopexit.unr-lcssa ]
  %78 = icmp ult i64 %71, 3
  br i1 %78, label %._crit_edge138, label %.lr.ph137.preheader.new

.lr.ph137.preheader.new:                          ; preds = %.lr.ph137.prol.loopexit
  br label %.lr.ph137

._crit_edge138.thread:                            ; preds = %._crit_edge162._crit_edge
  store double %70, double* %4, align 8
  br label %._crit_edge162._crit_edge.backedge

._crit_edge162._crit_edge.backedge:               ; preds = %._crit_edge138.thread, %._crit_edge138
  %indvars.iv101140.be = phi i64 [ 1, %._crit_edge138.thread ], [ %indvars.iv.next102, %._crit_edge138 ]
  br label %._crit_edge162._crit_edge

.lr.ph137:                                        ; preds = %.lr.ph137, %.lr.ph137.preheader.new
  %.2135 = phi double [ %.2135.unr, %.lr.ph137.preheader.new ], [ %102, %.lr.ph137 ]
  %indvars.iv97134 = phi i64 [ %indvars.iv97134.unr, %.lr.ph137.preheader.new ], [ %indvars.iv.next98.3, %.lr.ph137 ]
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101140, i64 %indvars.iv97134
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds double, double* %4, i64 %indvars.iv97134
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = fsub double %.2135, %83
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97134, 1
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101140, i64 %indvars.iv.next98
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next98
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fsub double %84, %89
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97134, 2
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101140, i64 %indvars.iv.next98.1
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next98.1
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fsub double %90, %95
  %indvars.iv.next98.2 = add nsw i64 %indvars.iv97134, 3
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv101140, i64 %indvars.iv.next98.2
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next98.2
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = fsub double %96, %101
  %indvars.iv.next98.3 = add nsw i64 %indvars.iv97134, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next98.3, %indvars.iv101140
  br i1 %exitcond.3, label %._crit_edge138.unr-lcssa, label %.lr.ph137

._crit_edge138.unr-lcssa:                         ; preds = %.lr.ph137
  br label %._crit_edge138

._crit_edge138:                                   ; preds = %.lr.ph137.prol.loopexit, %._crit_edge138.unr-lcssa
  %.lcssa188 = phi double [ %.lcssa188.unr, %.lr.ph137.prol.loopexit ], [ %102, %._crit_edge138.unr-lcssa ]
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv101140
  store double %.lcssa188, double* %103, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101140, 1
  %104 = icmp slt i64 %indvars.iv.next102, 2000
  br i1 %104, label %._crit_edge162._crit_edge.backedge, label %._crit_edge138._crit_edge166.preheader

._crit_edge138._crit_edge166.preheader:           ; preds = %._crit_edge138
  br label %._crit_edge138._crit_edge166

._crit_edge138._crit_edge166:                     ; preds = %._crit_edge138._crit_edge166.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge138._crit_edge166.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv132 = phi i32 [ 2000, %._crit_edge138._crit_edge166.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %indvars.iv95130 = phi i64 [ 1999, %._crit_edge138._crit_edge166.preheader ], [ %indvars.iv.next96, %._crit_edge._crit_edge ]
  %105 = sub i32 2000, %indvar
  %106 = sext i32 %105 to i64
  %107 = sub nsw i64 1999, %106
  %108 = getelementptr inbounds double, double* %4, i64 %indvars.iv95130
  %109 = load double, double* %108, align 8
  %110 = icmp slt i32 %indvars.iv132, 2000
  br i1 %110, label %..lr.ph_crit_edge, label %._crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge138._crit_edge166
  %111 = sext i32 %indvars.iv132 to i64
  %112 = sub nsw i64 0, %106
  %xtraiter = and i64 %112, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %.3129.prol = phi double [ %118, %.lr.ph.prol ], [ %109, %.lr.ph.prol.preheader ]
  %indvars.iv93128.prol = phi i64 [ %indvars.iv.next94.prol, %.lr.ph.prol ], [ %111, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95130, i64 %indvars.iv93128.prol
  %114 = load double, double* %113, align 8
  %115 = getelementptr inbounds double, double* %3, i64 %indvars.iv93128.prol
  %116 = load double, double* %115, align 8
  %117 = fmul double %114, %116
  %118 = fsub double %.3129.prol, %117
  %indvars.iv.next94.prol = add nsw i64 %indvars.iv93128.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !23

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %118, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.3129.unr = phi double [ %109, %..lr.ph_crit_edge ], [ %118, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv93128.unr = phi i64 [ %111, %..lr.ph_crit_edge ], [ %indvars.iv.next94.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %119 = icmp ult i64 %107, 3
  br i1 %119, label %._crit_edge.loopexit, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %.3129 = phi double [ %.3129.unr, %..lr.ph_crit_edge.new ], [ %143, %.lr.ph ]
  %indvars.iv93128 = phi i64 [ %indvars.iv93128.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next94.3, %.lr.ph ]
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95130, i64 %indvars.iv93128
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds double, double* %3, i64 %indvars.iv93128
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fsub double %.3129, %124
  %indvars.iv.next94 = add nsw i64 %indvars.iv93128, 1
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95130, i64 %indvars.iv.next94
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next94
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = fsub double %125, %130
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93128, 2
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95130, i64 %indvars.iv.next94.1
  %133 = load double, double* %132, align 8
  %134 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next94.1
  %135 = load double, double* %134, align 8
  %136 = fmul double %133, %135
  %137 = fsub double %131, %136
  %indvars.iv.next94.2 = add nsw i64 %indvars.iv93128, 3
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95130, i64 %indvars.iv.next94.2
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next94.2
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fsub double %137, %142
  %exitcond170.3 = icmp eq i64 %indvars.iv.next94.2, 1999
  %indvars.iv.next94.3 = add nsw i64 %indvars.iv93128, 4
  br i1 %exitcond170.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %143, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge138._crit_edge166
  %.3.lcssa = phi double [ %109, %._crit_edge138._crit_edge166 ], [ %.lcssa, %._crit_edge.loopexit ]
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95130, i64 %indvars.iv95130
  %145 = load double, double* %144, align 8
  %146 = fdiv double %.3.lcssa, %145
  %147 = getelementptr inbounds double, double* %3, i64 %indvars.iv95130
  store double %146, double* %147, align 8
  %148 = icmp sgt i64 %indvars.iv95130, 0
  br i1 %148, label %._crit_edge._crit_edge, label %149

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  %indvars.iv.next96 = add nsw i64 %indvars.iv95130, -1
  %indvars.iv.next = add i32 %indvars.iv132, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge138._crit_edge166

; <label>:149:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv5 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv5
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %16, label %._crit_edge6, label %17

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.unroll.disable"}
!23 = distinct !{!23, !22}
