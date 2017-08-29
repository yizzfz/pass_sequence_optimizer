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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
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
  tail call fastcc void @print_array(i32 2000, double* %9)
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
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100, %5
  %indvars.iv140 = phi i64 [ 0, %5 ], [ %indvars.iv.next141.1, %._crit_edge100 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv140
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next141 = or i64 %indvars.iv140, 1
  %10 = trunc i64 %indvars.iv.next141 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv140
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %13 = trunc i64 %indvars.iv.next141.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond142.1 = icmp eq i64 %indvars.iv.next141, 1999
  br i1 %exitcond142.1, label %.lr.ph.preheader, label %._crit_edge100

.lr.ph.preheader:                                 ; preds = %._crit_edge100
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge97..preheader84_crit_edge
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %._crit_edge97..preheader84_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv138, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %22
  %23 = sub i64 1998, %indvars.iv138
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  br label %27

.preheader83:                                     ; preds = %27
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %26 = icmp slt i64 %indvars.iv.next139, 2000
  br i1 %26, label %._crit_edge97..preheader84_crit_edge, label %37

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %27 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv121
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv121
  store double %33, double* %34, align 8
  %exitcond129 = icmp eq i64 %indvars.iv121, %indvars.iv138
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  br i1 %exitcond129, label %.preheader83, label %27

._crit_edge97..preheader84_crit_edge:             ; preds = %.preheader83
  %35 = add nuw nsw i64 %25, 8
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep136137, i8 0, i64 %35, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %.preheader83
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader82_crit_edge

..preheader82_crit_edge:                          ; preds = %..preheader82_crit_edge, %37
  %indvars.iv119 = phi i64 [ 0, %37 ], [ %indvars.iv.next120.7, %..preheader82_crit_edge ]
  %40 = mul nuw nsw i64 %indvars.iv119, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120 = or i64 %indvars.iv119, 1
  %41 = mul nuw nsw i64 %indvars.iv.next120, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.1 = or i64 %indvars.iv119, 2
  %42 = mul nuw nsw i64 %indvars.iv.next120.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.2 = or i64 %indvars.iv119, 3
  %43 = mul nuw nsw i64 %indvars.iv.next120.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.3 = or i64 %indvars.iv119, 4
  %44 = mul nuw nsw i64 %indvars.iv.next120.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.4 = or i64 %indvars.iv119, 5
  %45 = mul nuw nsw i64 %indvars.iv.next120.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.5 = or i64 %indvars.iv119, 6
  %46 = mul nuw nsw i64 %indvars.iv.next120.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.6 = or i64 %indvars.iv119, 7
  %47 = mul nuw nsw i64 %indvars.iv.next120.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.7 = add nsw i64 %indvars.iv119, 8
  %exitcond187.7 = icmp eq i64 %indvars.iv.next120.7, 2000
  br i1 %exitcond187.7, label %.._crit_edge.preheader_crit_edge, label %..preheader82_crit_edge

.._crit_edge.preheader_crit_edge:                 ; preds = %..preheader82_crit_edge
  %48 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %94, %.._crit_edge.preheader_crit_edge
  %indvars.iv114 = phi i64 [ 0, %.._crit_edge.preheader_crit_edge ], [ %49, %94 ]
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %scevgep145146 = bitcast double* %scevgep145 to i8*
  %49 = add nuw nsw i64 %indvars.iv114, 1
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %49
  %scevgep147148 = bitcast double* %scevgep147 to i8*
  br label %.preheader80

.preheader80:                                     ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv112 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next113, %._crit_edge ]
  %50 = mul nuw nsw i64 %indvars.iv112, 16000
  %scevgep143 = getelementptr i8, i8* %39, i64 %50
  %51 = add nuw nsw i64 %50, 16000
  %scevgep144 = getelementptr i8, i8* %39, i64 %51
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv114
  %bound0 = icmp ult i8* %scevgep143, %scevgep147148
  %bound1 = icmp ult i8* %scevgep145146, %scevgep144
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %52 to i8*
  %bound0150 = icmp ult i8* %scevgep143, %bc
  %bound1151 = icmp ult i8* %bc, %scevgep144
  %found.conflict152 = and i1 %bound0150, %bound1151
  %conflict.rdx = or i1 %found.conflict, %found.conflict152
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader80
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader80
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %53 = or i64 %index, 1
  %54 = or i64 %index, 2
  %55 = or i64 %index, 3
  %56 = load double, double* %52, align 8, !alias.scope !1
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv114
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %53, i64 %indvars.iv114
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv114
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv114
  %63 = load double, double* %59, align 8, !alias.scope !4
  %64 = load double, double* %60, align 8, !alias.scope !4
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = insertelement <2 x double> undef, double %63, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = fmul <2 x double> %58, %68
  %72 = fmul <2 x double> %58, %70
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv112, i64 %index
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load154 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = fadd <2 x double> %wide.load, %71
  %78 = fadd <2 x double> %wide.load154, %72
  store <2 x double> %77, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %78, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %79 = icmp eq i64 %index.next, 2000
  br i1 %79, label %._crit_edge.loopexit183, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv109 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next110.1, %scalar.ph ]
  %80 = load double, double* %52, align 8
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv114
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv112, i64 %indvars.iv109
  %85 = load double, double* %84, align 8
  %86 = fadd double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next110 = or i64 %indvars.iv109, 1
  %87 = load double, double* %52, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next110, i64 %indvars.iv114
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next110
  %92 = load double, double* %91, align 8
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8
  %exitcond111.1 = icmp eq i64 %indvars.iv.next110, 1999
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  br i1 %exitcond111.1, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge.loopexit183:                          ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit183, %._crit_edge.loopexit
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond185 = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond185, label %94, label %.preheader80

