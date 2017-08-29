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

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge..preheader85_crit_edge
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %._crit_edge..preheader85_crit_edge ], [ 0, %.lr.ph.preheader ]
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

.preheader84:                                     ; preds = %28
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %27 = icmp slt i64 %indvars.iv.next138, 2000
  br i1 %27, label %._crit_edge..preheader85_crit_edge, label %37

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
  br i1 %exitcond128, label %.preheader84, label %28

._crit_edge..preheader85_crit_edge:               ; preds = %.preheader84
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep135136, i8 0, i64 %26, i32 8, i1 false)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %36, align 8
  br label %.lr.ph

; <label>:37:                                     ; preds = %.preheader84
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv137, i64 %indvars.iv137
  store double 1.000000e+00, double* %38, align 8
  %39 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %..preheader83_crit_edge

.preheader82:                                     ; preds = %..preheader83_crit_edge
  %40 = bitcast i8* %39 to [2000 x [2000 x double]]*
  br label %.preheader81

..preheader83_crit_edge:                          ; preds = %..preheader83_crit_edge, %37
  %indvars.iv118 = phi i64 [ 0, %37 ], [ %indvars.iv.next119.7, %..preheader83_crit_edge ]
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
  br i1 %49, label %..preheader83_crit_edge, label %.preheader82

.preheader81:                                     ; preds = %96, %.preheader82
  %indvars.iv113 = phi i64 [ 0, %.preheader82 ], [ %50, %96 ]
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv113
  %scevgep144145 = bitcast double* %scevgep144 to i8*
  %50 = add i64 %indvars.iv113, 1
  %scevgep146 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %50
  %scevgep146147 = bitcast double* %scevgep146 to i8*
  br label %.preheader80

.preheader79:                                     ; preds = %96
  br label %.preheader

.preheader80:                                     ; preds = %middle.block, %.preheader81
  %indvars.iv111 = phi i64 [ 0, %.preheader81 ], [ %indvars.iv.next112, %middle.block ]
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
  br i1 %80, label %middle.block.loopexit183, label %vector.body, !llvm.loop !9

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
  br i1 %exitcond110.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit183:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit183, %middle.block.loopexit
  %indvars.iv.next112 = add nuw i64 %indvars.iv111, 1
  %95 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %95, label %.preheader80, label %96

; <label>:96:                                     ; preds = %middle.block
  %97 = icmp slt i64 %50, 2000
  br i1 %97, label %.preheader81, label %.preheader79

.preheader:                                       ; preds = %middle.block155, %.preheader79
  %indvars.iv106 = phi i64 [ 0, %.preheader79 ], [ %98, %middle.block155 ]
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
  br i1 %117, label %middle.block155.loopexit182, label %vector.body154, !llvm.loop !18

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
  br i1 %exitcond.4, label %middle.block155.loopexit, label %scalar.ph156, !llvm.loop !19

middle.block155.loopexit:                         ; preds = %scalar.ph156
  br label %middle.block155

middle.block155.loopexit182:                      ; preds = %vector.body154
  br label %middle.block155

middle.block155:                                  ; preds = %middle.block155.loopexit182, %middle.block155.loopexit
  %143 = icmp slt i64 %98, 2000
  br i1 %143, label %.preheader, label %144

; <label>:144:                                    ; preds = %middle.block155
  tail call void @free(i8* nonnull %39) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %.preheader95

.preheader95:                                     ; preds = %._crit_edge123, %5
  %indvars.iv169 = phi i64 [ %indvars.iv.next170, %._crit_edge123 ], [ 0, %5 ]
  %indvars.iv161 = phi i32 [ %indvars.iv.next162, %._crit_edge123 ], [ -1, %5 ]
  %6 = add i64 %indvars.iv169, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = icmp sgt i64 %indvars.iv169, 0
  br i1 %8, label %.lr.ph114.preheader, label %._crit_edge123

.lr.ph114.preheader:                              ; preds = %.preheader95
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 0
  br label %.lr.ph114

