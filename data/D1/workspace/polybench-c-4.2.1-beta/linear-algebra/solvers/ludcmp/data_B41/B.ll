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
  %39 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  %exitcond146.7 = icmp eq i64 %indvars.iv.next120.7, 2000
  br i1 %exitcond146.7, label %.._crit_edge.preheader_crit_edge, label %..preheader82_crit_edge

.._crit_edge.preheader_crit_edge:                 ; preds = %..preheader82_crit_edge
  %48 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %94, %.._crit_edge.preheader_crit_edge
  %indvars.iv114 = phi i64 [ 0, %.._crit_edge.preheader_crit_edge ], [ %49, %94 ]
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv114
  %scevgep150151 = bitcast double* %scevgep150 to i8*
  %49 = add i64 %indvars.iv114, 1
  %scevgep152 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %49
  %scevgep152153 = bitcast double* %scevgep152 to i8*
  br label %.preheader80

.preheader80:                                     ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv112 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next113, %._crit_edge ]
  %50 = mul i64 %indvars.iv112, 16000
  %scevgep148 = getelementptr i8, i8* %39, i64 %50
  %51 = add i64 %50, 16000
  %scevgep149 = getelementptr i8, i8* %39, i64 %51
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv114
  %bound0 = icmp ult i8* %scevgep148, %scevgep152153
  %bound1 = icmp ult i8* %scevgep150151, %scevgep149
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %52 to i8*
  %bound0155 = icmp ult i8* %scevgep148, %bc
  %bound1156 = icmp ult i8* %bc, %scevgep149
  %found.conflict157 = and i1 %bound0155, %bound1156
  %conflict.rdx = or i1 %found.conflict, %found.conflict157
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
  %wide.load159 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = fadd <2 x double> %wide.load, %71
  %78 = fadd <2 x double> %wide.load159, %72
  store <2 x double> %77, <2 x double>* %74, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %78, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %79 = icmp eq i64 %index.next, 2000
  br i1 %79, label %._crit_edge.loopexit188, label %vector.body, !llvm.loop !9

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

._crit_edge.loopexit188:                          ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit188, %._crit_edge.loopexit
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond144, label %94, label %.preheader80

; <label>:94:                                     ; preds = %._crit_edge
  %exitcond145 = icmp eq i64 %49, 2000
  br i1 %exitcond145, label %.preheader.preheader, label %._crit_edge.preheader

.preheader.preheader:                             ; preds = %94
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge1
  %indvars.iv107 = phi i64 [ %95, %._crit_edge1 ], [ 0, %.preheader.preheader ]
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 0
  %scevgep165166 = bitcast double* %scevgep165 to i8*
  %95 = add i64 %indvars.iv107, 1
  %scevgep167 = getelementptr [2000 x double], [2000 x double]* %1, i64 %95, i64 0
  %scevgep167168 = bitcast double* %scevgep167 to i8*
  %96 = mul i64 %indvars.iv107, 16000
  %scevgep169 = getelementptr i8, i8* %39, i64 %96
  %97 = add i64 %96, 16000
  %scevgep170 = getelementptr i8, i8* %39, i64 %97
  %bound0171 = icmp ult i8* %scevgep165166, %scevgep170
  %bound1172 = icmp ult i8* %scevgep169, %scevgep167168
  %memcheck.conflict174 = and i1 %bound0171, %bound1172
  br i1 %memcheck.conflict174, label %scalar.ph162.preheader, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %.preheader
  br label %vector.body160

scalar.ph162.preheader:                           ; preds = %.preheader
  br label %scalar.ph162