; <label>:94:                                     ; preds = %._crit_edge
  %exitcond186 = icmp eq i64 %49, 2000
  br i1 %exitcond186, label %.preheader.preheader, label %._crit_edge.preheader

.preheader.preheader:                             ; preds = %94
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge1, %.preheader.preheader
  %indvars.iv107 = phi i64 [ %95, %._crit_edge1 ], [ 0, %.preheader.preheader ]
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 0
  %scevgep160161 = bitcast double* %scevgep160 to i8*
  %95 = add nuw nsw i64 %indvars.iv107, 1
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %1, i64 %95, i64 0
  %scevgep162163 = bitcast double* %scevgep162 to i8*
  %96 = mul nuw nsw i64 %indvars.iv107, 16000
  %scevgep164 = getelementptr i8, i8* %39, i64 %96
  %97 = add nuw nsw i64 %96, 16000
  %scevgep165 = getelementptr i8, i8* %39, i64 %97
  %bound0166 = icmp ult i8* %scevgep160161, %scevgep165
  %bound1167 = icmp ult i8* %scevgep164, %scevgep162163
  %memcheck.conflict169 = and i1 %bound0166, %bound1167
  br i1 %memcheck.conflict169, label %scalar.ph157.preheader, label %vector.body155.preheader

vector.body155.preheader:                         ; preds = %.preheader
  br label %vector.body155

scalar.ph157.preheader:                           ; preds = %.preheader
  br label %scalar.ph157

vector.body155:                                   ; preds = %vector.body155, %vector.body155.preheader
  %index172 = phi i64 [ 0, %vector.body155.preheader ], [ %index.next173.1, %vector.body155 ]
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %index172
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load180 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load181 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %index172
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load180, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load181, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %index.next173 = or i64 %index172, 4
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %index.next173
  %107 = bitcast double* %106 to <2 x i64>*
  %wide.load180.1 = load <2 x i64>, <2 x i64>* %107, align 8, !alias.scope !13
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load181.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !13
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %index.next173
  %111 = bitcast double* %110 to <2 x i64>*
  store <2 x i64> %wide.load180.1, <2 x i64>* %111, align 8, !alias.scope !16, !noalias !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load181.1, <2 x i64>* %113, align 8, !alias.scope !16, !noalias !13
  %index.next173.1 = add nsw i64 %index172, 8
  %114 = icmp eq i64 %index.next173.1, 2000
  br i1 %114, label %._crit_edge1.loopexit182, label %vector.body155, !llvm.loop !18

scalar.ph157:                                     ; preds = %scalar.ph157, %scalar.ph157.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph157.preheader ], [ %indvars.iv.next.4, %scalar.ph157 ]
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %indvars.iv
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next.1
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %131 = bitcast double* %130 to i64*
  %132 = load i64, i64* %131, align 8
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next.2
  %134 = bitcast double* %133 to i64*
  store i64 %132, i64* %134, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %135 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %136 = bitcast double* %135 to i64*
  %137 = load i64, i64* %136, align 8
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv.next.3
  %139 = bitcast double* %138 to i64*
  store i64 %137, i64* %139, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge1.loopexit, label %scalar.ph157, !llvm.loop !19

._crit_edge1.loopexit:                            ; preds = %scalar.ph157
  br label %._crit_edge1

