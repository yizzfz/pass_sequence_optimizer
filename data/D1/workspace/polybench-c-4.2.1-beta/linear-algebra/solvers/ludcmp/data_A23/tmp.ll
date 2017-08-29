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
  %indvars.iv139 = phi i64 [ 0, %5 ], [ %indvars.iv.next140.1, %._crit_edge100 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next140 = or i64 %indvars.iv139, 1
  %10 = trunc i64 %indvars.iv.next140 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv139
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next140.1 = add nsw i64 %indvars.iv139, 2
  %13 = trunc i64 %indvars.iv.next140.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond141.1 = icmp eq i64 %indvars.iv.next140, 1999
  br i1 %exitcond141.1, label %.lr.ph.preheader, label %._crit_edge100

.lr.ph.preheader:                                 ; preds = %._crit_edge100
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge97..preheader84_crit_edge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge97..preheader84_crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv137, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %22
  %scevgep135136 = bitcast double* %scevgep135 to i8*
  %23 = sub i64 1998, %indvars.iv137
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %28

.preheader83:                                     ; preds = %28
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %27 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %27, label %._crit_edge97..preheader84_crit_edge, label %37

; <label>:28:                                     ; preds = %28, %.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %28 ], [ 0, %.lr.ph ]
  %29 = sub nsw i64 0, %indvars.iv120
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2000
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 2.000000e+03
  %34 = fadd double %33, 1.000000e+00
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv120
  store double %34, double* %35, align 8
  %exitcond128 = icmp eq i64 %indvars.iv120, %indvars.iv137
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br i1 %exitcond128, label %.preheader83, label %28

._crit_edge97..preheader84_crit_edge:             ; preds = %.preheader83
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep135136, i8 0, i64 %26, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %.preheader83
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader82_crit_edge

.preheader81:                                     ; preds = %..preheader82_crit_edge
  %40 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %._crit_edge.preheader

..preheader82_crit_edge:                          ; preds = %..preheader82_crit_edge, %37
  %indvars.iv118 = phi i64 [ 0, %37 ], [ %indvars.iv.next119.7, %..preheader82_crit_edge ]
  %41 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %39, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %42 = mul nuw nsw i64 %indvars.iv.next119, 16000
  %scevgep.1 = getelementptr i8, i8* %39, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %43 = mul nuw nsw i64 %indvars.iv.next119.1, 16000
  %scevgep.2 = getelementptr i8, i8* %39, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %44 = mul nuw nsw i64 %indvars.iv.next119.2, 16000
  %scevgep.3 = getelementptr i8, i8* %39, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %45 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.4 = getelementptr i8, i8* %39, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.4 = or i64 %indvars.iv118, 5
  %46 = mul nuw nsw i64 %indvars.iv.next119.4, 16000
  %scevgep.5 = getelementptr i8, i8* %39, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.5 = or i64 %indvars.iv118, 6
  %47 = mul nuw nsw i64 %indvars.iv.next119.5, 16000
  %scevgep.6 = getelementptr i8, i8* %39, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.6 = or i64 %indvars.iv118, 7
  %48 = mul nuw nsw i64 %indvars.iv.next119.6, 16000
  %scevgep.7 = getelementptr i8, i8* %39, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  %49 = icmp slt i64 %indvars.iv.next119.7, 2000
  br i1 %49, label %..preheader82_crit_edge, label %.preheader81

._crit_edge.preheader:                            ; preds = %96, %.preheader81
  %indvars.iv113 = phi i64 [ 0, %.preheader81 ], [ %50, %96 ]
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv113
  %scevgep144145 = bitcast double* %scevgep144 to i8*
  %50 = add i64 %indvars.iv113, 1
  %scevgep146 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %50
  %scevgep146147 = bitcast double* %scevgep146 to i8*
  br label %.preheader80

._crit_edge1.preheader:                           ; preds = %96
  br label %.preheader