vector.body160:                                   ; preds = %vector.body160, %vector.body160.preheader
  %index177 = phi i64 [ 0, %vector.body160.preheader ], [ %index.next178.1, %vector.body160 ]
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %index177
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load185 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load186 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %index177
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load185, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load186, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %index.next178 = or i64 %index177, 4
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv107, i64 %index.next178
  %107 = bitcast double* %106 to <2 x i64>*
  %wide.load185.1 = load <2 x i64>, <2 x i64>* %107, align 8, !alias.scope !13
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load186.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !13
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %index.next178
  %111 = bitcast double* %110 to <2 x i64>*
  store <2 x i64> %wide.load185.1, <2 x i64>* %111, align 8, !alias.scope !16, !noalias !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load186.1, <2 x i64>* %113, align 8, !alias.scope !16, !noalias !13
  %index.next178.1 = add nsw i64 %index177, 8
  %114 = icmp eq i64 %index.next178.1, 2000
  br i1 %114, label %._crit_edge1.loopexit187, label %vector.body160, !llvm.loop !18

scalar.ph162:                                     ; preds = %scalar.ph162, %scalar.ph162.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph162.preheader ], [ %indvars.iv.next.4, %scalar.ph162 ]
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
  br i1 %exitcond.4, label %._crit_edge1.loopexit, label %scalar.ph162, !llvm.loop !19

._crit_edge1.loopexit:                            ; preds = %scalar.ph162
  br label %._crit_edge1

._crit_edge1.loopexit187:                         ; preds = %vector.body160
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit187, %._crit_edge1.loopexit
  %exitcond143 = icmp eq i64 %95, 2000
  br i1 %exitcond143, label %140, label %.preheader

; <label>:140:                                    ; preds = %._crit_edge1
  call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge128, %5
  %indvars.iv193 = phi i32 [ %indvars.iv.next194, %._crit_edge128 ], [ -1, %5 ]
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge128 ], [ 0, %5 ]
  %6 = add i64 %indvars.iv181, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv181
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv181
  %12 = zext i32 %indvars.iv193 to i64
  %13 = icmp sgt i64 %indvars.iv181, 0
  br i1 %13, label %.lr.ph118.preheader, label %.lr.ph127.split.preheader

.lr.ph118.preheader:                              ; preds = %.preheader95
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 0
  br label %.lr.ph118

.lr.ph127:                                        ; preds = %._crit_edge115
  br i1 true, label %.lr.ph127.split.us.preheader, label %.lr.ph127..lr.ph127.split.preheader_crit_edge

.lr.ph127..lr.ph127.split.preheader_crit_edge:    ; preds = %.lr.ph127
  br label %.lr.ph127.split.preheader

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %15 = and i64 %6, 1
  %lcmp.mod219 = icmp eq i64 %15, 0
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 0
  %17 = icmp eq i64 %7, 0
  br label %.lr.ph127.split.us

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127..lr.ph127.split.preheader_crit_edge, %.preheader95
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader203, label %min.iters.checked