._crit_edge1.loopexit182:                         ; preds = %vector.body155
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit182, %._crit_edge1.loopexit
  %exitcond184 = icmp eq i64 %95, 2000
  br i1 %exitcond184, label %140, label %.preheader

; <label>:140:                                    ; preds = %._crit_edge1
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge128, %5
  %indvars.iv199 = phi i64 [ %indvars.iv.next200, %._crit_edge128 ], [ 0, %5 ]
  %indvars.iv173 = phi i32 [ %indvars.iv.next174, %._crit_edge128 ], [ -1, %5 ]
  %6 = add i64 %indvars.iv199, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv199
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub nuw nsw i64 2000, %indvars.iv199
  %12 = icmp sgt i64 %indvars.iv199, 0
  br i1 %12, label %.lr.ph118.preheader, label %.lr.ph127.split.preheader

.lr.ph118.preheader:                              ; preds = %.preheader95
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 0
  br label %.lr.ph118

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127..lr.ph127.split.preheader_crit_edge, %.preheader95
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader193, label %min.iters.checked

.lr.ph127.split.preheader193:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader
  %indvars.iv164.ph = phi i64 [ %indvars.iv199, %min.iters.checked ], [ %indvars.iv199, %.lr.ph127.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv199, %n.vec
  br i1 %cmp.zero, label %.lr.ph127.split.preheader193, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod213 = icmp eq i64 %14, 0
  br i1 %lcmp.mod213, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 %indvars.iv199
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load192.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load192.prol, <2 x i64>* %18, align 8
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
  %20 = add i64 %indvars.iv199, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load192, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv199, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load192.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load192.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge128, label %.lr.ph127.split.preheader193

.lr.ph127:                                        ; preds = %._crit_edge115
  br i1 true, label %.lr.ph127.split.us.preheader, label %.lr.ph127..lr.ph127.split.preheader_crit_edge

.lr.ph127..lr.ph127.split.preheader_crit_edge:    ; preds = %.lr.ph127
  br label %.lr.ph127.split.preheader

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %wide.trip.count175 = zext i32 %indvars.iv173 to i64
  %31 = and i64 %6, 1
  %lcmp.mod215 = icmp eq i64 %31, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 0
  %33 = icmp eq i64 %7, 0
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %._crit_edge123.us, %.lr.ph127.split.us.preheader
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge123.us ], [ %indvars.iv199, %.lr.ph127.split.us.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 %indvars.iv179
  %35 = load double, double* %34, align 8
  br i1 %lcmp.mod215, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph127.split.us
  br label %36

; <label>:36:                                     ; preds = %.prol.preheader
  %37 = load double, double* %32, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv179
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph127.split.us, %36
  %.lcssa206.unr.ph = phi double [ %41, %36 ], [ undef, %.lr.ph127.split.us ]
  %indvars.iv168.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph127.split.us ]
  %.1120.us.unr.ph = phi double [ %41, %36 ], [ %35, %.lr.ph127.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %33, label %._crit_edge123.us, label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.prol.loopexit
  br label %42

; <label>:42:                                     ; preds = %42, %.lr.ph127.split.us.new
  %indvars.iv168 = phi i64 [ %indvars.iv168.unr.ph, %.lr.ph127.split.us.new ], [ %indvars.iv.next169.1, %42 ]
  %.1120.us = phi double [ %.1120.us.unr.ph, %.lr.ph127.split.us.new ], [ %56, %42 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 %indvars.iv168
  %44 = bitcast double* %43 to <2 x double>*
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv168, i64 %indvars.iv179
  %46 = load double, double* %45, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %47 = load <2 x double>, <2 x double>* %44, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next169, i64 %indvars.iv179
  %49 = load double, double* %48, align 8
  %50 = insertelement <2 x double> undef, double %46, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %47, %51
  %53 = extractelement <2 x double> %52, i32 0
  %54 = extractelement <2 x double> %52, i32 1
  %55 = fsub double %.1120.us, %53
  %56 = fsub double %55, %54
  %exitcond176.1 = icmp eq i64 %indvars.iv.next169, %wide.trip.count175
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  br i1 %exitcond176.1, label %._crit_edge123.us.unr-lcssa, label %42

._crit_edge123.us.unr-lcssa:                      ; preds = %42
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %.prol.loopexit, %._crit_edge123.us.unr-lcssa
  %.lcssa206 = phi double [ %.lcssa206.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge123.us.unr-lcssa ]
  store double %.lcssa206, double* %34, align 8
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond202 = icmp eq i64 %indvars.iv.next180, 2000
  br i1 %exitcond202, label %._crit_edge128.loopexit, label %.lr.ph127.split.us

.lr.ph118:                                        ; preds = %._crit_edge115, %.lr.ph118.preheader
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge115 ], [ 0, %.lr.ph118.preheader ]
  %indvars.iv156 = phi i32 [ %indvars.iv.next157, %._crit_edge115 ], [ -1, %.lr.ph118.preheader ]
  %57 = add i64 %indvars.iv160, 4294967295
  %58 = and i64 %57, 4294967295
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 %indvars.iv160
  %60 = load double, double* %59, align 8
  %61 = icmp sgt i64 %indvars.iv160, 0
  br i1 %61, label %.lr.ph114.preheader, label %._crit_edge115

.lr.ph114.preheader:                              ; preds = %.lr.ph118
  %wide.trip.count158 = zext i32 %indvars.iv156 to i64
  %62 = and i64 %57, 1
  %lcmp.mod211 = icmp eq i64 %62, 0
  br i1 %lcmp.mod211, label %.lr.ph114.prol.preheader, label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.preheader:                         ; preds = %.lr.ph114.preheader
  br label %.lr.ph114.prol

.lr.ph114.prol:                                   ; preds = %.lr.ph114.prol.preheader
  %63 = load double, double* %13, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv160
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fsub double %60, %66
  br label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph114.preheader, %.lr.ph114.prol
  %.lcssa205.unr.ph = phi double [ %67, %.lr.ph114.prol ], [ undef, %.lr.ph114.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph114.prol ], [ 0, %.lr.ph114.preheader ]
  %.0112.unr.ph = phi double [ %67, %.lr.ph114.prol ], [ %60, %.lr.ph114.preheader ]
  br label %.lr.ph114.prol.loopexit

.lr.ph114.prol.loopexit:                          ; preds = %.lr.ph114.prol.loopexit.unr-lcssa
  %68 = icmp eq i64 %58, 0
  br i1 %68, label %._crit_edge115.loopexit, label %.lr.ph114.preheader.new

.lr.ph114.preheader.new:                          ; preds = %.lr.ph114.prol.loopexit
  br label %.lr.ph114

.lr.ph114:                                        ; preds = %.lr.ph114, %.lr.ph114.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph114.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph114 ]
  %.0112 = phi double [ %.0112.unr.ph, %.lr.ph114.preheader.new ], [ %82, %.lr.ph114 ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv199, i64 %indvars.iv151
  %70 = bitcast double* %69 to <2 x double>*
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv160
  %72 = load double, double* %71, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %73 = load <2 x double>, <2 x double>* %70, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next152, i64 %indvars.iv160
  %75 = load double, double* %74, align 8
  %76 = insertelement <2 x double> undef, double %72, i32 0
  %77 = insertelement <2 x double> %76, double %75, i32 1
  %78 = fmul <2 x double> %73, %77
  %79 = extractelement <2 x double> %78, i32 0
  %80 = extractelement <2 x double> %78, i32 1
  %81 = fsub double %.0112, %79
  %82 = fsub double %81, %80
  %exitcond159.1 = icmp eq i64 %indvars.iv.next152, %wide.trip.count158
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond159.1, label %._crit_edge115.loopexit.unr-lcssa, label %.lr.ph114

._crit_edge115.loopexit.unr-lcssa:                ; preds = %.lr.ph114
  br label %._crit_edge115.loopexit

._crit_edge115.loopexit:                          ; preds = %.lr.ph114.prol.loopexit, %._crit_edge115.loopexit.unr-lcssa
  %.lcssa205 = phi double [ %.lcssa205.unr.ph, %.lr.ph114.prol.loopexit ], [ %82, %._crit_edge115.loopexit.unr-lcssa ]
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115.loopexit, %.lr.ph118
  %.0.lcssa = phi double [ %60, %.lr.ph118 ], [ %.lcssa205, %._crit_edge115.loopexit ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv160
  %84 = load double, double* %83, align 8
  %85 = fdiv double %.0.lcssa, %84
  store double %85, double* %59, align 8
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %indvars.iv.next157 = add nsw i32 %indvars.iv156, 1
  %exitcond201 = icmp eq i64 %indvars.iv.next161, %indvars.iv199
  br i1 %exitcond201, label %.lr.ph127, label %.lr.ph118

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader193, %.lr.ph127.split
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %.lr.ph127.split ], [ %indvars.iv164.ph, %.lr.ph127.split.preheader193 ]
  %exitcond166 = icmp eq i64 %indvars.iv164, 1999
  %indvars.iv.next165 = add nuw i64 %indvars.iv164, 1
  br i1 %exitcond166, label %._crit_edge128.loopexit194, label %.lr.ph127.split, !llvm.loop !21

._crit_edge128.loopexit:                          ; preds = %._crit_edge123.us
  br label %._crit_edge128

._crit_edge128.loopexit194:                       ; preds = %.lr.ph127.split
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128.loopexit194, %._crit_edge128.loopexit, %middle.block
  %indvars.iv.next200 = add nuw nsw i64 %indvars.iv199, 1
  %indvars.iv.next174 = add nsw i32 %indvars.iv173, 1
  %exitcond203 = icmp eq i64 %indvars.iv.next200, 2000
  br i1 %exitcond203, label %.preheader93.preheader, label %.preheader95

.preheader93.preheader:                           ; preds = %._crit_edge128
  br label %.preheader93

.preheader93:                                     ; preds = %._crit_edge107, %.preheader93.preheader
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge107 ], [ 0, %.preheader93.preheader ]
  %indvars.iv145 = phi i32 [ %indvars.iv.next146, %._crit_edge107 ], [ -1, %.preheader93.preheader ]
  %86 = add i64 %indvars.iv149, 4294967295
  %87 = and i64 %86, 4294967295
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv149
  %89 = load double, double* %88, align 8
  %90 = icmp sgt i64 %indvars.iv149, 0
  br i1 %90, label %.lr.ph106.preheader, label %._crit_edge107

