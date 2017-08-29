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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
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
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %._crit_edge95

._crit_edge95:                                    ; preds = %._crit_edge95, %5
  %indvars.iv143 = phi i64 [ 0, %5 ], [ %indvars.iv.next144.1, %._crit_edge95 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv143
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv143
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next144 = or i64 %indvars.iv143, 1
  %10 = trunc i64 %indvars.iv.next144 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv143
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next144.1 = add nsw i64 %indvars.iv143, 2
  %13 = trunc i64 %indvars.iv.next144.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond145.1 = icmp eq i64 %indvars.iv.next144, 1999
  br i1 %exitcond145.1, label %.lr.ph.preheader, label %._crit_edge95

.lr.ph.preheader:                                 ; preds = %._crit_edge95
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge92._crit_edge
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge92._crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv141, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %22
  %23 = sub i64 1998, %indvars.iv141
  %24 = shl i64 %23, 3
  %25 = and i64 %24, 34359738360
  %26 = add nuw nsw i64 %25, 8
  br label %27

; <label>:27:                                     ; preds = %27, %.lr.ph
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %27 ], [ 0, %.lr.ph ]
  %28 = sub nsw i64 0, %indvars.iv124
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv124
  store double %33, double* %34, align 8
  %exitcond132 = icmp eq i64 %indvars.iv124, %indvars.iv141
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  br i1 %exitcond132, label %._crit_edge, label %27

._crit_edge:                                      ; preds = %27
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %35 = icmp slt i64 %indvars.iv.next142, 2000
  br i1 %35, label %._crit_edge92._crit_edge, label %38

._crit_edge92._crit_edge:                         ; preds = %._crit_edge
  %36 = bitcast double* %scevgep139 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %36, i8 0, i64 %26, i32 8, i1 false)
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %37, align 8
  br label %.lr.ph

; <label>:38:                                     ; preds = %._crit_edge
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %39, align 8
  %40 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %41

; <label>:41:                                     ; preds = %41, %38
  %indvars.iv122 = phi i64 [ 0, %38 ], [ %indvars.iv.next123.7, %41 ]
  %42 = mul nuw nsw i64 %indvars.iv122, 16000
  %scevgep = getelementptr i8, i8* %40, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123 = or i64 %indvars.iv122, 1
  %43 = mul nuw nsw i64 %indvars.iv.next123, 16000
  %scevgep.1 = getelementptr i8, i8* %40, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.1 = or i64 %indvars.iv122, 2
  %44 = mul nuw nsw i64 %indvars.iv.next123.1, 16000
  %scevgep.2 = getelementptr i8, i8* %40, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.2 = or i64 %indvars.iv122, 3
  %45 = mul nuw nsw i64 %indvars.iv.next123.2, 16000
  %scevgep.3 = getelementptr i8, i8* %40, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.3 = or i64 %indvars.iv122, 4
  %46 = mul nuw nsw i64 %indvars.iv.next123.3, 16000
  %scevgep.4 = getelementptr i8, i8* %40, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.4 = or i64 %indvars.iv122, 5
  %47 = mul nuw nsw i64 %indvars.iv.next123.4, 16000
  %scevgep.5 = getelementptr i8, i8* %40, i64 %47
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.5 = or i64 %indvars.iv122, 6
  %48 = mul nuw nsw i64 %indvars.iv.next123.5, 16000
  %scevgep.6 = getelementptr i8, i8* %40, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next123.6 = or i64 %indvars.iv122, 7
  %49 = mul nuw nsw i64 %indvars.iv.next123.6, 16000
  %scevgep.7 = getelementptr i8, i8* %40, i64 %49
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond146.7 = icmp eq i64 %indvars.iv.next123.6, 1999
  %indvars.iv.next123.7 = add nsw i64 %indvars.iv122, 8
  br i1 %exitcond146.7, label %._crit_edge104.preheader, label %41