.lr.ph127.split.preheader203:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader
  %indvars.iv164.ph = phi i64 [ %indvars.iv181, %min.iters.checked ], [ %indvars.iv181, %.lr.ph127.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv181, %n.vec
  br i1 %cmp.zero, label %.lr.ph127.split.preheader203, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %18 = and i64 %10, 1
  %lcmp.mod217 = icmp eq i64 %18, 0
  br i1 %lcmp.mod217, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv181
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load202.prol = load <2 x i64>, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %20, align 8
  store <2 x i64> %wide.load202.prol, <2 x i64>* %22, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %23 = icmp eq i64 %10, 0
  br i1 %23, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %24 = add i64 %indvars.iv181, %index
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %24
  %26 = bitcast double* %25 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load202 = load <2 x i64>, <2 x i64>* %28, align 8
  store <2 x i64> %wide.load, <2 x i64>* %26, align 8
  store <2 x i64> %wide.load202, <2 x i64>* %28, align 8
  %index.next = add i64 %index, 4
  %29 = add i64 %indvars.iv181, %index.next
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %29
  %31 = bitcast double* %30 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %31, align 8
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x i64>*
  %wide.load202.1 = load <2 x i64>, <2 x i64>* %33, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %31, align 8
  store <2 x i64> %wide.load202.1, <2 x i64>* %33, align 8
  %index.next.1 = add i64 %index, 8
  %34 = icmp eq i64 %index.next.1, %n.vec
  br i1 %34, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %11, %n.vec
  br i1 %cmp.n, label %._crit_edge128, label %.lr.ph127.split.preheader203

.lr.ph127.split.us:                               ; preds = %.lr.ph127.split.us.preheader, %._crit_edge123.us
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge123.us ], [ %indvars.iv181, %.lr.ph127.split.us.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv179
  %36 = load double, double* %35, align 8
  br i1 %lcmp.mod219, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph127.split.us
  br label %37

; <label>:37:                                     ; preds = %.prol.preheader
  %38 = load double, double* %16, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv179
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %36, %41
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph127.split.us, %37
  %.lcssa210.unr.ph = phi double [ %42, %37 ], [ undef, %.lr.ph127.split.us ]
  %indvars.iv168.unr.ph = phi i64 [ 1, %37 ], [ 0, %.lr.ph127.split.us ]
  %.1120.us.unr.ph = phi double [ %42, %37 ], [ %36, %.lr.ph127.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %17, label %._crit_edge123.us, label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.prol.loopexit
  br label %43

; <label>:43:                                     ; preds = %43, %.lr.ph127.split.us.new
  %indvars.iv168 = phi i64 [ %indvars.iv168.unr.ph, %.lr.ph127.split.us.new ], [ %indvars.iv.next169.1, %43 ]
  %.1120.us = phi double [ %.1120.us.unr.ph, %.lr.ph127.split.us.new ], [ %57, %43 ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv168
  %45 = bitcast double* %44 to <2 x double>*
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv168, i64 %indvars.iv179
  %47 = load double, double* %46, align 8
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %48 = load <2 x double>, <2 x double>* %45, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next169, i64 %indvars.iv179
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %47, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fmul <2 x double> %48, %52
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = fsub double %.1120.us, %54
  %57 = fsub double %56, %55
  %exitcond195.1 = icmp eq i64 %indvars.iv.next169, %12
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  br i1 %exitcond195.1, label %._crit_edge123.us.unr-lcssa, label %43

._crit_edge123.us.unr-lcssa:                      ; preds = %43
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %.prol.loopexit, %._crit_edge123.us.unr-lcssa
  %.lcssa210 = phi double [ %.lcssa210.unr.ph, %.prol.loopexit ], [ %57, %._crit_edge123.us.unr-lcssa ]
  store double %.lcssa210, double* %35, align 8
  %indvars.iv.next180 = add nuw i64 %indvars.iv179, 1
  %exitcond196 = icmp eq i64 %indvars.iv.next180, 2000
  br i1 %exitcond196, label %._crit_edge128.loopexit, label %.lr.ph127.split.us

.lr.ph118:                                        ; preds = %.lr.ph118.preheader, %._crit_edge115
  %indvars.iv190 = phi i32 [ %indvars.iv.next191, %._crit_edge115 ], [ -1, %.lr.ph118.preheader ]
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge115 ], [ 0, %.lr.ph118.preheader ]
  %58 = add i64 %indvars.iv160, 4294967295
  %59 = and i64 %58, 4294967295
  %60 = zext i32 %indvars.iv190 to i64
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv160
  %62 = load double, double* %61, align 8
  %63 = icmp sgt i64 %indvars.iv160, 0
  br i1 %63, label %.lr.ph114.preheader, label %._crit_edge115

.lr.ph114.preheader:                              ; preds = %.lr.ph118
  %64 = and i64 %58, 1
  %lcmp.mod215 = icmp eq i64 %64, 0
  br i1 %lcmp.mod215, label %.lr.ph114.prol.preheader, label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.preheader:                         ; preds = %.lr.ph114.preheader
  br label %.lr.ph114.prol

.lr.ph114.prol:                                   ; preds = %.lr.ph114.prol.preheader
  %65 = load double, double* %14, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv160
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fsub double %62, %68
  br label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph114.preheader, %.lr.ph114.prol
  %.lcssa209.unr.ph = phi double [ %69, %.lr.ph114.prol ], [ undef, %.lr.ph114.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph114.prol ], [ 0, %.lr.ph114.preheader ]
  %.0112.unr.ph = phi double [ %69, %.lr.ph114.prol ], [ %62, %.lr.ph114.preheader ]
  br label %.lr.ph114.prol.loopexit

.lr.ph114.prol.loopexit:                          ; preds = %.lr.ph114.prol.loopexit.unr-lcssa
  %70 = icmp eq i64 %59, 0
  br i1 %70, label %._crit_edge115.loopexit, label %.lr.ph114.preheader.new

.lr.ph114.preheader.new:                          ; preds = %.lr.ph114.prol.loopexit
  br label %.lr.ph114

.lr.ph114:                                        ; preds = %.lr.ph114, %.lr.ph114.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph114.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph114 ]
  %.0112 = phi double [ %.0112.unr.ph, %.lr.ph114.preheader.new ], [ %84, %.lr.ph114 ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv151
  %72 = bitcast double* %71 to <2 x double>*
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv160
  %74 = load double, double* %73, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %75 = load <2 x double>, <2 x double>* %72, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next152, i64 %indvars.iv160
  %77 = load double, double* %76, align 8
  %78 = insertelement <2 x double> undef, double %74, i32 0
  %79 = insertelement <2 x double> %78, double %77, i32 1
  %80 = fmul <2 x double> %75, %79
  %81 = extractelement <2 x double> %80, i32 0
  %82 = extractelement <2 x double> %80, i32 1
  %83 = fsub double %.0112, %81
  %84 = fsub double %83, %82
  %exitcond192.1 = icmp eq i64 %indvars.iv.next152, %60
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond192.1, label %._crit_edge115.loopexit.unr-lcssa, label %.lr.ph114

._crit_edge115.loopexit.unr-lcssa:                ; preds = %.lr.ph114
  br label %._crit_edge115.loopexit

._crit_edge115.loopexit:                          ; preds = %.lr.ph114.prol.loopexit, %._crit_edge115.loopexit.unr-lcssa
  %.lcssa209 = phi double [ %.lcssa209.unr.ph, %.lr.ph114.prol.loopexit ], [ %84, %._crit_edge115.loopexit.unr-lcssa ]
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115.loopexit, %.lr.ph118
  %.0.lcssa = phi double [ %62, %.lr.ph118 ], [ %.lcssa209, %._crit_edge115.loopexit ]
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv160
  %86 = load double, double* %85, align 8
  %87 = fdiv double %.0.lcssa, %86
  store double %87, double* %61, align 8
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %88 = icmp slt i64 %indvars.iv.next161, %indvars.iv181
  %indvars.iv.next191 = add i32 %indvars.iv190, 1
  br i1 %88, label %.lr.ph118, label %.lr.ph127

.lr.ph127.split:                                  ; preds = %.lr.ph127.split.preheader203, %.lr.ph127.split
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %.lr.ph127.split ], [ %indvars.iv164.ph, %.lr.ph127.split.preheader203 ]
  %exitcond166 = icmp eq i64 %indvars.iv164, 1999
  %indvars.iv.next165 = add nuw i64 %indvars.iv164, 1
  br i1 %exitcond166, label %._crit_edge128.loopexit204, label %.lr.ph127.split, !llvm.loop !21

._crit_edge128.loopexit:                          ; preds = %._crit_edge123.us
  br label %._crit_edge128

._crit_edge128.loopexit204:                       ; preds = %.lr.ph127.split
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128.loopexit204, %._crit_edge128.loopexit, %middle.block
  %indvars.iv.next182 = add nuw i64 %indvars.iv181, 1
  %89 = icmp slt i64 %indvars.iv.next182, 2000
  %indvars.iv.next194 = add i32 %indvars.iv193, 1
  br i1 %89, label %.preheader95, label %.preheader93.preheader

.preheader93.preheader:                           ; preds = %._crit_edge128
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.preheader, %._crit_edge107
  %indvars.iv187 = phi i32 [ %indvars.iv.next188, %._crit_edge107 ], [ -1, %.preheader93.preheader ]
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge107 ], [ 0, %.preheader93.preheader ]
  %90 = add i64 %indvars.iv149, 4294967295
  %91 = and i64 %90, 4294967295
  %92 = zext i32 %indvars.iv187 to i64
  %93 = getelementptr inbounds double, double* %2, i64 %indvars.iv149
  %94 = load double, double* %93, align 8
  %95 = icmp sgt i64 %indvars.iv149, 0
  br i1 %95, label %.lr.ph106.preheader, label %._crit_edge107

