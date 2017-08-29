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

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge..preheader85_crit_edge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge..preheader85_crit_edge ], [ 0, %.lr.ph.preheader ]
  %22 = shl i64 %indvars.iv137, 32
  %sext = add i64 %22, 4294967296
  %23 = ashr exact i64 %sext, 32
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %23
  %scevgep135136 = bitcast double* %scevgep135 to i8*
  %24 = sub i64 1998, %indvars.iv137
  %25 = shl i64 %24, 3
  %26 = and i64 %25, 34359738360
  %27 = add nuw nsw i64 %26, 8
  br label %29

.preheader84:                                     ; preds = %29
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %28 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %28, label %._crit_edge..preheader85_crit_edge, label %38

; <label>:29:                                     ; preds = %29, %.lr.ph
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %29 ], [ 0, %.lr.ph ]
  %30 = sub nsw i64 0, %indvars.iv120
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 2.000000e+03
  %35 = fadd double %34, 1.000000e+00
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv120
  store double %35, double* %36, align 8
  %exitcond128 = icmp eq i64 %indvars.iv120, %indvars.iv137
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br i1 %exitcond128, label %.preheader84, label %29

._crit_edge..preheader85_crit_edge:               ; preds = %.preheader84
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep135136, i8 0, i64 %27, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph

; <label>:38:                                     ; preds = %.preheader84
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
  %.1120.us = phi double [ %.1120.us.unr.ph, %.lr.ph127.split.us.new ], [ %54, %42 ]
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv168
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv168, i64 %indvars.iv179
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %.1120.us, %47
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv.next169
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next169, i64 %indvars.iv179
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fsub double %48, %53
  %exitcond176.1 = icmp eq i64 %indvars.iv.next169, %wide.trip.count175
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  br i1 %exitcond176.1, label %._crit_edge123.us.unr-lcssa, label %42

._crit_edge123.us.unr-lcssa:                      ; preds = %42
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %.prol.loopexit, %._crit_edge123.us.unr-lcssa
  %.lcssa200 = phi double [ %.lcssa200.unr.ph, %.prol.loopexit ], [ %54, %._crit_edge123.us.unr-lcssa ]
  store double %.lcssa200, double* %34, align 8
  %indvars.iv.next180 = add nuw i64 %indvars.iv179, 1
  %55 = icmp slt i64 %indvars.iv.next180, 2000
  br i1 %55, label %.lr.ph127.split.us, label %._crit_edge128.loopexit

.lr.ph118:                                        ; preds = %.lr.ph118.preheader, %._crit_edge115
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge115 ], [ 0, %.lr.ph118.preheader ]
  %indvars.iv156 = phi i32 [ %indvars.iv.next157, %._crit_edge115 ], [ -1, %.lr.ph118.preheader ]
  %56 = add i64 %indvars.iv160, 4294967295
  %57 = and i64 %56, 4294967295
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv160
  %59 = load double, double* %58, align 8
  %60 = icmp sgt i64 %indvars.iv160, 0
  br i1 %60, label %.lr.ph114.preheader, label %._crit_edge115

.lr.ph114.preheader:                              ; preds = %.lr.ph118
  %wide.trip.count158 = zext i32 %indvars.iv156 to i64
  %61 = and i64 %56, 1
  %lcmp.mod205 = icmp eq i64 %61, 0
  br i1 %lcmp.mod205, label %.lr.ph114.prol.preheader, label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.preheader:                         ; preds = %.lr.ph114.preheader
  br label %.lr.ph114.prol

.lr.ph114.prol:                                   ; preds = %.lr.ph114.prol.preheader
  %62 = load double, double* %13, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv160
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %59, %65
  br label %.lr.ph114.prol.loopexit.unr-lcssa

.lr.ph114.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph114.preheader, %.lr.ph114.prol
  %.lcssa199.unr.ph = phi double [ %66, %.lr.ph114.prol ], [ undef, %.lr.ph114.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph114.prol ], [ 0, %.lr.ph114.preheader ]
  %.0112.unr.ph = phi double [ %66, %.lr.ph114.prol ], [ %59, %.lr.ph114.preheader ]
  br label %.lr.ph114.prol.loopexit