._crit_edge104.preheader:                         ; preds = %41
  %50 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %52 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %._crit_edge104.preheader, %99
  %indvars.iv117 = phi i64 [ %53, %99 ], [ 0, %._crit_edge104.preheader ]
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv117
  %scevgep149150 = bitcast double* %scevgep149 to i8*
  %53 = add i64 %indvars.iv117, 1
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %53
  %scevgep151152 = bitcast double* %scevgep151 to i8*
  br label %._crit_edge103

._crit_edge103:                                   ; preds = %middle.block, %._crit_edge104
  %indvars.iv115 = phi i64 [ 0, %._crit_edge104 ], [ %indvars.iv.next116, %middle.block ]
  %54 = mul i64 %indvars.iv115, 16000
  %scevgep147 = getelementptr i8, i8* %40, i64 %54
  %55 = add i64 %54, 16000
  %scevgep148 = getelementptr i8, i8* %40, i64 %55
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv115, i64 %indvars.iv117
  %bound0 = icmp ult i8* %scevgep147, %scevgep151152
  %bound1 = icmp ult i8* %scevgep149150, %scevgep148
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %56 to i8*
  %bound0154 = icmp ult i8* %scevgep147, %bc
  %bound1155 = icmp ult i8* %bc, %scevgep148
  %found.conflict156 = and i1 %bound0154, %bound1155
  %conflict.rdx = or i1 %found.conflict, %found.conflict156
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge103
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge103
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %57 = or i64 %index, 1
  %58 = or i64 %index, 2
  %59 = or i64 %index, 3
  %60 = load double, double* %56, align 8, !alias.scope !1
  %61 = insertelement <2 x double> undef, double %60, i32 0
  %62 = shufflevector <2 x double> %61, <2 x double> undef, <2 x i32> zeroinitializer
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv117
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv117
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %58, i64 %indvars.iv117
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %59, i64 %indvars.iv117
  %67 = load double, double* %63, align 8, !alias.scope !4
  %68 = load double, double* %64, align 8, !alias.scope !4
  %69 = load double, double* %65, align 8, !alias.scope !4
  %70 = load double, double* %66, align 8, !alias.scope !4
  %71 = insertelement <2 x double> undef, double %67, i32 0
  %72 = insertelement <2 x double> %71, double %68, i32 1
  %73 = insertelement <2 x double> undef, double %69, i32 0
  %74 = insertelement <2 x double> %73, double %70, i32 1
  %75 = fmul <2 x double> %62, %72
  %76 = fmul <2 x double> %62, %74
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv115, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %81 = fadd <2 x double> %wide.load, %75
  %82 = fadd <2 x double> %wide.load158, %76
  store <2 x double> %81, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %82, <2 x double>* %80, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %83 = icmp eq i64 %index.next, 2000
  br i1 %83, label %middle.block.loopexit188, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv112 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next113.1, %scalar.ph ]
  %84 = load double, double* %56, align 8
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv112, i64 %indvars.iv117
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv115, i64 %indvars.iv112
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  store double %90, double* %88, align 8
  %indvars.iv.next113 = or i64 %indvars.iv112, 1
  %91 = load double, double* %56, align 8
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next113, i64 %indvars.iv117
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv115, i64 %indvars.iv.next113
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  store double %97, double* %95, align 8
  %exitcond114.1 = icmp eq i64 %indvars.iv.next113, 1999
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  br i1 %exitcond114.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit188:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit188, %middle.block.loopexit
  %indvars.iv.next116 = add nuw i64 %indvars.iv115, 1
  %98 = icmp slt i64 %indvars.iv.next116, 2000
  br i1 %98, label %._crit_edge103, label %99

; <label>:99:                                     ; preds = %middle.block
  %100 = icmp slt i64 %53, 2000
  br i1 %100, label %._crit_edge104, label %._crit_edge106.preheader

._crit_edge106.preheader:                         ; preds = %99
  %101 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %106 = bitcast i8* %40 to [2000 x [2000 x double]]*
  %107 = bitcast i8* %40 to [2000 x [2000 x double]]*
  br label %._crit_edge106