.preheader80:                                     ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv111 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next112, %._crit_edge ]
  %51 = mul i64 %indvars.iv111, 16000
  %scevgep142 = getelementptr i8, i8* %39, i64 %51
  %52 = add i64 %51, 16000
  %scevgep143 = getelementptr i8, i8* %39, i64 %52
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep142, %scevgep146147
  %bound1 = icmp ult i8* %scevgep144145, %scevgep143
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %53 to i8*
  %bound0149 = icmp ult i8* %scevgep142, %bc
  %bound1150 = icmp ult i8* %bc, %scevgep143
  %found.conflict151 = and i1 %bound0149, %bound1150
  %conflict.rdx = or i1 %found.conflict, %found.conflict151
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
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv113
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %54, i64 %indvars.iv113
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv113
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv113
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
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv111, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %78 = fadd <2 x double> %wide.load, %72
  %79 = fadd <2 x double> %wide.load153, %73
  store <2 x double> %78, <2 x double>* %75, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %79, <2 x double>* %77, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %80 = icmp eq i64 %index.next, 2000
  br i1 %80, label %._crit_edge.loopexit182, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv108 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next109.1, %scalar.ph ]
  %81 = load double, double* %53, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv113
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  store double %87, double* %85, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %88 = load double, double* %53, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv113
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next109
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %exitcond110.1 = icmp eq i64 %indvars.iv.next109, 1999
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond110.1, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge.loopexit182:                          ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit182, %._crit_edge.loopexit
  %indvars.iv.next112 = add nuw i64 %indvars.iv111, 1
  %95 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %95, label %.preheader80, label %96

; <label>:96:                                     ; preds = %._crit_edge
  %97 = icmp slt i64 %50, 2000
  br i1 %97, label %._crit_edge.preheader, label %._crit_edge1.preheader

.preheader:                                       ; preds = %._crit_edge1, %._crit_edge1.preheader
  %indvars.iv106 = phi i64 [ 0, %._crit_edge1.preheader ], [ %98, %._crit_edge1 ]
  %scevgep159 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 0
  %scevgep159160 = bitcast double* %scevgep159 to i8*
  %98 = add i64 %indvars.iv106, 1
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %1, i64 %98, i64 0
  %scevgep161162 = bitcast double* %scevgep161 to i8*
  %99 = mul i64 %indvars.iv106, 16000
  %scevgep163 = getelementptr i8, i8* %39, i64 %99
  %100 = add i64 %99, 16000
  %scevgep164 = getelementptr i8, i8* %39, i64 %100
  %bound0165 = icmp ult i8* %scevgep159160, %scevgep164
  %bound1166 = icmp ult i8* %scevgep163, %scevgep161162
  %memcheck.conflict168 = and i1 %bound0165, %bound1166
  br i1 %memcheck.conflict168, label %scalar.ph156.preheader, label %vector.body154.preheader

vector.body154.preheader:                         ; preds = %.preheader
  br label %vector.body154

scalar.ph156.preheader:                           ; preds = %.preheader
  br label %scalar.ph156

vector.body154:                                   ; preds = %vector.body154, %vector.body154.preheader
  %index171 = phi i64 [ 0, %vector.body154.preheader ], [ %index.next172.1, %vector.body154 ]
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %index171
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load180 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !13
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index171
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load180, <2 x i64>* %108, align 8, !alias.scope !16, !noalias !13
  %index.next172 = or i64 %index171, 4
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %index.next172
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load180.1 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index.next172
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load180.1, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %index.next172.1 = add nsw i64 %index171, 8
  %117 = icmp eq i64 %index.next172.1, 2000
  br i1 %117, label %._crit_edge1.loopexit181, label %vector.body154, !llvm.loop !18