.lr.ph106.preheader:                              ; preds = %.preheader93
  %wide.trip.count147 = zext i32 %indvars.iv145 to i64
  %xtraiter207 = and i64 %indvars.iv149, 3
  %lcmp.mod208 = icmp eq i64 %xtraiter207, 0
  br i1 %lcmp.mod208, label %.lr.ph106.prol.loopexit, label %.lr.ph106.prol.preheader

.lr.ph106.prol.preheader:                         ; preds = %.lr.ph106.preheader
  br label %.lr.ph106.prol

.lr.ph106.prol:                                   ; preds = %.lr.ph106.prol, %.lr.ph106.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph106.prol ], [ 0, %.lr.ph106.prol.preheader ]
  %.2104.prol = phi double [ %96, %.lr.ph106.prol ], [ %89, %.lr.ph106.prol.preheader ]
  %prol.iter209 = phi i64 [ %prol.iter209.sub, %.lr.ph106.prol ], [ %xtraiter207, %.lr.ph106.prol.preheader ]
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = fsub double %.2104.prol, %95
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter209.sub = add i64 %prol.iter209, -1
  %prol.iter209.cmp = icmp eq i64 %prol.iter209.sub, 0
  br i1 %prol.iter209.cmp, label %.lr.ph106.prol.loopexit.unr-lcssa, label %.lr.ph106.prol, !llvm.loop !23