.lr.ph106.preheader:                              ; preds = %.preheader93
  %xtraiter211 = and i64 %indvars.iv149, 3
  %lcmp.mod212 = icmp eq i64 %xtraiter211, 0
  br i1 %lcmp.mod212, label %.lr.ph106.prol.loopexit, label %.lr.ph106.prol.preheader

.lr.ph106.prol.preheader:                         ; preds = %.lr.ph106.preheader
  br label %.lr.ph106.prol

.lr.ph106.prol:                                   ; preds = %.lr.ph106.prol, %.lr.ph106.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph106.prol ], [ 0, %.lr.ph106.prol.preheader ]
  %.2104.prol = phi double [ %101, %.lr.ph106.prol ], [ %94, %.lr.ph106.prol.preheader ]
  %prol.iter213 = phi i64 [ %prol.iter213.sub, %.lr.ph106.prol ], [ %xtraiter211, %.lr.ph106.prol.preheader ]
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %99 = load double, double* %98, align 8
  %100 = fmul double %97, %99
  %101 = fsub double %.2104.prol, %100
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter213.sub = add i64 %prol.iter213, -1
  %prol.iter213.cmp = icmp eq i64 %prol.iter213.sub, 0
  br i1 %prol.iter213.cmp, label %.lr.ph106.prol.loopexit.unr-lcssa, label %.lr.ph106.prol, !llvm.loop !23