.lr.ph114.prol.loopexit:                          ; preds = %.lr.ph114.prol.loopexit.unr-lcssa
  %67 = icmp eq i64 %57, 0
  br i1 %67, label %._crit_edge115.loopexit, label %.lr.ph114.preheader.new

.lr.ph114.preheader.new:                          ; preds = %.lr.ph114.prol.loopexit
  br label %.lr.ph114

.lr.ph114:                                        ; preds = %.lr.ph114, %.lr.ph114.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph114.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph114 ]
  %.0112 = phi double [ %.0112.unr.ph, %.lr.ph114.preheader.new ], [ %79, %.lr.ph114 ]
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv151
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv160
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fsub double %.0112, %72
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv181, i64 %indvars.iv.next152
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next152, i64 %indvars.iv160
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fsub double %73, %78
  %exitcond159.1 = icmp eq i64 %indvars.iv.next152, %wide.trip.count158
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond159.1, label %._crit_edge115.loopexit.unr-lcssa, label %.lr.ph114

._crit_edge115.loopexit.unr-lcssa:                ; preds = %.lr.ph114
  br label %._crit_edge115.loopexit

._crit_edge115.loopexit:                          ; preds = %.lr.ph114.prol.loopexit, %._crit_edge115.loopexit.unr-lcssa
  %.lcssa199 = phi double [ %.lcssa199.unr.ph, %.lr.ph114.prol.loopexit ], [ %79, %._crit_edge115.loopexit.unr-lcssa ]
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115.loopexit, %.lr.ph118
  %.0.lcssa = phi double [ %59, %.lr.ph118 ], [ %.lcssa199, %._crit_edge115.loopexit ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv160
  %81 = load double, double* %80, align 8
  %82 = fdiv double %.0.lcssa, %81
  store double %82, double* %58, align 8
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %83 = icmp slt i64 %indvars.iv.next161, %indvars.iv181
  %indvars.iv.next157 = add nsw i32 %indvars.iv156, 1
  br i1 %83, label %.lr.ph118, label %.lr.ph127

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
  %84 = icmp slt i64 %indvars.iv.next182, 2000
  %indvars.iv.next174 = add nsw i32 %indvars.iv173, 1
  br i1 %84, label %.preheader95, label %.preheader93.preheader

.preheader93.preheader:                           ; preds = %._crit_edge128
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.preheader, %._crit_edge107
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge107 ], [ 0, %.preheader93.preheader ]
  %indvars.iv145 = phi i32 [ %indvars.iv.next146, %._crit_edge107 ], [ -1, %.preheader93.preheader ]
  %85 = add i64 %indvars.iv149, 4294967295
  %86 = and i64 %85, 4294967295
  %87 = getelementptr inbounds double, double* %2, i64 %indvars.iv149
  %88 = load double, double* %87, align 8
  %89 = icmp sgt i64 %indvars.iv149, 0
  br i1 %89, label %.lr.ph106.preheader, label %._crit_edge107

.lr.ph106.preheader:                              ; preds = %.preheader93
  %wide.trip.count147 = zext i32 %indvars.iv145 to i64
  %xtraiter201 = and i64 %indvars.iv149, 3
  %lcmp.mod202 = icmp eq i64 %xtraiter201, 0
  br i1 %lcmp.mod202, label %.lr.ph106.prol.loopexit, label %.lr.ph106.prol.preheader

.lr.ph106.prol.preheader:                         ; preds = %.lr.ph106.preheader
  br label %.lr.ph106.prol

.lr.ph106.prol:                                   ; preds = %.lr.ph106.prol, %.lr.ph106.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph106.prol ], [ 0, %.lr.ph106.prol.preheader ]
  %.2104.prol = phi double [ %95, %.lr.ph106.prol ], [ %88, %.lr.ph106.prol.preheader ]
  %prol.iter203 = phi i64 [ %prol.iter203.sub, %.lr.ph106.prol ], [ %xtraiter201, %.lr.ph106.prol.preheader ]
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fsub double %.2104.prol, %94
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter203.sub = add i64 %prol.iter203, -1
  %prol.iter203.cmp = icmp eq i64 %prol.iter203.sub, 0
  br i1 %prol.iter203.cmp, label %.lr.ph106.prol.loopexit.unr-lcssa, label %.lr.ph106.prol, !llvm.loop !23