scalar.ph156:                                     ; preds = %scalar.ph156, %scalar.ph156.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph156.preheader ], [ %indvars.iv.next.4, %scalar.ph156 ]
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %134 = bitcast double* %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %137 = bitcast double* %136 to i64*
  store i64 %135, i64* %137, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %138 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %139 = bitcast double* %138 to i64*
  %140 = load i64, i64* %139, align 8
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %142 = bitcast double* %141 to i64*
  store i64 %140, i64* %142, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %._crit_edge1.loopexit, label %scalar.ph156, !llvm.loop !19

._crit_edge1.loopexit:                            ; preds = %scalar.ph156
  br label %._crit_edge1

._crit_edge1.loopexit181:                         ; preds = %vector.body154
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit181, %._crit_edge1.loopexit
  %143 = icmp slt i64 %98, 2000
  br i1 %143, label %.preheader, label %144

; <label>:144:                                    ; preds = %._crit_edge1
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge128, %5
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge128 ], [ 0, %5 ]
  %indvars.iv173 = phi i32 [ %indvars.iv.next174, %._crit_edge128 ], [ -1, %5 ]
  %6 = add i64 %indvars.iv181, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 2000, %indvars.iv181
  %9 = add i64 %8, -4
  %10 = lshr i64 %9, 2
  %11 = sub i64 2000, %indvars.iv181
  %12 = icmp sgt i64 %indvars.iv181, 0
  br i1 %12, label %.lr.ph118.preheader, label %.lr.ph127.split.preheader

.lr.ph118.preheader:                              ; preds = %.preheader95
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 0
  br label %.lr.ph118

.lr.ph127.split.preheader:                        ; preds = %.lr.ph127..lr.ph127.split.preheader_crit_edge, %.preheader95
  %min.iters.check = icmp ult i64 %11, 4
  br i1 %min.iters.check, label %.lr.ph127.split.preheader193, label %min.iters.checked

.lr.ph127.split.preheader193:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph127.split.preheader
  %indvars.iv164.ph = phi i64 [ %indvars.iv181, %min.iters.checked ], [ %indvars.iv181, %.lr.ph127.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph127.split

min.iters.checked:                                ; preds = %.lr.ph127.split.preheader
  %n.vec = and i64 %11, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv181, %n.vec
  br i1 %cmp.zero, label %.lr.ph127.split.preheader193, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %10, 1
  %lcmp.mod207 = icmp eq i64 %14, 0
  br i1 %lcmp.mod207, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv181
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
  %20 = add i64 %indvars.iv181, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load192 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load192, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv181, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %25
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
  %lcmp.mod209 = icmp eq i64 %31, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 0
  %33 = icmp eq i64 %7, 0
  br label %.lr.ph127.split.us

.lr.ph127.split.us:                               ; preds = %.lr.ph127.split.us.preheader, %._crit_edge123.us
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %._crit_edge123.us ], [ %indvars.iv181, %.lr.ph127.split.us.preheader ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv179
  %35 = load double, double* %34, align 8
  br i1 %lcmp.mod209, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

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
  %.lcssa200.unr.ph = phi double [ %41, %36 ], [ undef, %.lr.ph127.split.us ]
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
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv168
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
  %.lcssa200 = phi double [ %.lcssa200.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge123.us.unr-lcssa ]
  store double %.lcssa200, double* %34, align 8
  %indvars.iv.next180 = add nuw i64 %indvars.iv179, 1
  %57 = icmp slt i64 %indvars.iv.next180, 2000
  br i1 %57, label %.lr.ph127.split.us, label %._crit_edge128.loopexit

.lr.ph118:                                        ; preds = %.lr.ph118.preheader, %._crit_edge115
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge115 ], [ 0, %.lr.ph118.preheader ]
  %indvars.iv156 = phi i32 [ %indvars.iv.next157, %._crit_edge115 ], [ -1, %.lr.ph118.preheader ]
  %58 = add i64 %indvars.iv160, 4294967295
  %59 = and i64 %58, 4294967295
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv160
  %61 = load double, double* %60, align 8
  %62 = icmp sgt i64 %indvars.iv160, 0
  br i1 %62, label %.lr.ph114.preheader, label %._crit_edge115

