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
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  store double 0.000000e+00, double* %7, align 8
  %indvars.iv.next140 = or i64 %indvars.iv139, 1
  %8 = trunc i64 %indvars.iv.next140 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fmul double %10, 5.000000e-01
  %12 = fadd double %11, 4.000000e+00
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv139
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next140
  store double 0.000000e+00, double* %14, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next140
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next140.1 = add nsw i64 %indvars.iv139, 2
  %16 = trunc i64 %indvars.iv.next140.1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = fadd double %19, 4.000000e+00
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next140
  store double %20, double* %21, align 8
  %exitcond141.1 = icmp eq i64 %indvars.iv.next140, 1999
  br i1 %exitcond141.1, label %.lr.ph.preheader, label %._crit_edge100

.lr.ph.preheader:                                 ; preds = %._crit_edge100
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge97..preheader84_crit_edge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge97..preheader84_crit_edge ], [ 0, %.lr.ph.preheader ]
  %22 = shl i64 %indvars.iv137, 32
  %sext = add i64 %22, 4294967296
  %23 = ashr exact i64 %sext, 32
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %23
  %scevgep135136 = bitcast double* %scevgep135 to i8*
  %24 = sub i64 1998, %indvars.iv137
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  %27 = add nuw nsw i64 %26, 8
  br label %28

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
  br i1 %exitcond128, label %._crit_edge, label %28

._crit_edge:                                      ; preds = %28
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %36 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %36, label %._crit_edge97..preheader84_crit_edge, label %38

._crit_edge97..preheader84_crit_edge:             ; preds = %._crit_edge
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep135136, i8 0, i64 %27, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph

; <label>:38:                                     ; preds = %._crit_edge
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %39, align 8
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader83_crit_edge

.preheader82:                                     ; preds = %..preheader83_crit_edge
  %41 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %.preheader81

..preheader83_crit_edge:                          ; preds = %..preheader83_crit_edge, %38
  %indvars.iv118 = phi i64 [ 0, %38 ], [ %indvars.iv.next119.7, %..preheader83_crit_edge ]
  %42 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %43 = mul nuw nsw i64 %indvars.iv.next119, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.1 = or i64 %indvars.iv118, 2
  %44 = mul nuw nsw i64 %indvars.iv.next119.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.2 = or i64 %indvars.iv118, 3
  %45 = mul nuw nsw i64 %indvars.iv.next119.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.3 = or i64 %indvars.iv118, 4
  %46 = mul nuw nsw i64 %indvars.iv.next119.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.4 = or i64 %indvars.iv118, 5
  %47 = mul nuw nsw i64 %indvars.iv.next119.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.5 = or i64 %indvars.iv118, 6
  %48 = mul nuw nsw i64 %indvars.iv.next119.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.6 = or i64 %indvars.iv118, 7
  %49 = mul nuw nsw i64 %indvars.iv.next119.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  %50 = icmp slt i64 %indvars.iv.next119.7, 2000
  br i1 %50, label %..preheader83_crit_edge, label %.preheader82

.preheader81:                                     ; preds = %97, %.preheader82
  %indvars.iv113 = phi i64 [ 0, %.preheader82 ], [ %51, %97 ]
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv113
  %scevgep144145 = bitcast double* %scevgep144 to i8*
  %51 = add i64 %indvars.iv113, 1
  %scevgep146 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %51
  %scevgep146147 = bitcast double* %scevgep146 to i8*
  br label %.preheader80

.preheader79:                                     ; preds = %97
  br label %.preheader

