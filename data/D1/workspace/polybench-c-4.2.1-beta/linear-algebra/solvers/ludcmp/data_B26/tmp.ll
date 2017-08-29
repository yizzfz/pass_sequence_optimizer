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
  call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98, %5
  %indvars.iv137 = phi i64 [ 0, %5 ], [ %indvars.iv.next138.1, %._crit_edge98 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv137
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next138 = or i64 %indvars.iv137, 1
  %10 = trunc i64 %indvars.iv.next138 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv137
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next138.1 = add nuw nsw i64 %indvars.iv137, 2
  %13 = trunc i64 %indvars.iv.next138.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond139.1 = icmp eq i64 %indvars.iv.next138, 1999
  br i1 %exitcond139.1, label %.lr.ph.preheader, label %._crit_edge98

.lr.ph.preheader:                                 ; preds = %._crit_edge98
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge..preheader85_crit_edge
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge..preheader85_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv135, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %22
  %23 = sub i64 1998, %indvars.iv135
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  br label %28

.preheader84:                                     ; preds = %28
  %scevgep133134 = bitcast double* %scevgep133 to i8*
  %26 = add nuw nsw i64 %25, 8
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %27 = icmp slt i64 %indvars.iv.next136, 2000
  br i1 %27, label %._crit_edge..preheader85_crit_edge, label %37

; <label>:28:                                     ; preds = %28, %.lr.ph
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %28 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv118
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv118
  store double %34, double* %35, align 8
  %exitcond126 = icmp eq i64 %indvars.iv118, %indvars.iv135
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  br i1 %exitcond126, label %.preheader84, label %28

._crit_edge..preheader85_crit_edge:               ; preds = %.preheader84
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep133134, i8 0, i64 %26, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv135
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %.preheader84
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv135, i64 %indvars.iv135
  store double 1.000000e+00, double* %38, align 8
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader83_crit_edge

.preheader82:                                     ; preds = %..preheader83_crit_edge
  %40 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader81

..preheader83_crit_edge:                          ; preds = %..preheader83_crit_edge, %37
  %indvars.iv116 = phi i64 [ 0, %37 ], [ %indvars.iv.next117.7, %..preheader83_crit_edge ]
  %41 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
  %42 = mul nuw nsw i64 %indvars.iv.next117, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1 = or i64 %indvars.iv116, 2
  %43 = mul nuw nsw i64 %indvars.iv.next117.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2 = or i64 %indvars.iv116, 3
  %44 = mul nuw nsw i64 %indvars.iv.next117.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %45 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.4 = or i64 %indvars.iv116, 5
  %46 = mul nuw nsw i64 %indvars.iv.next117.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.5 = or i64 %indvars.iv116, 6
  %47 = mul nuw nsw i64 %indvars.iv.next117.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.6 = or i64 %indvars.iv116, 7
  %48 = mul nuw nsw i64 %indvars.iv.next117.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.7 = add nuw nsw i64 %indvars.iv116, 8
  %49 = icmp slt i64 %indvars.iv.next117.7, 2000
  br i1 %49, label %..preheader83_crit_edge, label %.preheader82

.preheader81:                                     ; preds = %95, %.preheader82
  %indvars.iv111 = phi i64 [ 0, %.preheader82 ], [ %50, %95 ]
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv111
  %scevgep142143 = bitcast double* %scevgep142 to i8*
  %50 = add nuw nsw i64 %indvars.iv111, 1
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %50
  %scevgep144145 = bitcast double* %scevgep144 to i8*
  br label %.preheader80

.preheader79:                                     ; preds = %95
  br label %.preheader

.preheader80:                                     ; preds = %middle.block, %.preheader81
  %indvars.iv109 = phi i64 [ 0, %.preheader81 ], [ %indvars.iv.next110, %middle.block ]
  %51 = mul nuw nsw i64 %indvars.iv109, 16000
  %scevgep140 = getelementptr i8, i8* %39, i64 %51
  %52 = add nuw nsw i64 %51, 16000
  %scevgep141 = getelementptr i8, i8* %39, i64 %52
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv111
  %bound0 = icmp ult i8* %scevgep140, %scevgep144145
  %bound1 = icmp ult i8* %scevgep142143, %scevgep141
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %53 to i8*
  %bound0147 = icmp ult i8* %scevgep140, %bc
  %bound1148 = icmp ult i8* %bc, %scevgep141
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx = or i1 %found.conflict, %found.conflict149
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader80
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader80
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %54 = or i64 %index, 1
  %55 = or i64 %index, 2
  %56 = or i64 %index, 3
  %57 = load double, double* %53, align 8, !alias.scope !1
  %58 = insertelement <2 x double> undef, double %57, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv111
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv111
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv111
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv111
  %64 = load double, double* %60, align 8, !alias.scope !4
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = insertelement <2 x double> undef, double %64, i32 0
  %69 = insertelement <2 x double> %68, double %65, i32 1
  %70 = insertelement <2 x double> undef, double %66, i32 0
  %71 = insertelement <2 x double> %70, double %67, i32 1
  %72 = fmul <2 x double> %59, %69
  %73 = fmul <2 x double> %59, %71
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv109, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load151, %73
  store <2 x double> %78, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %79, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %80 = icmp eq i64 %index.next, 2000
  br i1 %80, label %middle.block.loopexit181, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv106 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next107.1, %scalar.ph ]
  %81 = load double, double* %53, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv111
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv109, i64 %indvars.iv106
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %88 = load double, double* %53, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next107, i64 %indvars.iv111
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next107
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %exitcond108.1 = icmp eq i64 %indvars.iv.next107, 1999
  %indvars.iv.next107.1 = add nuw nsw i64 %indvars.iv106, 2
  br i1 %exitcond108.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit181:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit181, %middle.block.loopexit
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond182 = icmp ne i64 %indvars.iv.next110, 2000
  br i1 %exitcond182, label %.preheader80, label %95