.lr.ph114.preheader:                              ; preds = %.lr.ph118
  %wide.trip.count158 = zext i32 %indvars.iv156 to i64
  %63 = and i64 %58, 1
  %lcmp.mod205 = icmp eq i64 %63, 0
  br i1 %lcmp.mod205, label %.lr.ph114.prol.preheader, label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.preheader:                         ; preds = %.lr.ph114.preheader
  br label %.lr.ph114.prol

.lr.ph114.prol:                                   ; preds = %.lr.ph114.prol.preheader
  %64 = load double, double* %13, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv160
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fsub double %61, %67
  br label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph114.preheader, %.lr.ph114.prol
  %.lcssa199.unr.ph = phi double [ %68, %.lr.ph114.prol ], [ undef, %.lr.ph114.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph114.prol ], [ 0, %.lr.ph114.preheader ]
  %.0112.unr.ph = phi double [ %68, %.lr.ph114.prol ], [ %61, %.lr.ph114.preheader ]
  br label %.lr.ph114.prol.loopexit

.lr.ph114.prol.loopexit:                          ; preds = %.lr.ph114.prol.loopexit.unr-lcssa
  %69 = icmp eq i64 %59, 0
  br i1 %69, label %._crit_edge115.loopexit, label %.lr.ph114.preheader.new

.lr.ph114.preheader.new:                          ; preds = %.lr.ph114.prol.loopexit
  br label %.lr.ph114

.lr.ph114:                                        ; preds = %.lr.ph114, %.lr.ph114.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph114.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph114 ]
  %.0112 = phi double [ %.0112.unr.ph, %.lr.ph114.preheader.new ], [ %83, %.lr.ph114 ]
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv151
  %71 = bitcast double* %70 to <2 x double>*
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv160
  %73 = load double, double* %72, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %74 = load <2 x double>, <2 x double>* %71, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next152, i64 %indvars.iv160
  %76 = load double, double* %75, align 8
  %77 = insertelement <2 x double> undef, double %73, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fmul <2 x double> %74, %78
  %80 = extractelement <2 x double> %79, i32 0
  %81 = extractelement <2 x double> %79, i32 1
  %82 = fsub double %.0112, %80
  %83 = fsub double %82, %81
  %exitcond159.1 = icmp eq i64 %indvars.iv.next152, %wide.trip.count158
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond159.1, label %._crit_edge115.loopexit.unr-lcssa, label %.lr.ph114

._crit_edge115.loopexit.unr-lcssa:                ; preds = %.lr.ph114
  br label %._crit_edge115.loopexit

._crit_edge115.loopexit:                          ; preds = %.lr.ph114.prol.loopexit, %._crit_edge115.loopexit.unr-lcssa
  %.lcssa199 = phi double [ %.lcssa199.unr.ph, %.lr.ph114.prol.loopexit ], [ %83, %._crit_edge115.loopexit.unr-lcssa ]
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115.loopexit, %.lr.ph118
  %.0.lcssa = phi double [ %61, %.lr.ph118 ], [ %.lcssa199, %._crit_edge115.loopexit ]
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv160
  %85 = load double, double* %84, align 8
  %86 = fdiv double %.0.lcssa, %85
  store double %86, double* %60, align 8
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %87 = icmp slt i64 %indvars.iv.next161, %indvars.iv181
  %indvars.iv.next157 = add nsw i32 %indvars.iv156, 1
  br i1 %87, label %.lr.ph118, label %.lr.ph127

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
  %indvars.iv.next182 = add nuw i64 %indvars.iv181, 1
  %88 = icmp slt i64 %indvars.iv.next182, 2000
  %indvars.iv.next174 = add nsw i32 %indvars.iv173, 1
  br i1 %88, label %.preheader95, label %.preheader93.preheader