._crit_edge106:                                   ; preds = %._crit_edge106.preheader, %middle.block160
  %indvars.iv110 = phi i64 [ %108, %middle.block160 ], [ 0, %._crit_edge106.preheader ]
  %scevgep164 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 0
  %scevgep164165 = bitcast double* %scevgep164 to i8*
  %108 = add i64 %indvars.iv110, 1
  %scevgep166 = getelementptr [2000 x double], [2000 x double]* %1, i64 %108, i64 0
  %scevgep166167 = bitcast double* %scevgep166 to i8*
  %109 = mul i64 %indvars.iv110, 16000
  %scevgep168 = getelementptr i8, i8* %40, i64 %109
  %110 = add i64 %109, 16000
  %scevgep169 = getelementptr i8, i8* %40, i64 %110
  %bound0170 = icmp ult i8* %scevgep164165, %scevgep169
  %bound1171 = icmp ult i8* %scevgep168, %scevgep166167
  %memcheck.conflict173 = and i1 %bound0170, %bound1171
  br i1 %memcheck.conflict173, label %scalar.ph161.preheader, label %vector.body159.preheader

vector.body159.preheader:                         ; preds = %._crit_edge106
  br label %vector.body159

scalar.ph161.preheader:                           ; preds = %._crit_edge106
  br label %scalar.ph161

vector.body159:                                   ; preds = %vector.body159, %vector.body159.preheader
  %index176 = phi i64 [ 0, %vector.body159.preheader ], [ %index.next177.1, %vector.body159 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv110, i64 %index176
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load184 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load185 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !13
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %index176
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load184, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load185, <2 x i64>* %118, align 8, !alias.scope !16, !noalias !13
  %index.next177 = or i64 %index176, 4
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %107, i64 0, i64 %indvars.iv110, i64 %index.next177
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load184.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  %wide.load185.1 = load <2 x i64>, <2 x i64>* %122, align 8, !alias.scope !13
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %index.next177
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load184.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x i64>*
  store <2 x i64> %wide.load185.1, <2 x i64>* %126, align 8, !alias.scope !16, !noalias !13
  %index.next177.1 = add nsw i64 %index176, 8
  %127 = icmp eq i64 %index.next177.1, 2000
  br i1 %127, label %middle.block160.loopexit187, label %vector.body159, !llvm.loop !18

scalar.ph161:                                     ; preds = %scalar.ph161, %scalar.ph161.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph161.preheader ], [ %indvars.iv.next.4, %scalar.ph161 ]
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv110, i64 %indvars.iv
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %133 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next
  %134 = bitcast double* %133 to i64*
  %135 = load i64, i64* %134, align 8
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv.next
  %137 = bitcast double* %136 to i64*
  store i64 %135, i64* %137, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %138 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to i64*
  %140 = load i64, i64* %139, align 8
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv.next.1
  %142 = bitcast double* %141 to i64*
  store i64 %140, i64* %142, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %143 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.2
  %144 = bitcast double* %143 to i64*
  %145 = load i64, i64* %144, align 8
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv.next.2
  %147 = bitcast double* %146 to i64*
  store i64 %145, i64* %147, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %148 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv110, i64 %indvars.iv.next.3
  %149 = bitcast double* %148 to i64*
  %150 = load i64, i64* %149, align 8
  %151 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv.next.3
  %152 = bitcast double* %151 to i64*
  store i64 %150, i64* %152, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block160.loopexit, label %scalar.ph161, !llvm.loop !19

middle.block160.loopexit:                         ; preds = %scalar.ph161
  br label %middle.block160

middle.block160.loopexit187:                      ; preds = %vector.body159
  br label %middle.block160

middle.block160:                                  ; preds = %middle.block160.loopexit187, %middle.block160.loopexit
  %153 = icmp slt i64 %108, 2000
  br i1 %153, label %._crit_edge106, label %154

; <label>:154:                                    ; preds = %middle.block160
  tail call void @free(i8* nonnull %40) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %6