.lr.ph106.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph106.prol
  br label %.lr.ph106.prol.loopexit

.lr.ph106.prol.loopexit:                          ; preds = %.lr.ph106.preheader, %.lr.ph106.prol.loopexit.unr-lcssa
  %.lcssa198.unr = phi double [ undef, %.lr.ph106.preheader ], [ %95, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph106.preheader ], [ %indvars.iv.next141.prol, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %.2104.unr = phi double [ %88, %.lr.ph106.preheader ], [ %95, %.lr.ph106.prol.loopexit.unr-lcssa ]
  %96 = icmp ult i64 %86, 3
  br i1 %96, label %._crit_edge107.loopexit, label %.lr.ph106.preheader.new

.lr.ph106.preheader.new:                          ; preds = %.lr.ph106.prol.loopexit
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106, %.lr.ph106.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph106.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph106 ]
  %.2104 = phi double [ %.2104.unr, %.lr.ph106.preheader.new ], [ %120, %.lr.ph106 ]
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = fsub double %.2104, %101
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fsub double %102, %107
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.1
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fsub double %108, %113
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.2
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.2
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fsub double %114, %119
  %exitcond148.3 = icmp eq i64 %indvars.iv.next141.2, %wide.trip.count147
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond148.3, label %._crit_edge107.loopexit.unr-lcssa, label %.lr.ph106

._crit_edge107.loopexit.unr-lcssa:                ; preds = %.lr.ph106
  br label %._crit_edge107.loopexit

._crit_edge107.loopexit:                          ; preds = %.lr.ph106.prol.loopexit, %._crit_edge107.loopexit.unr-lcssa
  %.lcssa198 = phi double [ %.lcssa198.unr, %.lr.ph106.prol.loopexit ], [ %120, %._crit_edge107.loopexit.unr-lcssa ]
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %.preheader93
  %.2.lcssa = phi double [ %88, %.preheader93 ], [ %.lcssa198, %._crit_edge107.loopexit ]
  %121 = getelementptr inbounds double, double* %4, i64 %indvars.iv149
  store double %.2.lcssa, double* %121, align 8
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %122 = icmp slt i64 %indvars.iv.next150, 2000
  %indvars.iv.next146 = add nsw i32 %indvars.iv145, 1
  br i1 %122, label %.preheader93, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge107
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next139, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %123 = sub i32 2000, %indvar
  %124 = sext i32 %123 to i64
  %125 = sub nsw i64 1999, %124
  %126 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %127 = load double, double* %126, align 8
  %128 = icmp slt i32 %indvars.iv, 2000
  br i1 %128, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %129 = sext i32 %indvars.iv to i64
  %130 = sub nsw i64 0, %124
  %xtraiter = and i64 %130, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %.lr.ph.prol ], [ %129, %.lr.ph.prol.preheader ]
  %.399.prol = phi double [ %136, %.lr.ph.prol ], [ %127, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %132 = load double, double* %131, align 8
  %133 = getelementptr inbounds double, double* %3, i64 %indvars.iv136.prol
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = fsub double %.399.prol, %135
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !25

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %136, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %129, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next137.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.399.unr = phi double [ %127, %.preheader..lr.ph_crit_edge ], [ %136, %.lr.ph.prol.loopexit.unr-lcssa ]
  %137 = icmp ult i64 %125, 3
  br i1 %137, label %._crit_edge.loopexit, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next137.3, %.lr.ph ]
  %.399 = phi double [ %.399.unr, %.preheader..lr.ph_crit_edge.new ], [ %161, %.lr.ph ]
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fsub double %.399, %142
  %indvars.iv.next137 = add nsw i64 %indvars.iv136, 1
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fsub double %143, %148
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %151 = load double, double* %150, align 8
  %152 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137.1
  %153 = load double, double* %152, align 8
  %154 = fmul double %151, %153
  %155 = fsub double %149, %154
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %156 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137.2
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137.2
  %159 = load double, double* %158, align 8
  %160 = fmul double %157, %159
  %161 = fsub double %155, %160
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %161, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.3.lcssa = phi double [ %127, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
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