.lr.ph106.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph106.prol
  br label %.lr.ph106.prol.loopexit

.lr.ph106.prol.loopexit:                          ; preds = %.lr.ph106.preheader, %.lr.ph106.prol.loopexit.unr-lcssa
  %.lcssa208.unr = phi double [ undef, %.lr.ph106.preheader ], [ %101, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph106.preheader ], [ %indvars.iv.next141.prol, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %.2104.unr = phi double [ %94, %.lr.ph106.preheader ], [ %101, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %102 = icmp ult i64 %91, 3
  br i1 %102, label %._crit_edge107.loopexit, label %.lr.ph106.preheader.new

.lr.ph106.preheader.new:                          ; preds = %.lr.ph106.prol.loopexit
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106, %.lr.ph106.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph106.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph106 ]
  %.2104 = phi double [ %.2104.unr, %.lr.ph106.preheader.new ], [ %124, %.lr.ph106 ]
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140
  %104 = bitcast double* %103 to <2 x double>*
  %105 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %106 = bitcast double* %105 to <2 x double>*
  %107 = load <2 x double>, <2 x double>* %104, align 8
  %108 = load <2 x double>, <2 x double>* %106, align 8
  %109 = fmul <2 x double> %107, %108
  %110 = extractelement <2 x double> %109, i32 0
  %111 = extractelement <2 x double> %109, i32 1
  %112 = fsub double %.2104, %110
  %113 = fsub double %112, %111
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %115 = bitcast double* %114 to <2 x double>*
  %116 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.1
  %117 = bitcast double* %116 to <2 x double>*
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %118 = load <2 x double>, <2 x double>* %115, align 8
  %119 = load <2 x double>, <2 x double>* %117, align 8
  %120 = fmul <2 x double> %118, %119
  %121 = extractelement <2 x double> %120, i32 0
  %122 = extractelement <2 x double> %120, i32 1
  %123 = fsub double %113, %121
  %124 = fsub double %123, %122
  %exitcond189.3 = icmp eq i64 %indvars.iv.next141.2, %92
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond189.3, label %._crit_edge107.loopexit.unr-lcssa, label %.lr.ph106

._crit_edge107.loopexit.unr-lcssa:                ; preds = %.lr.ph106
  br label %._crit_edge107.loopexit

._crit_edge107.loopexit:                          ; preds = %.lr.ph106.prol.loopexit, %._crit_edge107.loopexit.unr-lcssa
  %.lcssa208 = phi double [ %.lcssa208.unr, %.lr.ph106.prol.loopexit ], [ %124, %._crit_edge107.loopexit.unr-lcssa ]
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %.preheader93
  %.2.lcssa = phi double [ %94, %.preheader93 ], [ %.lcssa208, %._crit_edge107.loopexit ]
  %125 = getelementptr inbounds double, double* %4, i64 %indvars.iv149
  store double %.2.lcssa, double* %125, align 8
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %126 = icmp slt i64 %indvars.iv.next150, 2000
  %indvars.iv.next188 = add i32 %indvars.iv187, 1
  br i1 %126, label %.preheader93, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge107
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next139, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %127 = sub i32 2000, %indvar
  %128 = sext i32 %127 to i64
  %129 = sub nsw i64 1999, %128
  %130 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %131 = load double, double* %130, align 8
  %132 = icmp slt i32 %indvars.iv, 2000
  br i1 %132, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %133 = sext i32 %indvars.iv to i64
  %134 = sub nsw i64 0, %128
  %xtraiter = and i64 %134, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph.prol ], [ %133, %.lr.ph.prol.preheader ]
  %.399.prol = phi double [ %140, %.lr.ph.prol ], [ %131, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds double, double* %3, i64 %indvars.iv136.prol
  %138 = load double, double* %137, align 8
  %139 = fmul double %136, %138
  %140 = fsub double %.399.prol, %139
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %140, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %133, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next137.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.399.unr = phi double [ %131, %.preheader..lr.ph_crit_edge ], [ %140, %.lr.ph.prol.loopexit.unr-lcssa ]
  %141 = icmp ult i64 %129, 3
  br i1 %141, label %._crit_edge.loopexit, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next137.3, %.lr.ph ]
  %.399 = phi double [ %.399.unr, %.preheader..lr.ph_crit_edge.new ], [ %163, %.lr.ph ]
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136
  %143 = bitcast double* %142 to <2 x double>*
  %144 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  %145 = bitcast double* %144 to <2 x double>*
  %146 = load <2 x double>, <2 x double>* %143, align 8
  %147 = load <2 x double>, <2 x double>* %145, align 8
  %148 = fmul <2 x double> %146, %147
  %149 = extractelement <2 x double> %148, i32 0
  %150 = extractelement <2 x double> %148, i32 1
  %151 = fsub double %.399, %149
  %152 = fsub double %151, %150
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %154 = bitcast double* %153 to <2 x double>*
  %155 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137.1
  %156 = bitcast double* %155 to <2 x double>*
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %157 = load <2 x double>, <2 x double>* %154, align 8
  %158 = load <2 x double>, <2 x double>* %156, align 8
  %159 = fmul <2 x double> %157, %158
  %160 = extractelement <2 x double> %159, i32 0
  %161 = extractelement <2 x double> %159, i32 1
  %162 = fsub double %152, %160
  %163 = fsub double %162, %161
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %163, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.3.lcssa = phi double [ %131, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %165 = load double, double* %164, align 8
  %166 = fdiv double %.3.lcssa, %165
  %167 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %166, double* %167, align 8
  %168 = icmp sgt i64 %indvars.iv138, 0
  br i1 %168, label %._crit_edge..preheader_crit_edge, label %169

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:169:                                    ; preds = %._crit_edge
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
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %._crit_edge._crit_edge

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