; <label>:6:                                      ; preds = %._crit_edge122, %5
  %indvars.iv184 = phi i64 [ %indvars.iv.next185, %._crit_edge122 ], [ 4294967295, %5 ]
  %indvars.iv176 = phi i64 [ %indvars.iv.next177, %._crit_edge122 ], [ 0, %5 ]
  %7 = and i64 %indvars.iv184, 4294967295
  %8 = icmp sgt i64 %indvars.iv176, 0
  br i1 %8, label %.lr.ph111.preheader, label %._crit_edge122

.lr.ph111.preheader:                              ; preds = %6
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 0
  br label %.lr.ph111

.lr.ph111:                                        ; preds = %.lr.ph111.preheader, %._crit_edge107
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge107 ], [ 4294967295, %.lr.ph111.preheader ]
  %indvars.iv160 = phi i64 [ %indvars.iv.next161, %._crit_edge107 ], [ 0, %.lr.ph111.preheader ]
  %10 = and i64 %indvars.iv181, 4294967295
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv160
  %12 = load double, double* %11, align 8
  %13 = icmp sgt i64 %indvars.iv160, 0
  br i1 %13, label %.lr.ph106.preheader, label %._crit_edge107

.lr.ph106.preheader:                              ; preds = %.lr.ph111
  %14 = and i64 %indvars.iv181, 1
  %lcmp.mod204 = icmp eq i64 %14, 0
  br i1 %lcmp.mod204, label %.lr.ph106.prol.preheader, label %.lr.ph106.prol.loopexit.unr-lcssa

.lr.ph106.prol.preheader:                         ; preds = %.lr.ph106.preheader
  br label %.lr.ph106.prol

.lr.ph106.prol:                                   ; preds = %.lr.ph106.prol.preheader
  %15 = load double, double* %9, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv160
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %12, %18
  br label %.lr.ph106.prol.loopexit.unr-lcssa

.lr.ph106.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph106.preheader, %.lr.ph106.prol
  %.lcssa198.unr.ph = phi double [ %19, %.lr.ph106.prol ], [ undef, %.lr.ph106.preheader ]
  %indvars.iv151.unr.ph = phi i64 [ 1, %.lr.ph106.prol ], [ 0, %.lr.ph106.preheader ]
  %.0104.unr.ph = phi double [ %19, %.lr.ph106.prol ], [ %12, %.lr.ph106.preheader ]
  br label %.lr.ph106.prol.loopexit

.lr.ph106.prol.loopexit:                          ; preds = %.lr.ph106.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %10, 0
  br i1 %20, label %._crit_edge107.loopexit, label %.lr.ph106.preheader.new

.lr.ph106.preheader.new:                          ; preds = %.lr.ph106.prol.loopexit
  br label %.lr.ph106