.preheader93.preheader:                           ; preds = %._crit_edge128
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.preheader, %._crit_edge107
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge107 ], [ 0, %.preheader93.preheader ]
  %indvars.iv145 = phi i32 [ %indvars.iv.next146, %._crit_edge107 ], [ -1, %.preheader93.preheader ]
  %89 = add i64 %indvars.iv149, 4294967295
  %90 = and i64 %89, 4294967295
  %91 = getelementptr inbounds double, double* %2, i64 %indvars.iv149
  %92 = load double, double* %91, align 8
  %93 = icmp sgt i64 %indvars.iv149, 0
  br i1 %93, label %.lr.ph106.preheader, label %._crit_edge107

.lr.ph106.preheader:                              ; preds = %.preheader93
  %wide.trip.count147 = zext i32 %indvars.iv145 to i64
  %xtraiter201 = and i64 %indvars.iv149, 3
  %lcmp.mod202 = icmp eq i64 %xtraiter201, 0
  br i1 %lcmp.mod202, label %.lr.ph106.prol.loopexit, label %.lr.ph106.prol.preheader

.lr.ph106.prol.preheader:                         ; preds = %.lr.ph106.preheader
  br label %.lr.ph106.prol

.lr.ph106.prol:                                   ; preds = %.lr.ph106.prol, %.lr.ph106.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph106.prol ], [ 0, %.lr.ph106.prol.preheader ]
  %.2104.prol = phi double [ %99, %.lr.ph106.prol ], [ %92, %.lr.ph106.prol.preheader ]
  %prol.iter203 = phi i64 [ %prol.iter203.sub, %.lr.ph106.prol ], [ %xtraiter201, %.lr.ph106.prol.preheader ]
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fsub double %.2104.prol, %98
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter203.sub = add i64 %prol.iter203, -1
  %prol.iter203.cmp = icmp eq i64 %prol.iter203.sub, 0
  br i1 %prol.iter203.cmp, label %.lr.ph106.prol.loopexit.unr-lcssa, label %.lr.ph106.prol, !llvm.loop !23

.lr.ph106.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph106.prol
  br label %.lr.ph106.prol.loopexit