.lr.ph122:                                        ; preds = %._crit_edge111
  br i1 true, label %.lr.ph122.split.us.preheader, label %.lr.ph122.._crit_edge123_crit_edge

.lr.ph122.._crit_edge123_crit_edge:               ; preds = %.lr.ph122
  br label %._crit_edge123

.lr.ph122.split.us.preheader:                     ; preds = %.lr.ph122
  %wide.trip.count163 = zext i32 %indvars.iv161 to i64
  %10 = and i64 %6, 1
  %lcmp.mod189 = icmp eq i64 %10, 0
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 0
  %12 = icmp eq i64 %7, 0
  br label %.lr.ph122.split.us

.lr.ph122.split.us:                               ; preds = %.lr.ph122.split.us.preheader, %._crit_edge119.us
  %indvars.iv167 = phi i64 [ %indvars.iv.next168, %._crit_edge119.us ], [ %indvars.iv169, %.lr.ph122.split.us.preheader ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv167
  %14 = load double, double* %13, align 8
  br i1 %lcmp.mod189, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph122.split.us
  br label %15

; <label>:15:                                     ; preds = %.prol.preheader
  %16 = load double, double* %11, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv167
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph122.split.us, %15
  %.lcssa182.unr.ph = phi double [ %20, %15 ], [ undef, %.lr.ph122.split.us ]
  %indvars.iv156.unr.ph = phi i64 [ 1, %15 ], [ 0, %.lr.ph122.split.us ]
  %.1116.us.unr.ph = phi double [ %20, %15 ], [ %14, %.lr.ph122.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %12, label %._crit_edge119.us, label %.lr.ph122.split.us.new

.lr.ph122.split.us.new:                           ; preds = %.prol.loopexit
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph122.split.us.new
  %indvars.iv156 = phi i64 [ %indvars.iv156.unr.ph, %.lr.ph122.split.us.new ], [ %indvars.iv.next157.1, %21 ]
  %.1116.us = phi double [ %.1116.us.unr.ph, %.lr.ph122.split.us.new ], [ %35, %21 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv156
  %23 = bitcast double* %22 to <2 x double>*
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv156, i64 %indvars.iv167
  %25 = load double, double* %24, align 8
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %26 = load <2 x double>, <2 x double>* %23, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next157, i64 %indvars.iv167
  %28 = load double, double* %27, align 8
  %29 = insertelement <2 x double> undef, double %25, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fmul <2 x double> %26, %30
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = fsub double %.1116.us, %32
  %35 = fsub double %34, %33
  %exitcond164.1 = icmp eq i64 %indvars.iv.next157, %wide.trip.count163
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  br i1 %exitcond164.1, label %._crit_edge119.us.unr-lcssa, label %21

._crit_edge119.us.unr-lcssa:                      ; preds = %21
  br label %._crit_edge119.us

._crit_edge119.us:                                ; preds = %.prol.loopexit, %._crit_edge119.us.unr-lcssa
  %.lcssa182 = phi double [ %.lcssa182.unr.ph, %.prol.loopexit ], [ %35, %._crit_edge119.us.unr-lcssa ]
  store double %.lcssa182, double* %13, align 8
  %indvars.iv.next168 = add nuw i64 %indvars.iv167, 1
  %36 = icmp slt i64 %indvars.iv.next168, 2000
  br i1 %36, label %.lr.ph122.split.us, label %._crit_edge123.loopexit

.lr.ph114:                                        ; preds = %.lr.ph114.preheader, %._crit_edge111
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %._crit_edge111 ], [ 0, %.lr.ph114.preheader ]
  %indvars.iv149 = phi i32 [ %indvars.iv.next150, %._crit_edge111 ], [ -1, %.lr.ph114.preheader ]
  %37 = add i64 %indvars.iv153, 4294967295
  %38 = and i64 %37, 4294967295
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv153
  %40 = load double, double* %39, align 8
  %41 = icmp sgt i64 %indvars.iv153, 0
  br i1 %41, label %.lr.ph110.preheader, label %._crit_edge111

.lr.ph110.preheader:                              ; preds = %.lr.ph114
  %wide.trip.count151 = zext i32 %indvars.iv149 to i64
  %42 = and i64 %37, 1
  %lcmp.mod187 = icmp eq i64 %42, 0
  br i1 %lcmp.mod187, label %.lr.ph110.prol.preheader, label %.lr.ph110.prol.loopexit.unr-lcssa

.lr.ph110.prol.preheader:                         ; preds = %.lr.ph110.preheader
  br label %.lr.ph110.prol

.lr.ph110.prol:                                   ; preds = %.lr.ph110.prol.preheader
  %43 = load double, double* %9, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv153
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %40, %46
  br label %.lr.ph110.prol.loopexit.unr-lcssa

.lr.ph110.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph110.preheader, %.lr.ph110.prol
  %.lcssa181.unr.ph = phi double [ %47, %.lr.ph110.prol ], [ undef, %.lr.ph110.preheader ]
  %indvars.iv144.unr.ph = phi i64 [ 1, %.lr.ph110.prol ], [ 0, %.lr.ph110.preheader ]
  %.0108.unr.ph = phi double [ %47, %.lr.ph110.prol ], [ %40, %.lr.ph110.preheader ]
  br label %.lr.ph110.prol.loopexit

.lr.ph110.prol.loopexit:                          ; preds = %.lr.ph110.prol.loopexit.unr-lcssa
  %48 = icmp eq i64 %38, 0
  br i1 %48, label %._crit_edge111.loopexit, label %.lr.ph110.preheader.new

.lr.ph110.preheader.new:                          ; preds = %.lr.ph110.prol.loopexit
  br label %.lr.ph110

.lr.ph110:                                        ; preds = %.lr.ph110, %.lr.ph110.preheader.new
  %indvars.iv144 = phi i64 [ %indvars.iv144.unr.ph, %.lr.ph110.preheader.new ], [ %indvars.iv.next145.1, %.lr.ph110 ]
  %.0108 = phi double [ %.0108.unr.ph, %.lr.ph110.preheader.new ], [ %62, %.lr.ph110 ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv169, i64 %indvars.iv144
  %50 = bitcast double* %49 to <2 x double>*
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv144, i64 %indvars.iv153
  %52 = load double, double* %51, align 8
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %53 = load <2 x double>, <2 x double>* %50, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next145, i64 %indvars.iv153
  %55 = load double, double* %54, align 8
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  %58 = fmul <2 x double> %53, %57
  %59 = extractelement <2 x double> %58, i32 0
  %60 = extractelement <2 x double> %58, i32 1
  %61 = fsub double %.0108, %59
  %62 = fsub double %61, %60
  %exitcond152.1 = icmp eq i64 %indvars.iv.next145, %wide.trip.count151
  %indvars.iv.next145.1 = add nsw i64 %indvars.iv144, 2
  br i1 %exitcond152.1, label %._crit_edge111.loopexit.unr-lcssa, label %.lr.ph110

._crit_edge111.loopexit.unr-lcssa:                ; preds = %.lr.ph110
  br label %._crit_edge111.loopexit

._crit_edge111.loopexit:                          ; preds = %.lr.ph110.prol.loopexit, %._crit_edge111.loopexit.unr-lcssa
  %.lcssa181 = phi double [ %.lcssa181.unr.ph, %.lr.ph110.prol.loopexit ], [ %62, %._crit_edge111.loopexit.unr-lcssa ]
  br label %._crit_edge111

._crit_edge111:                                   ; preds = %._crit_edge111.loopexit, %.lr.ph114
  %.0.lcssa = phi double [ %40, %.lr.ph114 ], [ %.lcssa181, %._crit_edge111.loopexit ]
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv153, i64 %indvars.iv153
  %64 = load double, double* %63, align 8
  %65 = fdiv double %.0.lcssa, %64
  store double %65, double* %39, align 8
  %indvars.iv.next154 = add nuw i64 %indvars.iv153, 1
  %66 = icmp slt i64 %indvars.iv.next154, %indvars.iv169
  %indvars.iv.next150 = add nsw i32 %indvars.iv149, 1
  br i1 %66, label %.lr.ph114, label %.lr.ph122

._crit_edge123.loopexit:                          ; preds = %._crit_edge119.us
  br label %._crit_edge123

._crit_edge123:                                   ; preds = %.lr.ph122.._crit_edge123_crit_edge, %._crit_edge123.loopexit, %.preheader95
  %indvars.iv.next170 = add nuw i64 %indvars.iv169, 1
  %67 = icmp slt i64 %indvars.iv.next170, 2000
  %indvars.iv.next162 = add nsw i32 %indvars.iv161, 1
  br i1 %67, label %.preheader95, label %.preheader93.preheader

.preheader93.preheader:                           ; preds = %._crit_edge123
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.preheader, %._crit_edge104
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %._crit_edge104 ], [ 0, %.preheader93.preheader ]
  %indvars.iv138 = phi i32 [ %indvars.iv.next139, %._crit_edge104 ], [ -1, %.preheader93.preheader ]
  %68 = add i64 %indvars.iv142, 4294967295
  %69 = and i64 %68, 4294967295
  %70 = getelementptr inbounds double, double* %2, i64 %indvars.iv142
  %71 = load double, double* %70, align 8
  %72 = icmp sgt i64 %indvars.iv142, 0
  br i1 %72, label %.lr.ph103.preheader, label %._crit_edge104

.lr.ph103.preheader:                              ; preds = %.preheader93
  %wide.trip.count140 = zext i32 %indvars.iv138 to i64
  %xtraiter183 = and i64 %indvars.iv142, 3
  %lcmp.mod184 = icmp eq i64 %xtraiter183, 0
  br i1 %lcmp.mod184, label %.lr.ph103.prol.loopexit, label %.lr.ph103.prol.preheader

.lr.ph103.prol.preheader:                         ; preds = %.lr.ph103.preheader
  br label %.lr.ph103.prol

.lr.ph103.prol:                                   ; preds = %.lr.ph103.prol, %.lr.ph103.prol.preheader
  %indvars.iv133.prol = phi i64 [ %indvars.iv.next134.prol, %.lr.ph103.prol ], [ 0, %.lr.ph103.prol.preheader ]
  %.2101.prol = phi double [ %78, %.lr.ph103.prol ], [ %71, %.lr.ph103.prol.preheader ]
  %prol.iter185 = phi i64 [ %prol.iter185.sub, %.lr.ph103.prol ], [ %xtraiter183, %.lr.ph103.prol.preheader ]
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv142, i64 %indvars.iv133.prol
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %4, i64 %indvars.iv133.prol
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fsub double %.2101.prol, %77
  %indvars.iv.next134.prol = add nuw nsw i64 %indvars.iv133.prol, 1
  %prol.iter185.sub = add i64 %prol.iter185, -1
  %prol.iter185.cmp = icmp eq i64 %prol.iter185.sub, 0
  br i1 %prol.iter185.cmp, label %.lr.ph103.prol.loopexit.unr-lcssa, label %.lr.ph103.prol, !llvm.loop !20

.lr.ph103.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph103.prol
  br label %.lr.ph103.prol.loopexit

.lr.ph103.prol.loopexit:                          ; preds = %.lr.ph103.preheader, %.lr.ph103.prol.loopexit.unr-lcssa
  %.lcssa180.unr = phi double [ undef, %.lr.ph103.preheader ], [ %78, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %indvars.iv133.unr = phi i64 [ 0, %.lr.ph103.preheader ], [ %indvars.iv.next134.prol, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %.2101.unr = phi double [ %71, %.lr.ph103.preheader ], [ %78, %.lr.ph103.prol.loopexit.unr-lcssa ]
  %79 = icmp ult i64 %69, 3
  br i1 %79, label %._crit_edge104.loopexit, label %.lr.ph103.preheader.new

.lr.ph103.preheader.new:                          ; preds = %.lr.ph103.prol.loopexit
  br label %.lr.ph103

.lr.ph103:                                        ; preds = %.lr.ph103, %.lr.ph103.preheader.new
  %indvars.iv133 = phi i64 [ %indvars.iv133.unr, %.lr.ph103.preheader.new ], [ %indvars.iv.next134.3, %.lr.ph103 ]
  %.2101 = phi double [ %.2101.unr, %.lr.ph103.preheader.new ], [ %101, %.lr.ph103 ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv142, i64 %indvars.iv133
  %81 = bitcast double* %80 to <2 x double>*
  %82 = getelementptr inbounds double, double* %4, i64 %indvars.iv133
  %83 = bitcast double* %82 to <2 x double>*
  %84 = load <2 x double>, <2 x double>* %81, align 8
  %85 = load <2 x double>, <2 x double>* %83, align 8
  %86 = fmul <2 x double> %84, %85
  %87 = extractelement <2 x double> %86, i32 0
  %88 = extractelement <2 x double> %86, i32 1
  %89 = fsub double %.2101, %87
  %90 = fsub double %89, %88
  %indvars.iv.next134.1 = add nsw i64 %indvars.iv133, 2
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv142, i64 %indvars.iv.next134.1
  %92 = bitcast double* %91 to <2 x double>*
  %93 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next134.1
  %94 = bitcast double* %93 to <2 x double>*
  %indvars.iv.next134.2 = add nsw i64 %indvars.iv133, 3
  %95 = load <2 x double>, <2 x double>* %92, align 8
  %96 = load <2 x double>, <2 x double>* %94, align 8
  %97 = fmul <2 x double> %95, %96
  %98 = extractelement <2 x double> %97, i32 0
  %99 = extractelement <2 x double> %97, i32 1
  %100 = fsub double %90, %98
  %101 = fsub double %100, %99
  %exitcond141.3 = icmp eq i64 %indvars.iv.next134.2, %wide.trip.count140
  %indvars.iv.next134.3 = add nsw i64 %indvars.iv133, 4
  br i1 %exitcond141.3, label %._crit_edge104.loopexit.unr-lcssa, label %.lr.ph103

._crit_edge104.loopexit.unr-lcssa:                ; preds = %.lr.ph103
  br label %._crit_edge104.loopexit

._crit_edge104.loopexit:                          ; preds = %.lr.ph103.prol.loopexit, %._crit_edge104.loopexit.unr-lcssa
  %.lcssa180 = phi double [ %.lcssa180.unr, %.lr.ph103.prol.loopexit ], [ %101, %._crit_edge104.loopexit.unr-lcssa ]
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.loopexit, %.preheader93
  %.2.lcssa = phi double [ %71, %.preheader93 ], [ %.lcssa180, %._crit_edge104.loopexit ]
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv142
  store double %.2.lcssa, double* %102, align 8
  %indvars.iv.next143 = add nuw i64 %indvars.iv142, 1
  %103 = icmp slt i64 %indvars.iv.next143, 2000
  %indvars.iv.next139 = add nsw i32 %indvars.iv138, 1
  br i1 %103, label %.preheader93, label %.preheader.preheader

.preheader.preheader:                             ; preds = %._crit_edge104
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge..preheader_crit_edge
  %indvar = phi i32 [ 0, %.preheader.preheader ], [ %indvar.next, %._crit_edge..preheader_crit_edge ]
  %indvars.iv131 = phi i64 [ 1999, %.preheader.preheader ], [ %indvars.iv.next132, %._crit_edge..preheader_crit_edge ]
  %indvars.iv = phi i32 [ 2000, %.preheader.preheader ], [ %indvars.iv.next, %._crit_edge..preheader_crit_edge ]
  %104 = sub i32 2000, %indvar
  %105 = sext i32 %104 to i64
  %106 = sub nsw i64 1999, %105
  %107 = getelementptr inbounds double, double* %4, i64 %indvars.iv131
  %108 = load double, double* %107, align 8
  %109 = icmp slt i32 %indvars.iv, 2000
  br i1 %109, label %.preheader..lr.ph_crit_edge, label %._crit_edge

.preheader..lr.ph_crit_edge:                      ; preds = %.preheader
  %110 = sext i32 %indvars.iv to i64
  %111 = sub nsw i64 0, %105
  %xtraiter = and i64 %111, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.preheader..lr.ph_crit_edge
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol, %.lr.ph.prol.preheader
  %indvars.iv129.prol = phi i64 [ %indvars.iv.next130.prol, %.lr.ph.prol ], [ %110, %.lr.ph.prol.preheader ]
  %.397.prol = phi double [ %117, %.lr.ph.prol ], [ %108, %.lr.ph.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv129.prol
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %3, i64 %indvars.iv129.prol
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fsub double %.397.prol, %116
  %indvars.iv.next130.prol = add nsw i64 %indvars.iv129.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol, !llvm.loop !22

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.preheader..lr.ph_crit_edge, %.lr.ph.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.preheader..lr.ph_crit_edge ], [ %117, %.lr.ph.prol.loopexit.unr-lcssa ]
  %indvars.iv129.unr = phi i64 [ %110, %.preheader..lr.ph_crit_edge ], [ %indvars.iv.next130.prol, %.lr.ph.prol.loopexit.unr-lcssa ]
  %.397.unr = phi double [ %108, %.preheader..lr.ph_crit_edge ], [ %117, %.lr.ph.prol.loopexit.unr-lcssa ]
  %118 = icmp ult i64 %106, 3
  br i1 %118, label %._crit_edge.loopexit, label %.preheader..lr.ph_crit_edge.new

.preheader..lr.ph_crit_edge.new:                  ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.preheader..lr.ph_crit_edge.new
  %indvars.iv129 = phi i64 [ %indvars.iv129.unr, %.preheader..lr.ph_crit_edge.new ], [ %indvars.iv.next130.3, %.lr.ph ]
  %.397 = phi double [ %.397.unr, %.preheader..lr.ph_crit_edge.new ], [ %140, %.lr.ph ]
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv129
  %120 = bitcast double* %119 to <2 x double>*
  %121 = getelementptr inbounds double, double* %3, i64 %indvars.iv129
  %122 = bitcast double* %121 to <2 x double>*
  %123 = load <2 x double>, <2 x double>* %120, align 8
  %124 = load <2 x double>, <2 x double>* %122, align 8
  %125 = fmul <2 x double> %123, %124
  %126 = extractelement <2 x double> %125, i32 0
  %127 = extractelement <2 x double> %125, i32 1
  %128 = fsub double %.397, %126
  %129 = fsub double %128, %127
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, 2
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv.next130.1
  %131 = bitcast double* %130 to <2 x double>*
  %132 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next130.1
  %133 = bitcast double* %132 to <2 x double>*
  %indvars.iv.next130.2 = add nsw i64 %indvars.iv129, 3
  %134 = load <2 x double>, <2 x double>* %131, align 8
  %135 = load <2 x double>, <2 x double>* %133, align 8
  %136 = fmul <2 x double> %134, %135
  %137 = extractelement <2 x double> %136, i32 0
  %138 = extractelement <2 x double> %136, i32 1
  %139 = fsub double %129, %137
  %140 = fsub double %139, %138
  %exitcond.3 = icmp eq i64 %indvars.iv.next130.2, 1999
  %indvars.iv.next130.3 = add nsw i64 %indvars.iv129, 4
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %140, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.3.lcssa = phi double [ %108, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv131, i64 %indvars.iv131
  %142 = load double, double* %141, align 8
  %143 = fdiv double %.3.lcssa, %142
  %144 = getelementptr inbounds double, double* %3, i64 %indvars.iv131
  store double %143, double* %144, align 8
  %145 = icmp sgt i64 %indvars.iv131, 0
  br i1 %145, label %._crit_edge..preheader_crit_edge, label %146

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next132 = add i64 %indvars.iv131, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %.preheader

; <label>:146:                                    ; preds = %._crit_edge
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