; <label>:95:                                     ; preds = %middle.block
  %exitcond183 = icmp ne i64 %50, 2000
  br i1 %exitcond183, label %.preheader81, label %.preheader79

.preheader:                                       ; preds = %middle.block153, %.preheader79
  %indvars.iv104 = phi i64 [ 0, %.preheader79 ], [ %96, %middle.block153 ]
  %scevgep157 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 0
  %scevgep157158 = bitcast double* %scevgep157 to i8*
  %96 = add nuw nsw i64 %indvars.iv104, 1
  %scevgep159 = getelementptr [2000 x double], [2000 x double]* %1, i64 %96, i64 0
  %scevgep159160 = bitcast double* %scevgep159 to i8*
  %97 = mul nuw nsw i64 %indvars.iv104, 16000
  %scevgep161 = getelementptr i8, i8* %39, i64 %97
  %98 = add nuw nsw i64 %97, 16000
  %scevgep162 = getelementptr i8, i8* %39, i64 %98
  %bound0163 = icmp ult i8* %scevgep157158, %scevgep162
  %bound1164 = icmp ult i8* %scevgep161, %scevgep159160
  %memcheck.conflict166 = and i1 %bound0163, %bound1164
  br i1 %memcheck.conflict166, label %scalar.ph154.preheader, label %vector.body152.preheader

vector.body152.preheader:                         ; preds = %.preheader
  br label %vector.body152

scalar.ph154.preheader:                           ; preds = %.preheader
  br label %scalar.ph154