.preheader80:                                     ; preds = %middle.block, %.preheader81
  %indvars.iv111 = phi i64 [ 0, %.preheader81 ], [ %indvars.iv.next112, %middle.block ]
  %52 = mul i64 %indvars.iv111, 16000
  %scevgep142 = getelementptr i8, i8* %40, i64 %52
  %53 = add i64 %52, 16000
  %scevgep143 = getelementptr i8, i8* %40, i64 %53
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv113
  %bound0 = icmp ult i8* %scevgep142, %scevgep146147
  %bound1 = icmp ult i8* %scevgep144145, %scevgep143
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %54 to i8*
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
  %55 = or i64 %index, 1
  %56 = or i64 %index, 2
  %57 = or i64 %index, 3
  %58 = load double, double* %54, align 8, !alias.scope !1
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv113
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv113
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv113
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv113
  %65 = load double, double* %61, align 8, !alias.scope !4
  %66 = load double, double* %62, align 8, !alias.scope !4
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = insertelement <2 x double> undef, double %67, i32 0
  %72 = insertelement <2 x double> %71, double %68, i32 1
  %73 = fmul <2 x double> %60, %70
  %74 = fmul <2 x double> %60, %72
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv111, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = fadd <2 x double> %wide.load, %73
  %80 = fadd <2 x double> %wide.load153, %74
  store <2 x double> %79, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %80, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %81 = icmp eq i64 %index.next, 2000
  br i1 %81, label %middle.block.loopexit183, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv108 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next109.1, %scalar.ph ]
  %82 = load double, double* %54, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv113
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv111, i64 %indvars.iv108
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %89 = load double, double* %54, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next109, i64 %indvars.iv113
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next109
  %94 = load double, double* %93, align 8
  %95 = fadd double %94, %92
  store double %95, double* %93, align 8
  %exitcond110.1 = icmp eq i64 %indvars.iv.next109, 1999
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond110.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit183:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit183, %middle.block.loopexit
  %indvars.iv.next112 = add nuw i64 %indvars.iv111, 1
  %96 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %96, label %.preheader80, label %97

; <label>:97:                                     ; preds = %middle.block
  %98 = icmp slt i64 %51, 2000
  br i1 %98, label %.preheader81, label %.preheader79

.preheader:                                       ; preds = %middle.block155, %.preheader79
  %indvars.iv106 = phi i64 [ 0, %.preheader79 ], [ %99, %middle.block155 ]
  %scevgep159 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 0
  %scevgep159160 = bitcast double* %scevgep159 to i8*
  %99 = add i64 %indvars.iv106, 1
  %scevgep161 = getelementptr [2000 x double], [2000 x double]* %1, i64 %99, i64 0
  %scevgep161162 = bitcast double* %scevgep161 to i8*
  %100 = mul i64 %indvars.iv106, 16000
  %scevgep163 = getelementptr i8, i8* %40, i64 %100
  %101 = add i64 %100, 16000
  %scevgep164 = getelementptr i8, i8* %40, i64 %101
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
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %index171
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  %wide.load180 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !13
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index171
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  store <2 x i64> %wide.load180, <2 x i64>* %109, align 8, !alias.scope !16, !noalias !13
  %index.next172 = or i64 %index171, 4
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %index.next172
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x i64>*
  %wide.load180.1 = load <2 x i64>, <2 x i64>* %113, align 8, !alias.scope !13
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %index.next172
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %116 = getelementptr double, double* %114, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  store <2 x i64> %wide.load180.1, <2 x i64>* %117, align 8, !alias.scope !16, !noalias !13
  %index.next172.1 = add nsw i64 %index171, 8
  %118 = icmp eq i64 %index.next172.1, 2000
  br i1 %118, label %middle.block155.loopexit182, label %vector.body154, !llvm.loop !18

scalar.ph156:                                     ; preds = %scalar.ph156, %scalar.ph156.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph156.preheader ], [ %indvars.iv.next.4, %scalar.ph156 ]
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %135 = bitcast double* %134 to i64*
  %136 = load i64, i64* %135, align 8
  %137 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %138 = bitcast double* %137 to i64*
  store i64 %136, i64* %138, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %139 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %140 = bitcast double* %139 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv106, i64 %indvars.iv.next.3
  %143 = bitcast double* %142 to i64*
  store i64 %141, i64* %143, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block155.loopexit, label %scalar.ph156, !llvm.loop !19

middle.block155.loopexit:                         ; preds = %scalar.ph156
  br label %middle.block155

middle.block155.loopexit182:                      ; preds = %vector.body154
  br label %middle.block155