.lr.ph106.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph106.prol
  br label %.lr.ph106.prol.loopexit

.lr.ph106.prol.loopexit:                          ; preds = %.lr.ph106.preheader, %.lr.ph106.prol.loopexit.unr-lcssa
  %.lcssa204.unr = phi double [ undef, %.lr.ph106.preheader ], [ %96, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph106.preheader ], [ %indvars.iv.next141.prol, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %.2104.unr = phi double [ %89, %.lr.ph106.preheader ], [ %96, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %97 = icmp ult i64 %87, 3
  br i1 %97, label %._crit_edge107.loopexit, label %.lr.ph106.preheader.new

.lr.ph106.preheader.new:                          ; preds = %.lr.ph106.prol.loopexit
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106, %.lr.ph106.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph106.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph106 ]
  %.2104 = phi double [ %.2104.unr, %.lr.ph106.preheader.new ], [ %119, %.lr.ph106 ]
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140
  %99 = bitcast double* %98 to <2 x double>*
  %100 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %101 = bitcast double* %100 to <2 x double>*
  %102 = load <2 x double>, <2 x double>* %99, align 8
  %103 = load <2 x double>, <2 x double>* %101, align 8
  %104 = fmul <2 x double> %102, %103
  %105 = extractelement <2 x double> %104, i32 0
  %106 = extractelement <2 x double> %104, i32 1
  %107 = fsub double %.2104, %105
  %108 = fsub double %107, %106
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %110 = bitcast double* %109 to <2 x double>*
  %111 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.1
  %112 = bitcast double* %111 to <2 x double>*
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %113 = load <2 x double>, <2 x double>* %110, align 8
  %114 = load <2 x double>, <2 x double>* %112, align 8
  %115 = fmul <2 x double> %113, %114
  %116 = extractelement <2 x double> %115, i32 0
  %117 = extractelement <2 x double> %115, i32 1
  %118 = fsub double %108, %116
  %119 = fsub double %118, %117
  %exitcond148.3 = icmp eq i64 %indvars.iv.next141.2, %wide.trip.count147
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond148.3, label %._crit_edge107.loopexit.unr-lcssa, label %.lr.ph106

._crit_edge107.loopexit.unr-lcssa:                ; preds = %.lr.ph106
  br label %._crit_edge107.loopexit

._crit_edge107.loopexit:                          ; preds = %.lr.ph106.prol.loopexit, %._crit_edge107.loopexit.unr-lcssa
  %.lcssa204 = phi double [ %.lcssa204.unr, %.lr.ph106.prol.loopexit ], [ %119, %._crit_edge107.loopexit.unr-lcssa ]
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %.preheader93
  %.2.lcssa = phi double [ %89, %.preheader93 ], [ %.lcssa204, %._crit_edge107.loopexit ]
  %120 = getelementptr inbounds double, double* %4, i64 %indvars.iv149
  store double %.2.lcssa, double* %120, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %indvars.iv.next146 = add nsw i32 %indvars.iv145, 1
  %exitcond198 = icmp eq i64 %indvars.iv.next150, 2000
  br i1 %exitcond198, label %.preheader.preheader, label %.preheader93

.preheader.preheader:                             ; preds = %._crit_edge107
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next139, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %121 = sub i32 2000, %indvar
  %122 = sext i32 %121 to i64
  %123 = sub nsw i64 1999, %122
  %124 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %125 = load double, double* %124, align 8
  %126 = icmp slt i32 %indvars.iv, 2000
  br i1 %126, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %127 = sext i32 %indvars.iv to i64
  %128 = sub nsw i64 0, %122
  %xtraiter = and i64 %128, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph.prol ], [ %127, %.lr.ph.prol.preheader ]
  %.399.prol = phi double [ %134, %.lr.ph.prol ], [ %125, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %130 = load double, double* %129, align 8
  %131 = getelementptr inbounds double, double* %3, i64 %indvars.iv136.prol
  %132 = load double, double* %131, align 8
  %133 = fmul double %130, %132
  %134 = fsub double %.399.prol, %133
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %134, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %127, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next137.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.399.unr = phi double [ %125, %.preheader..lr.ph_crit_edge ], [ %134, %.lr.ph.prol.loopexit.unr-lcssa ]
  %135 = icmp ult i64 %123, 3
  br i1 %135, label %._crit_edge.loopexit, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next137.3, %.lr.ph ]
  %.399 = phi double [ %.399.unr, %.preheader..lr.ph_crit_edge.new ], [ %157, %.lr.ph ]
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136
  %137 = bitcast double* %136 to <2 x double>*
  %138 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  %139 = bitcast double* %138 to <2 x double>*
  %140 = load <2 x double>, <2 x double>* %137, align 8
  %141 = load <2 x double>, <2 x double>* %139, align 8
  %142 = fmul <2 x double> %140, %141
  %143 = extractelement <2 x double> %142, i32 0
  %144 = extractelement <2 x double> %142, i32 1
  %145 = fsub double %.399, %143
  %146 = fsub double %145, %144
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %148 = bitcast double* %147 to <2 x double>*
  %149 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137.1
  %150 = bitcast double* %149 to <2 x double>*
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %151 = load <2 x double>, <2 x double>* %148, align 8
  %152 = load <2 x double>, <2 x double>* %150, align 8
  %153 = fmul <2 x double> %151, %152
  %154 = extractelement <2 x double> %153, i32 0
  %155 = extractelement <2 x double> %153, i32 1
  %156 = fsub double %146, %154
  %157 = fsub double %156, %155
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %157, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.3.lcssa = phi double [ %125, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %159 = load double, double* %158, align 8
  %160 = fdiv double %.3.lcssa, %159
  %161 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %160, double* %161, align 8
  %162 = icmp sgt i64 %indvars.iv138, 0
  br i1 %162, label %._crit_edge..preheader_crit_edge, label %163

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:163:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %._crit_edge._crit_edge

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