vector.body152:                                   ; preds = %vector.body152, %vector.body152.preheader
  %index169 = phi i64 [ 0, %vector.body152.preheader ], [ %index.next170.1, %vector.body152 ]
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv104, i64 %index169
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load177 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load178 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %index169
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load177, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load178, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %index.next170 = or i64 %index169, 4
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv104, i64 %index.next170
  %108 = bitcast double* %107 to <2 x i64>*
  %wide.load177.1 = load <2 x i64>, <2 x i64>* %108, align 8, !alias.scope !13
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load178.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %index.next170
  %112 = bitcast double* %111 to <2 x i64>*
  store <2 x i64> %wide.load177.1, <2 x i64>* %112, align 8, !alias.scope !16, !noalias !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load178.1, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %index.next170.1 = add nuw nsw i64 %index169, 8
  %115 = icmp eq i64 %index.next170.1, 2000
  br i1 %115, label %middle.block153.loopexit180, label %vector.body152, !llvm.loop !18

scalar.ph154:                                     ; preds = %scalar.ph154, %scalar.ph154.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph154.preheader ], [ %indvars.iv.next.4, %scalar.ph154 ]
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv104, i64 %indvars.iv
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.next
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block153.loopexit, label %scalar.ph154, !llvm.loop !19

middle.block153.loopexit:                         ; preds = %scalar.ph154
  br label %middle.block153

middle.block153.loopexit180:                      ; preds = %vector.body152
  br label %middle.block153

middle.block153:                                  ; preds = %middle.block153.loopexit180, %middle.block153.loopexit
  %exitcond = icmp ne i64 %96, 2000
  br i1 %exitcond, label %.preheader, label %141

; <label>:141:                                    ; preds = %middle.block153
  call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader94

.preheader94:                                     ; preds = %._crit_edge125, %5
  %indvars.iv217 = phi i64 [ %indvars.iv.next218, %._crit_edge125 ], [ 0, %5 ]
  %indvars.iv171 = phi i32 [ %indvars.iv.next172, %._crit_edge125 ], [ -1, %5 ]
  %6 = add nuw nsw i64 %indvars.iv217, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub nuw nsw i64 2000, %indvars.iv217
  %9 = add nsw i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub nuw nsw i64 2000, %indvars.iv217
  %12 = icmp sgt i64 %indvars.iv217, 0
  br i1 %12, label %.lr.ph115.preheader, label %.lr.ph124.split.preheader

.lr.ph115.preheader:                              ; preds = %.preheader94
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 0
  br label %.lr.ph115

.lr.ph124.split.preheader:                        ; preds = %.lr.ph124..lr.ph124.split.preheader_crit_edge, %.preheader94
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph124.split.preheader190, label %min.iters.checked