.lr.ph106:                                        ; preds = %.lr.ph106, %.lr.ph106.preheader.new
  %indvars.iv151 = phi i64 [ %indvars.iv151.unr.ph, %.lr.ph106.preheader.new ], [ %indvars.iv.next152.1, %.lr.ph106 ]
  %.0104 = phi double [ %.0104.unr.ph, %.lr.ph106.preheader.new ], [ %34, %.lr.ph106 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv151
  %22 = bitcast double* %21 to <2 x double>*
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv151, i64 %indvars.iv160
  %24 = load double, double* %23, align 8
  %indvars.iv.next152 = add nuw nsw i64 %indvars.iv151, 1
  %25 = load <2 x double>, <2 x double>* %22, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next152, i64 %indvars.iv160
  %27 = load double, double* %26, align 8
  %28 = insertelement <2 x double> undef, double %24, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %25, %29
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fsub double %.0104, %31
  %34 = fsub double %33, %32
  %exitcond183.1 = icmp eq i64 %indvars.iv.next152, %10
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv151, 2
  br i1 %exitcond183.1, label %._crit_edge107.loopexit.unr-lcssa, label %.lr.ph106

._crit_edge107.loopexit.unr-lcssa:                ; preds = %.lr.ph106
  br label %._crit_edge107.loopexit

._crit_edge107.loopexit:                          ; preds = %.lr.ph106.prol.loopexit, %._crit_edge107.loopexit.unr-lcssa
  %.lcssa198 = phi double [ %.lcssa198.unr.ph, %.lr.ph106.prol.loopexit ], [ %34, %._crit_edge107.loopexit.unr-lcssa ]
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.loopexit, %.lr.ph111
  %.0.lcssa = phi double [ %12, %.lr.ph111 ], [ %.lcssa198, %._crit_edge107.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv160, i64 %indvars.iv160
  %36 = load double, double* %35, align 8
  %37 = fdiv double %.0.lcssa, %36
  store double %37, double* %11, align 8
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %38 = icmp slt i64 %indvars.iv.next161, %indvars.iv176
  %indvars.iv.next182 = add nuw nsw i64 %10, 1
  br i1 %38, label %.lr.ph111, label %.lr.ph121

.lr.ph121:                                        ; preds = %._crit_edge107
  br i1 true, label %.lr.ph121.split.us.preheader, label %.lr.ph121.._crit_edge122_crit_edge

.lr.ph121.._crit_edge122_crit_edge:               ; preds = %.lr.ph121
  br label %._crit_edge122

.lr.ph121.split.us.preheader:                     ; preds = %.lr.ph121
  %39 = and i64 %indvars.iv184, 1
  %lcmp.mod208 = icmp eq i64 %39, 0
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 0
  %41 = icmp eq i64 %7, 0
  br label %.lr.ph121.split.us

.lr.ph121.split.us:                               ; preds = %.lr.ph121.split.us.preheader, %._crit_edge117.us
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %._crit_edge117.us ], [ %indvars.iv176, %.lr.ph121.split.us.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv174
  %43 = load double, double* %42, align 8
  br i1 %lcmp.mod208, label %.prol.preheader205, label %.prol.loopexit206.unr-lcssa

.prol.preheader205:                               ; preds = %.lr.ph121.split.us
  br label %44

; <label>:44:                                     ; preds = %.prol.preheader205
  %45 = load double, double* %40, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv174
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  br label %.prol.loopexit206.unr-lcssa

.prol.loopexit206.unr-lcssa:                      ; preds = %.lr.ph121.split.us, %44
  %.lcssa199.unr.ph = phi double [ %49, %44 ], [ undef, %.lr.ph121.split.us ]
  %indvars.iv163.unr.ph = phi i64 [ 1, %44 ], [ 0, %.lr.ph121.split.us ]
  %.1114.us.unr.ph = phi double [ %49, %44 ], [ %43, %.lr.ph121.split.us ]
  br label %.prol.loopexit206

.prol.loopexit206:                                ; preds = %.prol.loopexit206.unr-lcssa
  br i1 %41, label %._crit_edge117.us, label %.lr.ph121.split.us.new

.lr.ph121.split.us.new:                           ; preds = %.prol.loopexit206
  br label %50

; <label>:50:                                     ; preds = %50, %.lr.ph121.split.us.new
  %indvars.iv163 = phi i64 [ %indvars.iv163.unr.ph, %.lr.ph121.split.us.new ], [ %indvars.iv.next164.1, %50 ]
  %.1114.us = phi double [ %.1114.us.unr.ph, %.lr.ph121.split.us.new ], [ %64, %50 ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv163
  %52 = bitcast double* %51 to <2 x double>*
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv163, i64 %indvars.iv174
  %54 = load double, double* %53, align 8
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %55 = load <2 x double>, <2 x double>* %52, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next164, i64 %indvars.iv174
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %55, %59
  %61 = extractelement <2 x double> %60, i32 0
  %62 = extractelement <2 x double> %60, i32 1
  %63 = fsub double %.1114.us, %61
  %64 = fsub double %63, %62
  %exitcond186.1 = icmp eq i64 %indvars.iv.next164, %7
  %indvars.iv.next164.1 = add nsw i64 %indvars.iv163, 2
  br i1 %exitcond186.1, label %._crit_edge117.us.unr-lcssa, label %50

._crit_edge117.us.unr-lcssa:                      ; preds = %50
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %.prol.loopexit206, %._crit_edge117.us.unr-lcssa
  %.lcssa199 = phi double [ %.lcssa199.unr.ph, %.prol.loopexit206 ], [ %64, %._crit_edge117.us.unr-lcssa ]
  store double %.lcssa199, double* %42, align 8
  %indvars.iv.next175 = add nuw i64 %indvars.iv174, 1
  %65 = icmp slt i64 %indvars.iv.next175, 2000
  br i1 %65, label %.lr.ph121.split.us, label %._crit_edge122.loopexit

._crit_edge122.loopexit:                          ; preds = %._crit_edge117.us
  br label %._crit_edge122

._crit_edge122:                                   ; preds = %.lr.ph121.._crit_edge122_crit_edge, %._crit_edge122.loopexit, %6
  %indvars.iv.next177 = add nuw i64 %indvars.iv176, 1
  %66 = icmp slt i64 %indvars.iv.next177, 2000
  %indvars.iv.next185 = add nuw nsw i64 %7, 1
  br i1 %66, label %6, label %._crit_edge122._crit_edge127.preheader

._crit_edge122._crit_edge127.preheader:           ; preds = %._crit_edge122
  br label %._crit_edge122._crit_edge127

._crit_edge122._crit_edge127:                     ; preds = %._crit_edge122._crit_edge127.preheader, %._crit_edge100
  %indvars.iv178 = phi i64 [ %indvars.iv.next179, %._crit_edge100 ], [ 4294967295, %._crit_edge122._crit_edge127.preheader ]
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %._crit_edge100 ], [ 0, %._crit_edge122._crit_edge127.preheader ]
  %67 = and i64 %indvars.iv178, 4294967295
  %68 = getelementptr inbounds double, double* %2, i64 %indvars.iv149
  %69 = load double, double* %68, align 8
  %70 = icmp sgt i64 %indvars.iv149, 0
  br i1 %70, label %.lr.ph99.preheader, label %._crit_edge100

.lr.ph99.preheader:                               ; preds = %._crit_edge122._crit_edge127
  %71 = add nsw i64 %indvars.iv178, 1
  %xtraiter200 = and i64 %71, 3
  %lcmp.mod201 = icmp eq i64 %xtraiter200, 0
  br i1 %lcmp.mod201, label %.lr.ph99.prol.loopexit, label %.lr.ph99.prol.preheader

.lr.ph99.prol.preheader:                          ; preds = %.lr.ph99.preheader
  br label %.lr.ph99.prol

.lr.ph99.prol:                                    ; preds = %.lr.ph99.prol, %.lr.ph99.prol.preheader
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %.lr.ph99.prol ], [ 0, %.lr.ph99.prol.preheader ]
  %.297.prol = phi double [ %77, %.lr.ph99.prol ], [ %69, %.lr.ph99.prol.preheader ]
  %prol.iter202 = phi i64 [ %prol.iter202.sub, %.lr.ph99.prol ], [ %xtraiter200, %.lr.ph99.prol.preheader ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140.prol
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds double, double* %4, i64 %indvars.iv140.prol
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fsub double %.297.prol, %76
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter202.sub = add i64 %prol.iter202, -1
  %prol.iter202.cmp = icmp eq i64 %prol.iter202.sub, 0
  br i1 %prol.iter202.cmp, label %.lr.ph99.prol.loopexit.unr-lcssa, label %.lr.ph99.prol, !llvm.loop !20

.lr.ph99.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph99.prol
  br label %.lr.ph99.prol.loopexit

.lr.ph99.prol.loopexit:                           ; preds = %.lr.ph99.preheader, %.lr.ph99.prol.loopexit.unr-lcssa
  %.lcssa197.unr = phi double [ undef, %.lr.ph99.preheader ], [ %77, %.lr.ph99.prol.loopexit.unr-lcssa ]
  %indvars.iv140.unr = phi i64 [ 0, %.lr.ph99.preheader ], [ %indvars.iv.next141.prol, %.lr.ph99.prol.loopexit.unr-lcssa ]
  %.297.unr = phi double [ %69, %.lr.ph99.preheader ], [ %77, %.lr.ph99.prol.loopexit.unr-lcssa ]
  %78 = icmp ult i64 %67, 3
  br i1 %78, label %._crit_edge100.loopexit, label %.lr.ph99.preheader.new

.lr.ph99.preheader.new:                           ; preds = %.lr.ph99.prol.loopexit
  br label %.lr.ph99

.lr.ph99:                                         ; preds = %.lr.ph99, %.lr.ph99.preheader.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %.lr.ph99.preheader.new ], [ %indvars.iv.next141.3, %.lr.ph99 ]
  %.297 = phi double [ %.297.unr, %.lr.ph99.preheader.new ], [ %100, %.lr.ph99 ]
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv140
  %80 = bitcast double* %79 to <2 x double>*
  %81 = getelementptr inbounds double, double* %4, i64 %indvars.iv140
  %82 = bitcast double* %81 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %80, align 8
  %84 = load <2 x double>, <2 x double>* %82, align 8
  %85 = fmul <2 x double> %83, %84
  %86 = extractelement <2 x double> %85, i32 0
  %87 = extractelement <2 x double> %85, i32 1
  %88 = fsub double %.297, %86
  %89 = fsub double %88, %87
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv.next141.1
  %91 = bitcast double* %90 to <2 x double>*
  %92 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next141.1
  %93 = bitcast double* %92 to <2 x double>*
  %indvars.iv.next141.2 = add nsw i64 %indvars.iv140, 3
  %94 = load <2 x double>, <2 x double>* %91, align 8
  %95 = load <2 x double>, <2 x double>* %93, align 8
  %96 = fmul <2 x double> %94, %95
  %97 = extractelement <2 x double> %96, i32 0
  %98 = extractelement <2 x double> %96, i32 1
  %99 = fsub double %89, %97
  %100 = fsub double %99, %98
  %exitcond180.3 = icmp eq i64 %indvars.iv.next141.2, %67
  %indvars.iv.next141.3 = add nsw i64 %indvars.iv140, 4
  br i1 %exitcond180.3, label %._crit_edge100.loopexit.unr-lcssa, label %.lr.ph99

._crit_edge100.loopexit.unr-lcssa:                ; preds = %.lr.ph99
  br label %._crit_edge100.loopexit

._crit_edge100.loopexit:                          ; preds = %.lr.ph99.prol.loopexit, %._crit_edge100.loopexit.unr-lcssa
  %.lcssa197 = phi double [ %.lcssa197.unr, %.lr.ph99.prol.loopexit ], [ %100, %._crit_edge100.loopexit.unr-lcssa ]
  br label %._crit_edge100

._crit_edge100:                                   ; preds = %._crit_edge100.loopexit, %._crit_edge122._crit_edge127
  %.2.lcssa = phi double [ %69, %._crit_edge122._crit_edge127 ], [ %.lcssa197, %._crit_edge100.loopexit ]
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv149
  store double %.2.lcssa, double* %101, align 8
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %102 = icmp slt i64 %indvars.iv.next150, 2000
  %indvars.iv.next179 = add nuw nsw i64 %67, 1
  br i1 %102, label %._crit_edge122._crit_edge127, label %._crit_edge100._crit_edge130.preheader

._crit_edge100._crit_edge130.preheader:           ; preds = %._crit_edge100
  br label %._crit_edge100._crit_edge130

._crit_edge100._crit_edge130:                     ; preds = %._crit_edge100._crit_edge130.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge100._crit_edge130.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv138 = phi i64 [ 1999, %._crit_edge100._crit_edge130.preheader ], [ %indvars.iv.next139, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge100._crit_edge130.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %103 = sub i32 2000, %indvar
  %104 = sext i32 %103 to i64
  %105 = sub nsw i64 1999, %104
  %106 = getelementptr inbounds double, double* %4, i64 %indvars.iv138
  %107 = load double, double* %106, align 8
  %108 = add nsw i64 %indvars.iv138, 1
  %109 = icmp slt i64 %108, 2000
  br i1 %109, label %.lr.ph, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %._crit_edge100._crit_edge130
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %111 = load double, double* %110, align 8
  %112 = fdiv double %107, %111
  %113 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %112, double* %113, align 8
  br label %._crit_edge._crit_edge

.lr.ph:                                           ; preds = %._crit_edge100._crit_edge130
  %114 = sext i32 %indvars.iv to i64
  %115 = sub nsw i64 0, %104
  %xtraiter = and i64 %115, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %116

; <label>:116:                                    ; preds = %116, %.prol.preheader
  %indvars.iv136.prol = phi i64 [ %indvars.iv.next137.prol, %116 ], [ %114, %.prol.preheader ]
  %.394.prol = phi double [ %122, %116 ], [ %107, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %116 ], [ %xtraiter, %.prol.preheader ]
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136.prol
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds double, double* %3, i64 %indvars.iv136.prol
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = fsub double %.394.prol, %121
  %indvars.iv.next137.prol = add nsw i64 %indvars.iv136.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %116, !llvm.loop !22

.prol.loopexit.unr-lcssa:                         ; preds = %116
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %122, %.prol.loopexit.unr-lcssa ]
  %indvars.iv136.unr = phi i64 [ %114, %.lr.ph ], [ %indvars.iv.next137.prol, %.prol.loopexit.unr-lcssa ]
  %.394.unr = phi double [ %107, %.lr.ph ], [ %122, %.prol.loopexit.unr-lcssa ]
  %123 = icmp ult i64 %105, 3
  br i1 %123, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %124

; <label>:124:                                    ; preds = %124, %.lr.ph.new
  %indvars.iv136 = phi i64 [ %indvars.iv136.unr, %.lr.ph.new ], [ %indvars.iv.next137.3, %124 ]
  %.394 = phi double [ %.394.unr, %.lr.ph.new ], [ %146, %124 ]
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv136
  %126 = bitcast double* %125 to <2 x double>*
  %127 = getelementptr inbounds double, double* %3, i64 %indvars.iv136
  %128 = bitcast double* %127 to <2 x double>*
  %129 = load <2 x double>, <2 x double>* %126, align 8
  %130 = load <2 x double>, <2 x double>* %128, align 8
  %131 = fmul <2 x double> %129, %130
  %132 = extractelement <2 x double> %131, i32 0
  %133 = extractelement <2 x double> %131, i32 1
  %134 = fsub double %.394, %132
  %135 = fsub double %134, %133
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2
  %136 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv.next137.1
  %137 = bitcast double* %136 to <2 x double>*
  %138 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next137.1
  %139 = bitcast double* %138 to <2 x double>*
  %indvars.iv.next137.2 = add nsw i64 %indvars.iv136, 3
  %140 = load <2 x double>, <2 x double>* %137, align 8
  %141 = load <2 x double>, <2 x double>* %139, align 8
  %142 = fmul <2 x double> %140, %141
  %143 = extractelement <2 x double> %142, i32 0
  %144 = extractelement <2 x double> %142, i32 1
  %145 = fsub double %135, %143
  %146 = fsub double %145, %144
  %exitcond.3 = icmp eq i64 %indvars.iv.next137.2, 1999
  %indvars.iv.next137.3 = add nsw i64 %indvars.iv136, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %124

._crit_edge.unr-lcssa:                            ; preds = %124
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %146, %._crit_edge.unr-lcssa ]
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv138, i64 %indvars.iv138
  %148 = load double, double* %147, align 8
  %149 = fdiv double %.lcssa, %148
  %150 = getelementptr inbounds double, double* %3, i64 %indvars.iv138
  store double %149, double* %150, align 8
  %151 = icmp sgt i64 %indvars.iv138, 0
  br i1 %151, label %._crit_edge._crit_edge, label %152

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next139 = add i64 %indvars.iv138, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge100._crit_edge130

; <label>:152:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