middle.block155:                                  ; preds = %middle.block155.loopexit182, %middle.block155.loopexit
  %144 = icmp slt i64 %99, 2000
  br i1 %144, label %.preheader, label %145

; <label>:145:                                    ; preds = %middle.block155
  tail call void @free(i8* nonnull %40) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]*, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader102

.preheader102:                                    ; preds = %._crit_edge128, %5
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %._crit_edge128 ], [ 0, %5 ]
  %indvars.iv170 = phi i32 [ %indvars.iv.next171, %._crit_edge128 ], [ -1, %5 ]
  %6 = add i64 %indvars.iv178, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = sub i64 1999, %indvars.iv178
  %9 = icmp sgt i64 %indvars.iv178, 0
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178
  %sunkaddr = ptrtoint [2000 x double]* %10 to i64
  br i1 %9, label %.lr.ph119.preheader, label %.lr.ph127..lr.ph127.split_crit_edge

.lr.ph119.preheader:                              ; preds = %.preheader102
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 0
  br label %.lr.ph119

.lr.ph127:                                        ; preds = %._crit_edge116
  br i1 true, label %.lr.ph127.split.us.preheader, label %.lr.ph127..lr.ph127..lr.ph127.split_crit_edge_crit_edge

.lr.ph127..lr.ph127..lr.ph127.split_crit_edge_crit_edge: ; preds = %.lr.ph127
  br label %.lr.ph127..lr.ph127.split_crit_edge

.lr.ph127.split.us.preheader:                     ; preds = %.lr.ph127
  %wide.trip.count172 = zext i32 %indvars.iv170 to i64
  %12 = and i64 %6, 1
  %lcmp.mod206 = icmp eq i64 %12, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 0
  %14 = icmp eq i64 %7, 0
  br label %.lr.ph127.split.us

.lr.ph127..lr.ph127.split_crit_edge:              ; preds = %.lr.ph127..lr.ph127..lr.ph127.split_crit_edge_crit_edge, %.preheader102
  %15 = sub i64 0, %indvars.iv178
  %xtraiter202 = and i64 %15, 3
  %lcmp.mod203 = icmp eq i64 %xtraiter202, 0
  br i1 %lcmp.mod203, label %.lr.ph127.split.prol.loopexit, label %.lr.ph127.split.prol.preheader

.lr.ph127.split.prol.preheader:                   ; preds = %.lr.ph127..lr.ph127.split_crit_edge
  br label %.lr.ph127.split.prol