.lr.ph124.split.preheader190:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph124.split.preheader
  %indvars.iv162.ph = phi i64 [ %indvars.iv217, %min.iters.checked ], [ %indvars.iv217, %.lr.ph124.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph124.split

min.iters.checked:                                ; preds = %.lr.ph124.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv217, %n.vec
  br i1 %cmp.zero, label %.lr.ph124.split.preheader190, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod204 = icmp eq i64 %14, 0
  br i1 %lcmp.mod204, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 %indvars.iv217
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load189.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load189.prol, <2 x i64>* %18, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %10, 0
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %20 = add i64 %indvars.iv217, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load189 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load189, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv217, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load189.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load189.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge125, label %.lr.ph124.split.preheader190

.lr.ph124:                                        ; preds = %._crit_edge112
  br i1 true, label %.lr.ph124..lr.ph124.split.us_crit_edge, label %.lr.ph124..lr.ph124.split.preheader_crit_edge

.lr.ph124..lr.ph124.split.preheader_crit_edge:    ; preds = %.lr.ph124
  br label %.lr.ph124.split.preheader

.lr.ph124..lr.ph124.split.us_crit_edge:           ; preds = %.lr.ph124
  %wide.trip.count173 = zext i32 %indvars.iv171 to i64
  %31 = and i64 %6, 1
  %lcmp.mod206 = icmp eq i64 %31, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 0
  %33 = icmp eq i64 %7, 0
  br label %.lr.ph124.split.us

.lr.ph124.split.us:                               ; preds = %._crit_edge120.us, %.lr.ph124..lr.ph124.split.us_crit_edge
  %indvars.iv177 = phi i64 [ %indvars.iv217, %.lr.ph124..lr.ph124.split.us_crit_edge ], [ %indvars.iv.next178, %._crit_edge120.us ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 %indvars.iv177
  %35 = load double, double* %34, align 8
  br i1 %lcmp.mod206, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph124.split.us
  br label %36

; <label>:36:                                     ; preds = %.prol.preheader
  %37 = load double, double* %32, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv177
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph124.split.us, %36
  %.lcssa197.unr.ph = phi double [ %41, %36 ], [ undef, %.lr.ph124.split.us ]
  %indvars.iv166.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph124.split.us ]
  %.1117.us.unr.ph = phi double [ %41, %36 ], [ %35, %.lr.ph124.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %33, label %._crit_edge120.us, label %.lr.ph124.split.us.new

.lr.ph124.split.us.new:                           ; preds = %.prol.loopexit
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph124.split.us.new
  %indvars.iv166 = phi i64 [ %indvars.iv166.unr.ph, %.lr.ph124.split.us.new ], [ %indvars.iv.next167.1, %42 ]
  %.1117.us = phi double [ %.1117.us.unr.ph, %.lr.ph124.split.us.new ], [ %56, %42 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 %indvars.iv166
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv166, i64 %indvars.iv177
  %46 = load double, double* %45, align 8
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next167, i64 %indvars.iv177
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %.1117.us, %53
  %56 = fsub double %55, %54
  %exitcond174.1 = icmp eq i64 %indvars.iv.next167, %wide.trip.count173
  %indvars.iv.next167.1 = add nsw i64 %indvars.iv166, 2
  br i1 %exitcond174.1, label %._crit_edge120.us.unr-lcssa, label %42

._crit_edge120.us.unr-lcssa:                      ; preds = %42
  br label %._crit_edge120.us

._crit_edge120.us:                                ; preds = %.prol.loopexit, %._crit_edge120.us.unr-lcssa
  %.lcssa197 = phi double [ %.lcssa197.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge120.us.unr-lcssa ]
  store double %.lcssa197, double* %34, align 8
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond220 = icmp ne i64 %indvars.iv.next178, 2000
  br i1 %exitcond220, label %.lr.ph124.split.us, label %._crit_edge125.loopexit

.lr.ph115:                                        ; preds = %.lr.ph115.preheader, %._crit_edge112
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge112 ], [ 0, %.lr.ph115.preheader ]
  %indvars.iv154 = phi i32 [ %indvars.iv.next155, %._crit_edge112 ], [ -1, %.lr.ph115.preheader ]
  %57 = add nuw nsw i64 %indvars.iv158, 4294967295
  %58 = and i64 %57, 4294967295
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 %indvars.iv158
  %60 = load double, double* %59, align 8
  %61 = icmp sgt i64 %indvars.iv158, 0
  br i1 %61, label %.lr.ph115..lr.ph111_crit_edge, label %._crit_edge112

.lr.ph115..lr.ph111_crit_edge:                    ; preds = %.lr.ph115
  %wide.trip.count156 = zext i32 %indvars.iv154 to i64
  %62 = and i64 %57, 1
  %lcmp.mod202 = icmp eq i64 %62, 0
  br i1 %lcmp.mod202, label %.lr.ph111.prol.preheader, label %.lr.ph111.prol.loopexit.unr-lcssa

.lr.ph111.prol.preheader:                         ; preds = %.lr.ph115..lr.ph111_crit_edge
  br label %.lr.ph111.prol

.lr.ph111.prol:                                   ; preds = %.lr.ph111.prol.preheader
  %63 = load double, double* %13, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv158
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %60, %66
  br label %.lr.ph111.prol.loopexit.unr-lcssa

.lr.ph111.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph115..lr.ph111_crit_edge, %.lr.ph111.prol
  %.lcssa196.unr.ph = phi double [ %67, %.lr.ph111.prol ], [ undef, %.lr.ph115..lr.ph111_crit_edge ]
  %indvars.iv149.unr.ph = phi i64 [ 1, %.lr.ph111.prol ], [ 0, %.lr.ph115..lr.ph111_crit_edge ]
  %.0109.unr.ph = phi double [ %67, %.lr.ph111.prol ], [ %60, %.lr.ph115..lr.ph111_crit_edge ]
  br label %.lr.ph111.prol.loopexit

.lr.ph111.prol.loopexit:                          ; preds = %.lr.ph111.prol.loopexit.unr-lcssa
  %68 = icmp eq i64 %58, 0
  br i1 %68, label %._crit_edge112.loopexit, label %.lr.ph115..lr.ph111_crit_edge.new

.lr.ph115..lr.ph111_crit_edge.new:                ; preds = %.lr.ph111.prol.loopexit
  br label %.lr.ph111

.lr.ph111:                                        ; preds = %.lr.ph111, %.lr.ph115..lr.ph111_crit_edge.new
  %indvars.iv149 = phi i64 [ %indvars.iv149.unr.ph, %.lr.ph115..lr.ph111_crit_edge.new ], [ %indvars.iv.next150.1, %.lr.ph111 ]
  %.0109 = phi double [ %.0109.unr.ph, %.lr.ph115..lr.ph111_crit_edge.new ], [ %82, %.lr.ph111 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv217, i64 %indvars.iv149
  %70 = bitcast double* %69 to <2 x double>*
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv158
  %72 = load double, double* %71, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %73 = load <2 x double>, <2 x double>* %70, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next150, i64 %indvars.iv158
  %75 = load double, double* %74, align 8
  %76 = insertelement <2 x double> undef, double %72, i32 0
  %77 = insertelement <2 x double> %76, double %75, i32 1
  %78 = fmul <2 x double> %73, %77
  %79 = extractelement <2 x double> %78, i32 0
  %80 = extractelement <2 x double> %78, i32 1
  %81 = fsub double %.0109, %79
  %82 = fsub double %81, %80
  %exitcond157.1 = icmp eq i64 %indvars.iv.next150, %wide.trip.count156
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, 2
  br i1 %exitcond157.1, label %._crit_edge112.loopexit.unr-lcssa, label %.lr.ph111

._crit_edge112.loopexit.unr-lcssa:                ; preds = %.lr.ph111
  br label %._crit_edge112.loopexit

._crit_edge112.loopexit:                          ; preds = %.lr.ph111.prol.loopexit, %._crit_edge112.loopexit.unr-lcssa
  %.lcssa196 = phi double [ %.lcssa196.unr.ph, %.lr.ph111.prol.loopexit ], [ %82, %._crit_edge112.loopexit.unr-lcssa ]
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge112.loopexit, %.lr.ph115
  %.0.lcssa = phi double [ %60, %.lr.ph115 ], [ %.lcssa196, %._crit_edge112.loopexit ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv158, i64 %indvars.iv158
  %84 = load double, double* %83, align 8
  %85 = fdiv double %.0.lcssa, %84
  store double %85, double* %59, align 8
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %indvars.iv.next155 = add nsw i32 %indvars.iv154, 1
  %exitcond219 = icmp ne i64 %indvars.iv.next159, %indvars.iv217
  br i1 %exitcond219, label %.lr.ph115, label %.lr.ph124

.lr.ph124.split:                                  ; preds = %.lr.ph124.split.preheader190, %.lr.ph124.split
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %.lr.ph124.split ], [ %indvars.iv162.ph, %.lr.ph124.split.preheader190 ]
  %exitcond164 = icmp eq i64 %indvars.iv162, 1999
  %indvars.iv.next163 = add nuw i64 %indvars.iv162, 1
  br i1 %exitcond164, label %._crit_edge125.loopexit191, label %.lr.ph124.split, !llvm.loop !21

._crit_edge125.loopexit:                          ; preds = %._crit_edge120.us
  br label %._crit_edge125

._crit_edge125.loopexit191:                       ; preds = %.lr.ph124.split
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit191, %._crit_edge125.loopexit, %middle.block
  %indvars.iv.next218 = add nuw nsw i64 %indvars.iv217, 1
  %indvars.iv.next172 = add nsw i32 %indvars.iv171, 1
  %exitcond221 = icmp ne i64 %indvars.iv.next218, 2000
  br i1 %exitcond221, label %.preheader94, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge125
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge104
  %indvars.iv = phi i2 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge104 ]
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge104 ], [ 0, %.preheader.preheader ]
  %indvars.iv143 = phi i32 [ %indvars.iv.next144, %._crit_edge104 ], [ -1, %.preheader.preheader ]
  %86 = zext i2 %indvars.iv to i64
  %87 = add nuw nsw i64 %indvars.iv147, 4294967295
  %88 = and i64 %87, 4294967295
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv147
  %90 = load double, double* %89, align 8
  %91 = icmp sgt i64 %indvars.iv147, 0
  br i1 %91, label %.preheader..lr.ph103_crit_edge, label %._crit_edge104

.preheader..lr.ph103_crit_edge:                   ; preds = %.preheader
  %wide.trip.count145 = zext i32 %indvars.iv143 to i64
  %xtraiter198 = and i64 %indvars.iv147, 3
  %lcmp.mod199 = icmp eq i64 %xtraiter198, 0
  br i1 %lcmp.mod199, label %.lr.ph103.prol.loopexit, label %.lr.ph103.prol.preheader

.lr.ph103.prol.preheader:                         ; preds = %.preheader..lr.ph103_crit_edge
  br label %.lr.ph103.prol

.lr.ph103.prol:                                   ; preds = %.lr.ph103.prol, %.lr.ph103.prol.preheader
  %indvars.iv138.prol = phi i64 [ %indvars.iv.next139.prol, %.lr.ph103.prol ], [ 0, %.lr.ph103.prol.preheader ]
  %.2101.prol = phi double [ %97, %.lr.ph103.prol ], [ %90, %.lr.ph103.prol.preheader ]
  %prol.iter200 = phi i64 [ %prol.iter200.sub, %.lr.ph103.prol ], [ %xtraiter198, %.lr.ph103.prol.preheader ]
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv138.prol
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds double, double* %4, i64 %indvars.iv138.prol
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fsub double %.2101.prol, %96
  %indvars.iv.next139.prol = add nuw nsw i64 %indvars.iv138.prol, 1
  %prol.iter200.sub = add nsw i64 %prol.iter200, -1
  %prol.iter200.cmp = icmp eq i64 %prol.iter200.sub, 0
  br i1 %prol.iter200.cmp, label %.lr.ph103.prol.loopexit.unr-lcssa, label %.lr.ph103.prol, !llvm.loop !23

.lr.ph103.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph103.prol
  br label %.lr.ph103.prol.loopexit

.lr.ph103.prol.loopexit:                          ; preds = %.preheader..lr.ph103_crit_edge, %.lr.ph103.prol.loopexit.unr-lcssa
  %.lcssa195.unr = phi double [ undef, %.preheader..lr.ph103_crit_edge ], [ %97, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %indvars.iv138.unr = phi i64 [ 0, %.preheader..lr.ph103_crit_edge ], [ %86, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %.2101.unr = phi double [ %90, %.preheader..lr.ph103_crit_edge ], [ %97, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %98 = icmp ult i64 %88, 3
  br i1 %98, label %._crit_edge104.loopexit, label %.preheader..lr.ph103_crit_edge.new

.preheader..lr.ph103_crit_edge.new:               ; preds = %.lr.ph103.prol.loopexit
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %.lr.ph103, %.preheader..lr.ph103_crit_edge.new
  %indvars.iv138 = phi i64 [ %indvars.iv138.unr, %.preheader..lr.ph103_crit_edge.new ], [ %indvars.iv.next139.3, %.lr.ph103 ]
  %.2101 = phi double [ %.2101.unr, %.preheader..lr.ph103_crit_edge.new ], [ %120, %.lr.ph103 ]
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv138
  %100 = bitcast double* %99 to <2 x double>*
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %102 = bitcast double* %101 to <2 x double>*
  %103 = load <2 x double>, <2 x double>* %100, align 8
  %104 = load <2 x double>, <2 x double>* %102, align 8
  %105 = fmul <2 x double> %103, %104
  %106 = extractelement <2 x double> %105, i32 0
  %107 = extractelement <2 x double> %105, i32 1
  %108 = fsub double %.2101, %106
  %109 = fsub double %108, %107
  %indvars.iv.next139.1 = add nsw i64 %indvars.iv138, 2
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next139.1
  %111 = bitcast double* %110 to <2 x double>*
  %112 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next139.1
  %113 = bitcast double* %112 to <2 x double>*
  %indvars.iv.next139.2 = add nsw i64 %indvars.iv138, 3
  %114 = load <2 x double>, <2 x double>* %111, align 8
  %115 = load <2 x double>, <2 x double>* %113, align 8
  %116 = fmul <2 x double> %114, %115
  %117 = extractelement <2 x double> %116, i32 0
  %118 = extractelement <2 x double> %116, i32 1
  %119 = fsub double %109, %117
  %120 = fsub double %119, %118
  %exitcond146.3 = icmp eq i64 %indvars.iv.next139.2, %wide.trip.count145
  %indvars.iv.next139.3 = add nsw i64 %indvars.iv138, 4
  br i1 %exitcond146.3, label %._crit_edge104.loopexit.unr-lcssa, label %.lr.ph103

._crit_edge104.loopexit.unr-lcssa:                ; preds = %.lr.ph103
  br label %._crit_edge104.loopexit

._crit_edge104.loopexit:                          ; preds = %.lr.ph103.prol.loopexit, %._crit_edge104.loopexit.unr-lcssa
  %.lcssa195 = phi double [ %.lcssa195.unr, %.lr.ph103.prol.loopexit ], [ %120, %._crit_edge104.loopexit.unr-lcssa ]
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit, %.preheader
  %.2.lcssa = phi double [ %90, %.preheader ], [ %.lcssa195, %._crit_edge104.loopexit ]
  %121 = getelementptr inbounds double, double* %4, i64 %indvars.iv147
  store double %.2.lcssa, double* %121, align 8
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %indvars.iv.next144 = add nsw i32 %indvars.iv143, 1
  %indvars.iv.next = add i2 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next148, 2000
  br i1 %exitcond, label %.preheader, label %._crit_edge104._crit_edge.preheader

._crit_edge104._crit_edge.preheader:              ; preds = %._crit_edge104
  br label %._crit_edge104._crit_edge

._crit_edge104._crit_edge:                        ; preds = %._crit_edge104._crit_edge.preheader, %._crit_edge._crit_edge
  %indvars.iv215 = phi i2 [ 0, %._crit_edge104._crit_edge.preheader ], [ %indvars.iv.next216, %._crit_edge._crit_edge ]
  %indvars.iv213 = phi i32 [ 2000, %._crit_edge104._crit_edge.preheader ], [ %indvars.iv.next214, %._crit_edge._crit_edge ]
  %indvar = phi i32 [ 0, %._crit_edge104._crit_edge.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv136 = phi i64 [ 1999, %._crit_edge104._crit_edge.preheader ], [ %indvars.iv.next137, %._crit_edge._crit_edge ]
  %122 = sext i32 %indvars.iv213 to i64
  %123 = zext i2 %indvars.iv215 to i64
  %124 = add i64 %122, %123
  %125 = sub i32 2000, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 1999, %126
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv136
  %129 = load double, double* %128, align 8
  %130 = add nsw i64 %indvars.iv136, 1
  %131 = icmp slt i64 %130, 2000
  br i1 %131, label %..lr.ph_crit_edge, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %._crit_edge104._crit_edge
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv136
  %133 = load double, double* %132, align 8
  %134 = fdiv double %129, %133
  %135 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  store double %134, double* %135, align 8
  br label %._crit_edge._crit_edge

..lr.ph_crit_edge:                                ; preds = %._crit_edge104._crit_edge
  %136 = sext i32 %indvars.iv213 to i64
  %137 = sub nsw i64 0, %126
  %xtraiter = and i64 %137, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv134.prol = phi i64 [ %indvars.iv.next135.prol, %.lr.ph.prol ], [ %136, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %143, %.lr.ph.prol ], [ %129, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv134.prol
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds double, double* %3, i64 %indvars.iv134.prol
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fsub double %.397.prol, %142
  %indvars.iv.next135.prol = add nsw i64 %indvars.iv134.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %..lr.ph_crit_edge ], [ %143, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv134.unr = phi i64 [ %136, %..lr.ph_crit_edge ], [ %124, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.397.unr = phi double [ %129, %..lr.ph_crit_edge ], [ %143, %.lr.ph.prol.loopexit.unr-lcssa ]
  %144 = icmp ult i64 %127, 3
  br i1 %144, label %._crit_edge, label %..lr.ph_crit_edge.new

..lr.ph_crit_edge.new:                            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %..lr.ph_crit_edge.new
  %indvars.iv134 = phi i64 [ %indvars.iv134.unr, %..lr.ph_crit_edge.new ], [ %indvars.iv.next135.3, %.lr.ph ]
  %.397 = phi double [ %.397.unr, %..lr.ph_crit_edge.new ], [ %166, %.lr.ph ]
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv134
  %146 = bitcast double* %145 to <2 x double>*
  %147 = getelementptr inbounds double, double* %3, i64 %indvars.iv134
  %148 = bitcast double* %147 to <2 x double>*
  %149 = load <2 x double>, <2 x double>* %146, align 8
  %150 = load <2 x double>, <2 x double>* %148, align 8
  %151 = fmul <2 x double> %149, %150
  %152 = extractelement <2 x double> %151, i32 0
  %153 = extractelement <2 x double> %151, i32 1
  %154 = fsub double %.397, %152
  %155 = fsub double %154, %153
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv.next135.1
  %157 = bitcast double* %156 to <2 x double>*
  %158 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next135.1
  %159 = bitcast double* %158 to <2 x double>*
  %indvars.iv.next135.2 = add nsw i64 %indvars.iv134, 3
  %160 = load <2 x double>, <2 x double>* %157, align 8
  %161 = load <2 x double>, <2 x double>* %159, align 8
  %162 = fmul <2 x double> %160, %161
  %163 = extractelement <2 x double> %162, i32 0
  %164 = extractelement <2 x double> %162, i32 1
  %165 = fsub double %155, %163
  %166 = fsub double %165, %164
  %exitcond.3 = icmp eq i64 %indvars.iv.next135.2, 1999
  %indvars.iv.next135.3 = add nsw i64 %indvars.iv134, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %.lr.ph

._crit_edge.unr-lcssa:                            ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %166, %._crit_edge.unr-lcssa ]
  %167 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv136
  %168 = load double, double* %167, align 8
  %169 = fdiv double %.lcssa, %168
  %170 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  store double %169, double* %170, align 8
  %171 = icmp sgt i64 %indvars.iv136, 0
  br i1 %171, label %._crit_edge._crit_edge, label %172

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv.next137 = add i64 %indvars.iv136, -1
  %indvars.iv.next214 = add i32 %indvars.iv213, -1
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next216 = add i2 %indvars.iv215, 1
  br label %._crit_edge104._crit_edge

; <label>:172:                                    ; preds = %._crit_edge
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
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge6, label %16

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !24}