.lr.ph106.prol.loopexit:                          ; preds = %.lr.ph106.preheader, %.lr.ph106.prol.loopexit.unr-lcssa
  %.lcssa198.unr = phi double [ undef, %.lr.ph106.preheader ], [ %99, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph106.preheader ], [ %indvars.iv.next141.prol, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %.2104.unr = phi double [ %92, %.lr.ph106.preheader ], [ %99, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %100 = icmp ult i64 %90, 3
  br i1 %100, label %._crit_edge107.loopexit, label %.lr.ph106.preheader.new

.lr.ph106.preheader.new:                          ; preds = %.lr.ph106.prol.loopexit
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106, %.lr.ph106.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph106.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph106 ]
  %.2104 = phi double [ %.2104.unr, %.lr.ph106.preheader.new ], [ %122, %.lr.ph106 ]
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140
  %102 = bitcast double* %101 to <2 x double>*
  %103 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %104 = bitcast double* %103 to <2 x double>*
  %105 = load <2 x double>, <2 x double>* %102, align 8
  %106 = load <2 x double>, <2 x double>* %104, align 8
  %107 = fmul <2 x double> %105, %106
  %108 = extractelement <2 x double> %107, i32 0
  %109 = extractelement <2 x double> %107, i32 1
  %110 = fsub double %.2104, %108
  %111 = fsub double %110, %109
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %113 = bitcast double* %112 to <2 x double>*
  %114 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.1
  %115 = bitcast double* %114 to <2 x double>*
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %116 = load <2 x double>, <2 x double>* %113, align 8
  %117 = load <2 x double>, <2 x double>* %115, align 8
  %118 = fmul <2 x double> %116, %117
  %119 = extractelement <2 x double> %118, i32 0
  %120 = extractelement <2 x double> %118, i32 1
  %121 = fsub double %111, %119
  %122 = fsub double %121, %120
  %exitcond148.3 = icmp eq i64 %indvars.iv.next141.2, %wide.trip.count147
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond148.3, label %._crit_edge107.loopexit.unr-lcssa, label %.lr.ph106

._crit_edge107.loopexit.unr-lcssa:                ; preds = %.lr.ph106
  br label %._crit_edge107.loopexit

._crit_edge107.loopexit:                          ; preds = %.lr.ph106.prol.loopexit, %._crit_edge107.loopexit.unr-lcssa
  %.lcssa198 = phi double [ %.lcssa198.unr, %.lr.ph106.prol.loopexit ], [ %122, %._crit_edge107.loopexit.unr-lcssa ]
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %.preheader93
  %.2.lcssa = phi double [ %92, %.preheader93 ], [ %.lcssa198, %._crit_edge107.loopexit ]
  %123 = getelementptr inbounds double, double* %4, i64 %indvars.iv149
  store double %.2.lcssa, double* %123, align 8
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %124 = icmp slt i64 %indvars.iv.next150, 2000
  %indvars.iv.next146 = add nsw i32 %indvars.iv145, 1
  br i1 %124, label %.preheader93, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge107
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next139, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %125 = sub i32 2000, %indvar
  %126 = sext i32 %125 to i64
  %127 = sub nsw i64 1999, %126
  %128 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %129 = load double, double* %128, align 8
  %130 = icmp slt i32 %indvars.iv, 2000
  br i1 %130, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %131 = sext i32 %indvars.iv to i64
  %132 = sub nsw i64 0, %126
  %xtraiter = and i64 %132, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph.prol ], [ %131, %.lr.ph.prol.preheader ]
  %.399.prol = phi double [ %138, %.lr.ph.prol ], [ %129, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %134 = load double, double* %133, align 8
  %135 = getelementptr inbounds double, double* %3, i64 %indvars.iv136.prol
  %136 = load double, double* %135, align 8
  %137 = fmul double %134, %136
  %138 = fsub double %.399.prol, %137
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %138, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %131, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next137.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.399.unr = phi double [ %129, %.preheader..lr.ph_crit_edge ], [ %138, %.lr.ph.prol.loopexit.unr-lcssa ]
  %139 = icmp ult i64 %127, 3
  br i1 %139, label %._crit_edge.loopexit, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next137.3, %.lr.ph ]
  %.399 = phi double [ %.399.unr, %.preheader..lr.ph_crit_edge.new ], [ %161, %.lr.ph ]
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136
  %141 = bitcast double* %140 to <2 x double>*
  %142 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  %143 = bitcast double* %142 to <2 x double>*
  %144 = load <2 x double>, <2 x double>* %141, align 8
  %145 = load <2 x double>, <2 x double>* %143, align 8
  %146 = fmul <2 x double> %144, %145
  %147 = extractelement <2 x double> %146, i32 0
  %148 = extractelement <2 x double> %146, i32 1
  %149 = fsub double %.399, %147
  %150 = fsub double %149, %148
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %152 = bitcast double* %151 to <2 x double>*
  %153 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137.1
  %154 = bitcast double* %153 to <2 x double>*
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %155 = load <2 x double>, <2 x double>* %152, align 8
  %156 = load <2 x double>, <2 x double>* %154, align 8
  %157 = fmul <2 x double> %155, %156
  %158 = extractelement <2 x double> %157, i32 0
  %159 = extractelement <2 x double> %157, i32 1
  %160 = fsub double %150, %158
  %161 = fsub double %160, %159
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %161, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.3.lcssa = phi double [ %129, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %163 = load double, double* %162, align 8
  %164 = fdiv double %.3.lcssa, %163
  %165 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %164, double* %165, align 8
  %166 = icmp sgt i64 %indvars.iv138, 0
  br i1 %166, label %._crit_edge..preheader_crit_edge, label %167

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:167:                                    ; preds = %._crit_edge
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
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %16, label %._crit_edge6, label %17

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