.lr.ph127.split.prol:                             ; preds = %.lr.ph127.split.prol, %.lr.ph127.split.prol.preheader
  %indvars.iv162.prol = phi i64 [ %indvars.iv.next163.prol, %.lr.ph127.split.prol ], [ %indvars.iv178, %.lr.ph127.split.prol.preheader ]
  %prol.iter204 = phi i64 [ %prol.iter204.sub, %.lr.ph127.split.prol ], [ %xtraiter202, %.lr.ph127.split.prol.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv162.prol
  %17 = bitcast double* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %sunkaddr97.prol = shl nsw i64 %indvars.iv162.prol, 3
  %sunkaddr98.prol = add i64 %sunkaddr97.prol, %sunkaddr
  %19 = inttoptr i64 %sunkaddr98.prol to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next163.prol = add nuw i64 %indvars.iv162.prol, 1
  %prol.iter204.sub = add i64 %prol.iter204, -1
  %prol.iter204.cmp = icmp eq i64 %prol.iter204.sub, 0
  br i1 %prol.iter204.cmp, label %.lr.ph127.split.prol.loopexit.unr-lcssa, label %.lr.ph127.split.prol, !llvm.loop !20

.lr.ph127.split.prol.loopexit.unr-lcssa:          ; preds = %.lr.ph127.split.prol
  br label %.lr.ph127.split.prol.loopexit

.lr.ph127.split.prol.loopexit:                    ; preds = %.lr.ph127..lr.ph127.split_crit_edge, %.lr.ph127.split.prol.loopexit.unr-lcssa
  %indvars.iv162.unr = phi i64 [ %indvars.iv178, %.lr.ph127..lr.ph127.split_crit_edge ], [ %indvars.iv.next163.prol, %.lr.ph127.split.prol.loopexit.unr-lcssa ]
  %20 = icmp ult i64 %8, 3
  br i1 %20, label %._crit_edge128.loopexit190, label %.lr.ph127..lr.ph127.split_crit_edge.new

.lr.ph127..lr.ph127.split_crit_edge.new:          ; preds = %.lr.ph127.split.prol.loopexit
  br label %.lr.ph127.split

.lr.ph127.split.us:                               ; preds = %.lr.ph127.split.us.preheader, %._crit_edge124.us
  %indvars.iv176 = phi i64 [ %indvars.iv.next177, %._crit_edge124.us ], [ %indvars.iv178, %.lr.ph127.split.us.preheader ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv176
  %22 = load double, double* %21, align 8
  br i1 %lcmp.mod206, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph127.split.us
  br label %23

; <label>:23:                                     ; preds = %.prol.preheader
  %24 = load double, double* %13, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv176
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph127.split.us, %23
  %.lcssa196.unr.ph = phi double [ %28, %23 ], [ undef, %.lr.ph127.split.us ]
  %indvars.iv165.unr.ph = phi i64 [ 1, %23 ], [ 0, %.lr.ph127.split.us ]
  %.1121.us.unr.ph = phi double [ %28, %23 ], [ %22, %.lr.ph127.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %14, label %._crit_edge124.us, label %.lr.ph127.split.us.new

.lr.ph127.split.us.new:                           ; preds = %.prol.loopexit
  br label %29

; <label>:29:                                     ; preds = %29, %.lr.ph127.split.us.new
  %indvars.iv165 = phi i64 [ %indvars.iv165.unr.ph, %.lr.ph127.split.us.new ], [ %indvars.iv.next166.1, %29 ]
  %.1121.us = phi double [ %.1121.us.unr.ph, %.lr.ph127.split.us.new ], [ %41, %29 ]
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv165
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv165, i64 %indvars.iv176
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %.1121.us, %34
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv.next166
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next166, i64 %indvars.iv176
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  %exitcond173.1 = icmp eq i64 %indvars.iv.next166, %wide.trip.count172
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv165, 2
  br i1 %exitcond173.1, label %._crit_edge124.us.unr-lcssa, label %29

._crit_edge124.us.unr-lcssa:                      ; preds = %29
  br label %._crit_edge124.us

._crit_edge124.us:                                ; preds = %.prol.loopexit, %._crit_edge124.us.unr-lcssa
  %.lcssa196 = phi double [ %.lcssa196.unr.ph, %.prol.loopexit ], [ %41, %._crit_edge124.us.unr-lcssa ]
  %sunkaddr97.us = shl nsw i64 %indvars.iv176, 3
  %sunkaddr98.us = add i64 %sunkaddr97.us, %sunkaddr
  %sunkaddr99.us = inttoptr i64 %sunkaddr98.us to double*
  store double %.lcssa196, double* %sunkaddr99.us, align 8
  %indvars.iv.next177 = add nuw i64 %indvars.iv176, 1
  %42 = icmp slt i64 %indvars.iv.next177, 2000
  br i1 %42, label %.lr.ph127.split.us, label %._crit_edge128.loopexit

.lr.ph119:                                        ; preds = %.lr.ph119.preheader, %._crit_edge116
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %._crit_edge116 ], [ 0, %.lr.ph119.preheader ]
  %indvars.iv154 = phi i32 [ %indvars.iv.next155, %._crit_edge116 ], [ -1, %.lr.ph119.preheader ]
  %43 = add i64 %indvars.iv158, 4294967295
  %44 = and i64 %43, 4294967295
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv158
  %46 = load double, double* %45, align 8
  %47 = icmp sgt i64 %indvars.iv158, 0
  br i1 %47, label %.lr.ph115.preheader, label %._crit_edge116

.lr.ph115.preheader:                              ; preds = %.lr.ph119
  %wide.trip.count156 = zext i32 %indvars.iv154 to i64
  %48 = and i64 %43, 1
  %lcmp.mod201 = icmp eq i64 %48, 0
  br i1 %lcmp.mod201, label %.lr.ph115.prol.preheader, label %.lr.ph115.prol.loopexit.unr-lcssa

.lr.ph115.prol.preheader:                         ; preds = %.lr.ph115.preheader
  br label %.lr.ph115.prol

.lr.ph115.prol:                                   ; preds = %.lr.ph115.prol.preheader
  %49 = load double, double* %11, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv158
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %46, %52
  br label %.lr.ph115.prol.loopexit.unr-lcssa

.lr.ph115.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph115.preheader, %.lr.ph115.prol
  %.lcssa195.unr.ph = phi double [ %53, %.lr.ph115.prol ], [ undef, %.lr.ph115.preheader ]
  %indvars.iv149.unr.ph = phi i64 [ 1, %.lr.ph115.prol ], [ 0, %.lr.ph115.preheader ]
  %.0113.unr.ph = phi double [ %53, %.lr.ph115.prol ], [ %46, %.lr.ph115.preheader ]
  br label %.lr.ph115.prol.loopexit

.lr.ph115.prol.loopexit:                          ; preds = %.lr.ph115.prol.loopexit.unr-lcssa
  %54 = icmp eq i64 %44, 0
  br i1 %54, label %._crit_edge116.loopexit, label %.lr.ph115.preheader.new

.lr.ph115.preheader.new:                          ; preds = %.lr.ph115.prol.loopexit
  br label %.lr.ph115

.lr.ph115:                                        ; preds = %.lr.ph115, %.lr.ph115.preheader.new
  %indvars.iv149 = phi i64 [ %indvars.iv149.unr.ph, %.lr.ph115.preheader.new ], [ %indvars.iv.next150.1, %.lr.ph115 ]
  %.0113 = phi double [ %.0113.unr.ph, %.lr.ph115.preheader.new ], [ %66, %.lr.ph115 ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv149
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv158
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %.0113, %59
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv.next150
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next150, i64 %indvars.iv158
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %60, %65
  %exitcond157.1 = icmp eq i64 %indvars.iv.next150, %wide.trip.count156
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, 2
  br i1 %exitcond157.1, label %._crit_edge116.loopexit.unr-lcssa, label %.lr.ph115

._crit_edge116.loopexit.unr-lcssa:                ; preds = %.lr.ph115
  br label %._crit_edge116.loopexit

._crit_edge116.loopexit:                          ; preds = %.lr.ph115.prol.loopexit, %._crit_edge116.loopexit.unr-lcssa
  %.lcssa195 = phi double [ %.lcssa195.unr.ph, %.lr.ph115.prol.loopexit ], [ %66, %._crit_edge116.loopexit.unr-lcssa ]
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge116.loopexit, %.lr.ph119
  %.0.lcssa = phi double [ %46, %.lr.ph119 ], [ %.lcssa195, %._crit_edge116.loopexit ]
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv158, i64 %indvars.iv158
  %68 = load double, double* %67, align 8
  %69 = fdiv double %.0.lcssa, %68
  %sunkaddr93 = shl nsw i64 %indvars.iv158, 3
  %sunkaddr94 = add i64 %sunkaddr93, %sunkaddr
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  store double %69, double* %sunkaddr95, align 8
  %indvars.iv.next159 = add nuw i64 %indvars.iv158, 1
  %70 = icmp slt i64 %indvars.iv.next159, %indvars.iv178
  %indvars.iv.next155 = add nsw i32 %indvars.iv154, 1
  br i1 %70, label %.lr.ph119, label %.lr.ph127

.lr.ph127.split:                                  ; preds = %.lr.ph127.split, %.lr.ph127..lr.ph127.split_crit_edge.new
  %indvars.iv162 = phi i64 [ %indvars.iv162.unr, %.lr.ph127..lr.ph127.split_crit_edge.new ], [ %indvars.iv.next163.3, %.lr.ph127.split ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv162
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %sunkaddr97 = shl nsw i64 %indvars.iv162, 3
  %sunkaddr98 = add i64 %sunkaddr97, %sunkaddr
  %74 = inttoptr i64 %sunkaddr98 to i64*
  store i64 %73, i64* %74, align 8
  %indvars.iv.next163 = add nuw i64 %indvars.iv162, 1
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv.next163
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %sunkaddr97.1 = shl nsw i64 %indvars.iv.next163, 3
  %sunkaddr98.1 = add i64 %sunkaddr97.1, %sunkaddr
  %78 = inttoptr i64 %sunkaddr98.1 to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next163.1 = add i64 %indvars.iv162, 2
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv.next163.1
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %sunkaddr97.2 = shl nsw i64 %indvars.iv.next163.1, 3
  %sunkaddr98.2 = add i64 %sunkaddr97.2, %sunkaddr
  %82 = inttoptr i64 %sunkaddr98.2 to i64*
  store i64 %81, i64* %82, align 8
  %indvars.iv.next163.2 = add i64 %indvars.iv162, 3
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv178, i64 %indvars.iv.next163.2
  %84 = bitcast double* %83 to i64*
  %85 = load i64, i64* %84, align 8
  %sunkaddr97.3 = shl nsw i64 %indvars.iv.next163.2, 3
  %sunkaddr98.3 = add i64 %sunkaddr97.3, %sunkaddr
  %86 = inttoptr i64 %sunkaddr98.3 to i64*
  store i64 %85, i64* %86, align 8
  %exitcond164.3 = icmp eq i64 %indvars.iv.next163.2, 1999
  %indvars.iv.next163.3 = add i64 %indvars.iv162, 4
  br i1 %exitcond164.3, label %._crit_edge128.loopexit190.unr-lcssa, label %.lr.ph127.split

._crit_edge128.loopexit:                          ; preds = %._crit_edge124.us
  br label %._crit_edge128

._crit_edge128.loopexit190.unr-lcssa:             ; preds = %.lr.ph127.split
  br label %._crit_edge128.loopexit190

._crit_edge128.loopexit190:                       ; preds = %.lr.ph127.split.prol.loopexit, %._crit_edge128.loopexit190.unr-lcssa
  br label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge128.loopexit190, %._crit_edge128.loopexit
  %indvars.iv.next179 = add nuw i64 %indvars.iv178, 1
  %87 = icmp slt i64 %indvars.iv.next179, 2000
  %indvars.iv.next171 = add nsw i32 %indvars.iv170, 1
  br i1 %87, label %.preheader102, label %.preheader100.preheader

.preheader100.preheader:                          ; preds = %._crit_edge128
  br label %.preheader100

.preheader100:                                    ; preds = %.preheader100.preheader, %._crit_edge109
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge109 ], [ 0, %.preheader100.preheader ]
  %indvars.iv143 = phi i32 [ %indvars.iv.next144, %._crit_edge109 ], [ -1, %.preheader100.preheader ]
  %88 = add i64 %indvars.iv147, 4294967295
  %89 = and i64 %88, 4294967295
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv147
  %91 = load double, double* %90, align 8
  %92 = icmp sgt i64 %indvars.iv147, 0
  br i1 %92, label %.lr.ph108.preheader, label %._crit_edge109

.lr.ph108.preheader:                              ; preds = %.preheader100
  %wide.trip.count145 = zext i32 %indvars.iv143 to i64
  %xtraiter197 = and i64 %indvars.iv147, 3
  %lcmp.mod198 = icmp eq i64 %xtraiter197, 0
  br i1 %lcmp.mod198, label %.lr.ph108.prol.loopexit, label %.lr.ph108.prol.preheader

.lr.ph108.prol.preheader:                         ; preds = %.lr.ph108.preheader
  br label %.lr.ph108.prol

.lr.ph108.prol:                                   ; preds = %.lr.ph108.prol, %.lr.ph108.prol.preheader
  %indvars.iv138.prol = phi i64 [ %indvars.iv.next139.prol, %.lr.ph108.prol ], [ 0, %.lr.ph108.prol.preheader ]
  %.2106.prol = phi double [ %98, %.lr.ph108.prol ], [ %91, %.lr.ph108.prol.preheader ]
  %prol.iter199 = phi i64 [ %prol.iter199.sub, %.lr.ph108.prol ], [ %xtraiter197, %.lr.ph108.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv138.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv138.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.2106.prol, %97
  %indvars.iv.next139.prol = add nuw nsw i64 %indvars.iv138.prol, 1
  %prol.iter199.sub = add i64 %prol.iter199, -1
  %prol.iter199.cmp = icmp eq i64 %prol.iter199.sub, 0
  br i1 %prol.iter199.cmp, label %.lr.ph108.prol.loopexit.unr-lcssa, label %.lr.ph108.prol, !llvm.loop !22

.lr.ph108.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph108.prol
  br label %.lr.ph108.prol.loopexit

.lr.ph108.prol.loopexit:                          ; preds = %.lr.ph108.preheader, %.lr.ph108.prol.loopexit.unr-lcssa
  %.lcssa194.unr = phi double [ undef, %.lr.ph108.preheader ], [ %98, %.lr.ph108.prol.loopexit.unr-lcssa ]
  %indvars.iv138.unr = phi i64 [ 0, %.lr.ph108.preheader ], [ %indvars.iv.next139.prol, %.lr.ph108.prol.loopexit.unr-lcssa ]
  %.2106.unr = phi double [ %91, %.lr.ph108.preheader ], [ %98, %.lr.ph108.prol.loopexit.unr-lcssa ]
  %99 = icmp ult i64 %89, 3
  br i1 %99, label %._crit_edge109.loopexit, label %.lr.ph108.preheader.new

.lr.ph108.preheader.new:                          ; preds = %.lr.ph108.prol.loopexit
  br label %.lr.ph108

.lr.ph108:                                        ; preds = %.lr.ph108, %.lr.ph108.preheader.new
  %indvars.iv138 = phi i64 [ %indvars.iv138.unr, %.lr.ph108.preheader.new ], [ %indvars.iv.next139.3, %.lr.ph108 ]
  %.2106 = phi double [ %.2106.unr, %.lr.ph108.preheader.new ], [ %123, %.lr.ph108 ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv138
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %103 = load double, double* %102, align 8
  %104 = fmul double %101, %103
  %105 = fsub double %.2106, %104
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next139
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next139
  %109 = load double, double* %108, align 8
  %110 = fmul double %107, %109
  %111 = fsub double %105, %110
  %indvars.iv.next139.1 = add nsw i64 %indvars.iv138, 2
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next139.1
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next139.1
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fsub double %111, %116
  %indvars.iv.next139.2 = add nsw i64 %indvars.iv138, 3
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next139.2
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next139.2
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fsub double %117, %122
  %exitcond146.3 = icmp eq i64 %indvars.iv.next139.2, %wide.trip.count145
  %indvars.iv.next139.3 = add nsw i64 %indvars.iv138, 4
  br i1 %exitcond146.3, label %._crit_edge109.loopexit.unr-lcssa, label %.lr.ph108

._crit_edge109.loopexit.unr-lcssa:                ; preds = %.lr.ph108
  br label %._crit_edge109.loopexit

._crit_edge109.loopexit:                          ; preds = %.lr.ph108.prol.loopexit, %._crit_edge109.loopexit.unr-lcssa
  %.lcssa194 = phi double [ %.lcssa194.unr, %.lr.ph108.prol.loopexit ], [ %123, %._crit_edge109.loopexit.unr-lcssa ]
  br label %._crit_edge109

._crit_edge109:                                   ; preds = %._crit_edge109.loopexit, %.preheader100
  %.2.lcssa = phi double [ %91, %.preheader100 ], [ %.lcssa194, %._crit_edge109.loopexit ]
  %124 = getelementptr inbounds double, double* %4, i64 %indvars.iv147
  store double %.2.lcssa, double* %124, align 8
  %indvars.iv.next148 = add nuw i64 %indvars.iv147, 1
  %125 = icmp slt i64 %indvars.iv.next148, 2000
  %indvars.iv.next144 = add nsw i32 %indvars.iv143, 1
  br i1 %125, label %.preheader100, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge109
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv136 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next137, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %126 = sub i32 2000, %indvar
  %127 = sext i32 %126 to i64
  %128 = sub nsw i64 1999, %127
  %129 = getelementptr inbounds double, double* %4, i64 %indvars.iv136
  %130 = load double, double* %129, align 8
  %131 = add nsw i64 %indvars.iv136, 1
  %132 = icmp slt i64 %131, 2000
  br i1 %132, label %.preheader..lr.ph_crit_edge, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %.preheader
  %133 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv136
  %134 = load double, double* %133, align 8
  %135 = fdiv double %130, %134
  %136 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  store double %135, double* %136, align 8
  br label %._crit_edge..preheader_crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %137 = sext i32 %indvars.iv to i64
  %138 = sub nsw i64 0, %127
  %xtraiter = and i64 %138, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv134.prol = phi i64 [ %indvars.iv.next135.prol, %.lr.ph.prol ], [ %137, %.lr.ph.prol.preheader ]
  %.3103.prol = phi double [ %144, %.lr.ph.prol ], [ %130, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv134.prol
  %140 = load double, double* %139, align 8
  %141 = getelementptr inbounds double, double* %3, i64 %indvars.iv134.prol
  %142 = load double, double* %141, align 8
  %143 = fmul double %140, %142
  %144 = fsub double %.3103.prol, %143
  %indvars.iv.next135.prol = add nsw i64 %indvars.iv134.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !23

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %144, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv134.unr = phi i64 [ %137, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next135.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.3103.unr = phi double [ %130, %.preheader..lr.ph_crit_edge ], [ %144, %.lr.ph.prol.loopexit.unr-lcssa ]
  %145 = icmp ult i64 %128, 3
  br i1 %145, label %._crit_edge, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv134 = phi i64 [ %indvars.iv134.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next135.3, %.lr.ph ]
  %.3103 = phi double [ %.3103.unr, %.preheader..lr.ph_crit_edge.new ], [ %169, %.lr.ph ]
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv134
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds double, double* %3, i64 %indvars.iv134
  %149 = load double, double* %148, align 8
  %150 = fmul double %147, %149
  %151 = fsub double %.3103, %150
  %indvars.iv.next135 = add nsw i64 %indvars.iv134, 1
  %152 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv.next135
  %153 = load double, double* %152, align 8
  %154 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next135
  %155 = load double, double* %154, align 8
  %156 = fmul double %153, %155
  %157 = fsub double %151, %156
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %158 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv.next135.1
  %159 = load double, double* %158, align 8
  %160 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next135.1
  %161 = load double, double* %160, align 8
  %162 = fmul double %159, %161
  %163 = fsub double %157, %162
  %indvars.iv.next135.2 = add nsw i64 %indvars.iv134, 3
  %164 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv.next135.2
  %165 = load double, double* %164, align 8
  %166 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next135.2
  %167 = load double, double* %166, align 8
  %168 = fmul double %165, %167
  %169 = fsub double %163, %168
  %exitcond.3 = icmp eq i64 %indvars.iv.next135.2, 1999
  %indvars.iv.next135.3 = add nsw i64 %indvars.iv134, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %.lr.ph

._crit_edge.unr-lcssa:                            ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %169, %._crit_edge.unr-lcssa ]
  %170 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv136, i64 %indvars.iv136
  %171 = load double, double* %170, align 8
  %172 = fdiv double %.lcssa, %171
  %173 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  store double %172, double* %173, align 8
  %174 = icmp sgt i64 %indvars.iv136, 0
  br i1 %174, label %._crit_edge..preheader_crit_edge, label %175

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next137 = add i64 %indvars.iv136, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:175:                                    ; preds = %._crit_edge
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}
