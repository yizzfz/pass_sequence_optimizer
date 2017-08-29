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
  br label %._crit_edge96

._crit_edge96:                                    ; preds = %._crit_edge96, %5
  %indvars.iv134 = phi i64 [ 0, %5 ], [ %indvars.iv.next135.1, %._crit_edge96 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv134
  %7 = bitcast double* %6 to <2 x double>*
  %8 = getelementptr inbounds double, double* %4, i64 %indvars.iv134
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next135 = or i64 %indvars.iv134, 1
  %10 = trunc i64 %indvars.iv.next135 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv134
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next135.1 = add nsw i64 %indvars.iv134, 2
  %13 = trunc i64 %indvars.iv.next135.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %11, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 2.000000e+03, double 2.000000e+03>
  %18 = fmul <2 x double> %17, <double 5.000000e-01, double 5.000000e-01>
  %19 = fadd <2 x double> %18, <double 4.000000e+00, double 4.000000e+00>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond136.1 = icmp eq i64 %indvars.iv.next135, 1999
  br i1 %exitcond136.1, label %.lr.ph.preheader, label %._crit_edge96

.lr.ph.preheader:                                 ; preds = %._crit_edge96
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge93._crit_edge
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %._crit_edge93._crit_edge ], [ 0, %.lr.ph.preheader ]
  %21 = shl i64 %indvars.iv132, 32
  %sext = add i64 %21, 4294967296
  %22 = ashr exact i64 %sext, 32
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv132, i64 %22
  %23 = ashr exact i64 %sext, 29
  %24 = sub nsw i64 16000, %23
  br label %25

; <label>:25:                                     ; preds = %25, %.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %25 ], [ 0, %.lr.ph ]
  %26 = sub nsw i64 0, %indvars.iv122
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 2000
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.000000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv132, i64 %indvars.iv122
  store double %31, double* %32, align 8
  %exitcond126 = icmp eq i64 %indvars.iv122, %indvars.iv132
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br i1 %exitcond126, label %._crit_edge, label %25

._crit_edge:                                      ; preds = %25
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %33 = icmp slt i64 %indvars.iv.next133, 2000
  br i1 %33, label %._crit_edge93._crit_edge, label %36

._crit_edge93._crit_edge:                         ; preds = %._crit_edge
  %34 = bitcast double* %scevgep139 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %34, i8 0, i64 %24, i32 8, i1 false)
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv132, i64 %indvars.iv132
  store double 1.000000e+00, double* %35, align 8
  br label %.lr.ph

; <label>:36:                                     ; preds = %._crit_edge
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv132, i64 %indvars.iv132
  store double 1.000000e+00, double* %37, align 8
  %38 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge102

._crit_edge102:                                   ; preds = %._crit_edge102, %36
  %indvars.iv120 = phi i64 [ 0, %36 ], [ %indvars.iv.next121.7, %._crit_edge102 ]
  %39 = mul nuw nsw i64 %indvars.iv120, 16000
  %scevgep = getelementptr i8, i8* %38, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121 = or i64 %indvars.iv120, 1
  %40 = mul nuw nsw i64 %indvars.iv.next121, 16000
  %scevgep.1 = getelementptr i8, i8* %38, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.1 = or i64 %indvars.iv120, 2
  %41 = mul nuw nsw i64 %indvars.iv.next121.1, 16000
  %scevgep.2 = getelementptr i8, i8* %38, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.2 = or i64 %indvars.iv120, 3
  %42 = mul nuw nsw i64 %indvars.iv.next121.2, 16000
  %scevgep.3 = getelementptr i8, i8* %38, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.3 = or i64 %indvars.iv120, 4
  %43 = mul nuw nsw i64 %indvars.iv.next121.3, 16000
  %scevgep.4 = getelementptr i8, i8* %38, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.4 = or i64 %indvars.iv120, 5
  %44 = mul nuw nsw i64 %indvars.iv.next121.4, 16000
  %scevgep.5 = getelementptr i8, i8* %38, i64 %44
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.5 = or i64 %indvars.iv120, 6
  %45 = mul nuw nsw i64 %indvars.iv.next121.5, 16000
  %scevgep.6 = getelementptr i8, i8* %38, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.6 = or i64 %indvars.iv120, 7
  %46 = mul nuw nsw i64 %indvars.iv.next121.6, 16000
  %scevgep.7 = getelementptr i8, i8* %38, i64 %46
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next121.7 = add nsw i64 %indvars.iv120, 8
  %47 = icmp slt i64 %indvars.iv.next121.7, 2000
  br i1 %47, label %._crit_edge102, label %._crit_edge105.preheader

._crit_edge105.preheader:                         ; preds = %._crit_edge102
  %48 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %._crit_edge105

._crit_edge105:                                   ; preds = %._crit_edge105.preheader, %97
  %indvars.iv115 = phi i64 [ %51, %97 ], [ 0, %._crit_edge105.preheader ]
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv115
  %scevgep143144 = bitcast double* %scevgep143 to i8*
  %51 = add i64 %indvars.iv115, 1
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %51
  %scevgep145146 = bitcast double* %scevgep145 to i8*
  br label %._crit_edge104

._crit_edge104:                                   ; preds = %middle.block, %._crit_edge105
  %indvars.iv113 = phi i64 [ 0, %._crit_edge105 ], [ %indvars.iv.next114, %middle.block ]
  %52 = mul i64 %indvars.iv113, 16000
  %scevgep141 = getelementptr i8, i8* %38, i64 %52
  %53 = add i64 %52, 16000
  %scevgep142 = getelementptr i8, i8* %38, i64 %53
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv113, i64 %indvars.iv115
  %bound0 = icmp ult i8* %scevgep141, %scevgep145146
  %bound1 = icmp ult i8* %scevgep143144, %scevgep142
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %54 to i8*
  %bound0148 = icmp ult i8* %scevgep141, %bc
  %bound1149 = icmp ult i8* %bc, %scevgep142
  %found.conflict150 = and i1 %bound0148, %bound1149
  %conflict.rdx = or i1 %found.conflict, %found.conflict150
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge104
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge104
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %55 = or i64 %index, 1
  %56 = or i64 %index, 2
  %57 = or i64 %index, 3
  %58 = load double, double* %54, align 8, !alias.scope !1
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv115
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %55, i64 %indvars.iv115
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %56, i64 %indvars.iv115
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %57, i64 %indvars.iv115
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
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv113, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %79 = fadd <2 x double> %wide.load, %73
  %80 = fadd <2 x double> %wide.load152, %74
  store <2 x double> %79, <2 x double>* %76, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %80, <2 x double>* %78, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %81 = icmp eq i64 %index.next, 2000
  br i1 %81, label %middle.block.loopexit182, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv110 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next111.1, %scalar.ph ]
  %82 = load double, double* %54, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv110, i64 %indvars.iv115
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv113, i64 %indvars.iv110
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %indvars.iv.next111 = or i64 %indvars.iv110, 1
  %89 = load double, double* %54, align 8
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next111, i64 %indvars.iv115
  %91 = load double, double* %90, align 8
  %92 = fmul double %89, %91
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv113, i64 %indvars.iv.next111
  %94 = load double, double* %93, align 8
  %95 = fadd double %94, %92
  store double %95, double* %93, align 8
  %exitcond112.1 = icmp eq i64 %indvars.iv.next111, 1999
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  br i1 %exitcond112.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit182:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit182, %middle.block.loopexit
  %indvars.iv.next114 = add nuw i64 %indvars.iv113, 1
  %96 = icmp slt i64 %indvars.iv.next114, 2000
  br i1 %96, label %._crit_edge104, label %97

; <label>:97:                                     ; preds = %middle.block
  %98 = icmp slt i64 %51, 2000
  br i1 %98, label %._crit_edge105, label %._crit_edge107.preheader

._crit_edge107.preheader:                         ; preds = %97
  %99 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %100 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %101 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %102 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %103 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %104 = bitcast i8* %38 to [2000 x [2000 x double]]*
  %105 = bitcast i8* %38 to [2000 x [2000 x double]]*
  br label %._crit_edge107

._crit_edge107:                                   ; preds = %._crit_edge107.preheader, %middle.block154
  %indvars.iv108 = phi i64 [ %106, %middle.block154 ], [ 0, %._crit_edge107.preheader ]
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 0
  %scevgep158159 = bitcast double* %scevgep158 to i8*
  %106 = add i64 %indvars.iv108, 1
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %1, i64 %106, i64 0
  %scevgep160161 = bitcast double* %scevgep160 to i8*
  %107 = mul i64 %indvars.iv108, 16000
  %scevgep162 = getelementptr i8, i8* %38, i64 %107
  %108 = add i64 %107, 16000
  %scevgep163 = getelementptr i8, i8* %38, i64 %108
  %bound0164 = icmp ult i8* %scevgep158159, %scevgep163
  %bound1165 = icmp ult i8* %scevgep162, %scevgep160161
  %memcheck.conflict167 = and i1 %bound0164, %bound1165
  br i1 %memcheck.conflict167, label %scalar.ph155.preheader, label %vector.body153.preheader

vector.body153.preheader:                         ; preds = %._crit_edge107
  br label %vector.body153

scalar.ph155.preheader:                           ; preds = %._crit_edge107
  br label %scalar.ph155

vector.body153:                                   ; preds = %vector.body153, %vector.body153.preheader
  %index170 = phi i64 [ 0, %vector.body153.preheader ], [ %index.next171.1, %vector.body153 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv108, i64 %index170
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load178 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !13
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %index170
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load178, <2 x i64>* %114, align 8, !alias.scope !16, !noalias !13
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %index.next171 = or i64 %index170, 4
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %105, i64 0, i64 %indvars.iv108, i64 %index.next171
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load178.1 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !13
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %index.next171
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load178.1, <2 x i64>* %122, align 8, !alias.scope !16, !noalias !13
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %index.next171.1 = add nsw i64 %index170, 8
  %125 = icmp eq i64 %index.next171.1, 2000
  br i1 %125, label %middle.block154.loopexit181, label %vector.body153, !llvm.loop !18

scalar.ph155:                                     ; preds = %scalar.ph155, %scalar.ph155.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph155.preheader ], [ %indvars.iv.next.4, %scalar.ph155 ]
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv108, i64 %indvars.iv
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %136 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %137 = bitcast double* %136 to i64*
  %138 = load i64, i64* %137, align 8
  %139 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.1
  %140 = bitcast double* %139 to i64*
  store i64 %138, i64* %140, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %141 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %142 = bitcast double* %141 to i64*
  %143 = load i64, i64* %142, align 8
  %144 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.2
  %145 = bitcast double* %144 to i64*
  store i64 %143, i64* %145, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %146 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %147 = bitcast double* %146 to i64*
  %148 = load i64, i64* %147, align 8
  %149 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv108, i64 %indvars.iv.next.3
  %150 = bitcast double* %149 to i64*
  store i64 %148, i64* %150, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block154.loopexit, label %scalar.ph155, !llvm.loop !19

middle.block154.loopexit:                         ; preds = %scalar.ph155
  br label %middle.block154

middle.block154.loopexit181:                      ; preds = %vector.body153
  br label %middle.block154

middle.block154:                                  ; preds = %middle.block154.loopexit181, %middle.block154.loopexit
  %151 = icmp slt i64 %106, 2000
  br i1 %151, label %._crit_edge107, label %152

; <label>:152:                                    ; preds = %middle.block154
  call void @free(i8* nonnull %38) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %6

; <label>:6:                                      ; preds = %._crit_edge123, %5
  %indvars.iv181 = phi i64 [ %indvars.iv.next182, %._crit_edge123 ], [ 4294967295, %5 ]
  %indvars.iv172 = phi i64 [ %indvars.iv.next173, %._crit_edge123 ], [ 0, %5 ]
  %7 = sub i64 2000, %indvars.iv172
  %8 = add i64 %7, -4
  %9 = lshr i64 %8, 2
  %10 = sub i64 2000, %indvars.iv172
  %11 = and i64 %indvars.iv181, 4294967295
  %12 = icmp sgt i64 %indvars.iv172, 0
  br i1 %12, label %.lr.ph112.preheader, label %.lr.ph122.split.preheader

.lr.ph112.preheader:                              ; preds = %6
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 0
  br label %.lr.ph112

.lr.ph122.split.preheader:                        ; preds = %.lr.ph122..lr.ph122.split.preheader_crit_edge, %6
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %.lr.ph122.split.preheader196, label %min.iters.checked

.lr.ph122.split.preheader196:                     ; preds = %middle.block, %min.iters.checked, %.lr.ph122.split.preheader
  %indvars.iv159.ph = phi i64 [ %indvars.iv172, %min.iters.checked ], [ %indvars.iv172, %.lr.ph122.split.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph122.split

min.iters.checked:                                ; preds = %.lr.ph122.split.preheader
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv172, %n.vec
  br i1 %cmp.zero, label %.lr.ph122.split.preheader196, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %14 = and i64 %9, 1
  %lcmp.mod210 = icmp eq i64 %14, 0
  br i1 %lcmp.mod210, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv172
  %16 = bitcast double* %15 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x i64>*
  %wide.load195.prol = load <2 x i64>, <2 x i64>* %18, align 8
  store <2 x i64> %wide.load.prol, <2 x i64>* %16, align 8
  store <2 x i64> %wide.load195.prol, <2 x i64>* %18, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %9, 0
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %20 = add i64 %indvars.iv172, %index
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %20
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  %wide.load195 = load <2 x i64>, <2 x i64>* %24, align 8
  store <2 x i64> %wide.load, <2 x i64>* %22, align 8
  store <2 x i64> %wide.load195, <2 x i64>* %24, align 8
  %index.next = add i64 %index, 4
  %25 = add i64 %indvars.iv172, %index.next
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %25
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %27, align 8
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load195.1 = load <2 x i64>, <2 x i64>* %29, align 8
  store <2 x i64> %wide.load.1, <2 x i64>* %27, align 8
  store <2 x i64> %wide.load195.1, <2 x i64>* %29, align 8
  %index.next.1 = add i64 %index, 8
  %30 = icmp eq i64 %index.next.1, %n.vec
  br i1 %30, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %._crit_edge123, label %.lr.ph122.split.preheader196

.lr.ph112:                                        ; preds = %.lr.ph112.preheader, %._crit_edge108
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %._crit_edge108 ], [ 4294967295, %.lr.ph112.preheader ]
  %indvars.iv155 = phi i64 [ %indvars.iv.next156, %._crit_edge108 ], [ 0, %.lr.ph112.preheader ]
  %31 = and i64 %indvars.iv177, 4294967295
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv155
  %33 = load double, double* %32, align 8
  %34 = icmp sgt i64 %indvars.iv155, 0
  br i1 %34, label %.lr.ph107.preheader, label %._crit_edge108

.lr.ph107.preheader:                              ; preds = %.lr.ph112
  %35 = and i64 %indvars.iv177, 1
  %lcmp.mod208 = icmp eq i64 %35, 0
  br i1 %lcmp.mod208, label %.lr.ph107.prol.preheader, label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.preheader:                         ; preds = %.lr.ph107.preheader
  br label %.lr.ph107.prol

.lr.ph107.prol:                                   ; preds = %.lr.ph107.prol.preheader
  %36 = load double, double* %13, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv155
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %33, %39
  br label %.lr.ph107.prol.loopexit.unr-lcssa

.lr.ph107.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph107.preheader, %.lr.ph107.prol
  %.lcssa202.unr.ph = phi double [ %40, %.lr.ph107.prol ], [ undef, %.lr.ph107.preheader ]
  %indvars.iv149.unr.ph = phi i64 [ 1, %.lr.ph107.prol ], [ 0, %.lr.ph107.preheader ]
  %.0105.unr.ph = phi double [ %40, %.lr.ph107.prol ], [ %33, %.lr.ph107.preheader ]
  br label %.lr.ph107.prol.loopexit

.lr.ph107.prol.loopexit:                          ; preds = %.lr.ph107.prol.loopexit.unr-lcssa
  %41 = icmp eq i64 %31, 0
  br i1 %41, label %._crit_edge108.loopexit, label %.lr.ph107.preheader.new

.lr.ph107.preheader.new:                          ; preds = %.lr.ph107.prol.loopexit
  br label %.lr.ph107

.lr.ph107:                                        ; preds = %.lr.ph107, %.lr.ph107.preheader.new
  %indvars.iv149 = phi i64 [ %indvars.iv149.unr.ph, %.lr.ph107.preheader.new ], [ %indvars.iv.next150.1, %.lr.ph107 ]
  %.0105 = phi double [ %.0105.unr.ph, %.lr.ph107.preheader.new ], [ %55, %.lr.ph107 ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv149
  %43 = bitcast double* %42 to <2 x double>*
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv149, i64 %indvars.iv155
  %45 = load double, double* %44, align 8
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %46 = load <2 x double>, <2 x double>* %43, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next150, i64 %indvars.iv155
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %46, %50
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fsub double %.0105, %52
  %55 = fsub double %54, %53
  %exitcond179.1 = icmp eq i64 %indvars.iv.next150, %31
  %indvars.iv.next150.1 = add nsw i64 %indvars.iv149, 2
  br i1 %exitcond179.1, label %._crit_edge108.loopexit.unr-lcssa, label %.lr.ph107

._crit_edge108.loopexit.unr-lcssa:                ; preds = %.lr.ph107
  br label %._crit_edge108.loopexit

._crit_edge108.loopexit:                          ; preds = %.lr.ph107.prol.loopexit, %._crit_edge108.loopexit.unr-lcssa
  %.lcssa202 = phi double [ %.lcssa202.unr.ph, %.lr.ph107.prol.loopexit ], [ %55, %._crit_edge108.loopexit.unr-lcssa ]
  br label %._crit_edge108

._crit_edge108:                                   ; preds = %._crit_edge108.loopexit, %.lr.ph112
  %.0.lcssa = phi double [ %33, %.lr.ph112 ], [ %.lcssa202, %._crit_edge108.loopexit ]
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv155, i64 %indvars.iv155
  %57 = load double, double* %56, align 8
  %58 = fdiv double %.0.lcssa, %57
  store double %58, double* %32, align 8
  %indvars.iv.next156 = add nuw i64 %indvars.iv155, 1
  %59 = icmp slt i64 %indvars.iv.next156, %indvars.iv172
  %indvars.iv.next178 = add nuw nsw i64 %31, 1
  br i1 %59, label %.lr.ph112, label %.lr.ph122

.lr.ph122:                                        ; preds = %._crit_edge108
  br i1 true, label %.lr.ph122.split.us.preheader, label %.lr.ph122..lr.ph122.split.preheader_crit_edge

.lr.ph122..lr.ph122.split.preheader_crit_edge:    ; preds = %.lr.ph122
  br label %.lr.ph122.split.preheader

.lr.ph122.split.us.preheader:                     ; preds = %.lr.ph122
  %60 = and i64 %indvars.iv181, 1
  %lcmp.mod214 = icmp eq i64 %60, 0
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 0
  %62 = icmp eq i64 %11, 0
  br label %.lr.ph122.split.us

.lr.ph122.split.us:                               ; preds = %.lr.ph122.split.us.preheader, %._crit_edge118.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %._crit_edge118.us ], [ %indvars.iv172, %.lr.ph122.split.us.preheader ]
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv170
  %64 = load double, double* %63, align 8
  br i1 %lcmp.mod214, label %.prol.preheader211, label %.prol.loopexit212.unr-lcssa

.prol.preheader211:                               ; preds = %.lr.ph122.split.us
  br label %65

; <label>:65:                                     ; preds = %.prol.preheader211
  %66 = load double, double* %61, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv170
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fsub double %64, %69
  br label %.prol.loopexit212.unr-lcssa

.prol.loopexit212.unr-lcssa:                      ; preds = %.lr.ph122.split.us, %65
  %.lcssa203.unr.ph = phi double [ %70, %65 ], [ undef, %.lr.ph122.split.us ]
  %indvars.iv162.unr.ph = phi i64 [ 1, %65 ], [ 0, %.lr.ph122.split.us ]
  %.1115.us.unr.ph = phi double [ %70, %65 ], [ %64, %.lr.ph122.split.us ]
  br label %.prol.loopexit212

.prol.loopexit212:                                ; preds = %.prol.loopexit212.unr-lcssa
  br i1 %62, label %._crit_edge118.us, label %.lr.ph122.split.us.new

.lr.ph122.split.us.new:                           ; preds = %.prol.loopexit212
  br label %71

; <label>:71:                                     ; preds = %71, %.lr.ph122.split.us.new
  %indvars.iv162 = phi i64 [ %indvars.iv162.unr.ph, %.lr.ph122.split.us.new ], [ %indvars.iv.next163.1, %71 ]
  %.1115.us = phi double [ %.1115.us.unr.ph, %.lr.ph122.split.us.new ], [ %85, %71 ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv172, i64 %indvars.iv162
  %73 = bitcast double* %72 to <2 x double>*
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv162, i64 %indvars.iv170
  %75 = load double, double* %74, align 8
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %76 = load <2 x double>, <2 x double>* %73, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next163, i64 %indvars.iv170
  %78 = load double, double* %77, align 8
  %79 = insertelement <2 x double> undef, double %75, i32 0
  %80 = insertelement <2 x double> %79, double %78, i32 1
  %81 = fmul <2 x double> %76, %80
  %82 = extractelement <2 x double> %81, i32 0
  %83 = extractelement <2 x double> %81, i32 1
  %84 = fsub double %.1115.us, %82
  %85 = fsub double %84, %83
  %exitcond183.1 = icmp eq i64 %indvars.iv.next163, %11
  %indvars.iv.next163.1 = add nsw i64 %indvars.iv162, 2
  br i1 %exitcond183.1, label %._crit_edge118.us.unr-lcssa, label %71

._crit_edge118.us.unr-lcssa:                      ; preds = %71
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %.prol.loopexit212, %._crit_edge118.us.unr-lcssa
  %.lcssa203 = phi double [ %.lcssa203.unr.ph, %.prol.loopexit212 ], [ %85, %._crit_edge118.us.unr-lcssa ]
  store double %.lcssa203, double* %63, align 8
  %indvars.iv.next171 = add nuw i64 %indvars.iv170, 1
  %86 = icmp slt i64 %indvars.iv.next171, 2000
  br i1 %86, label %.lr.ph122.split.us, label %._crit_edge123.loopexit

.lr.ph122.split:                                  ; preds = %.lr.ph122.split.preheader196, %.lr.ph122.split
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %.lr.ph122.split ], [ %indvars.iv159.ph, %.lr.ph122.split.preheader196 ]
  %exitcond161 = icmp eq i64 %indvars.iv159, 1999
  %indvars.iv.next160 = add nuw i64 %indvars.iv159, 1
  br i1 %exitcond161, label %._crit_edge123.loopexit197, label %.lr.ph122.split, !llvm.loop !21

._crit_edge123.loopexit:                          ; preds = %._crit_edge118.us
  br label %._crit_edge123

._crit_edge123.loopexit197:                       ; preds = %.lr.ph122.split
  br label %._crit_edge123

._crit_edge123:                                   ; preds = %._crit_edge123.loopexit197, %._crit_edge123.loopexit, %middle.block
  %indvars.iv.next173 = add nuw i64 %indvars.iv172, 1
  %87 = icmp slt i64 %indvars.iv.next173, 2000
  %indvars.iv.next182 = add nuw nsw i64 %11, 1
  br i1 %87, label %6, label %._crit_edge123._crit_edge128.preheader

._crit_edge123._crit_edge128.preheader:           ; preds = %._crit_edge123
  br label %._crit_edge123._crit_edge128

._crit_edge123._crit_edge128:                     ; preds = %._crit_edge123._crit_edge128.preheader, %._crit_edge101
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %._crit_edge101 ], [ 4294967295, %._crit_edge123._crit_edge128.preheader ]
  %indvars.iv147 = phi i64 [ %indvars.iv.next148, %._crit_edge101 ], [ 0, %._crit_edge123._crit_edge128.preheader ]
  %88 = and i64 %indvars.iv174, 4294967295
  %89 = getelementptr inbounds double, double* %2, i64 %indvars.iv147
  %90 = load double, double* %89, align 8
  %91 = icmp sgt i64 %indvars.iv147, 0
  br i1 %91, label %.lr.ph100.preheader, label %._crit_edge101

.lr.ph100.preheader:                              ; preds = %._crit_edge123._crit_edge128
  %92 = add nsw i64 %indvars.iv174, 1
  %xtraiter204 = and i64 %92, 3
  %lcmp.mod205 = icmp eq i64 %xtraiter204, 0
  br i1 %lcmp.mod205, label %.lr.ph100.prol.loopexit, label %.lr.ph100.prol.preheader

.lr.ph100.prol.preheader:                         ; preds = %.lr.ph100.preheader
  br label %.lr.ph100.prol

.lr.ph100.prol:                                   ; preds = %.lr.ph100.prol, %.lr.ph100.prol.preheader
  %indvars.iv142.prol = phi i64 [ %indvars.iv.next143.prol, %.lr.ph100.prol ], [ 0, %.lr.ph100.prol.preheader ]
  %.298.prol = phi double [ %98, %.lr.ph100.prol ], [ %90, %.lr.ph100.prol.preheader ]
  %prol.iter206 = phi i64 [ %prol.iter206.sub, %.lr.ph100.prol ], [ %xtraiter204, %.lr.ph100.prol.preheader ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv142.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv142.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.298.prol, %97
  %indvars.iv.next143.prol = add nuw nsw i64 %indvars.iv142.prol, 1
  %prol.iter206.sub = add i64 %prol.iter206, -1
  %prol.iter206.cmp = icmp eq i64 %prol.iter206.sub, 0
  br i1 %prol.iter206.cmp, label %.lr.ph100.prol.loopexit.unr-lcssa, label %.lr.ph100.prol, !llvm.loop !23

.lr.ph100.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph100.prol
  br label %.lr.ph100.prol.loopexit

.lr.ph100.prol.loopexit:                          ; preds = %.lr.ph100.preheader, %.lr.ph100.prol.loopexit.unr-lcssa
  %.lcssa201.unr = phi double [ undef, %.lr.ph100.preheader ], [ %98, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %indvars.iv142.unr = phi i64 [ 0, %.lr.ph100.preheader ], [ %indvars.iv.next143.prol, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %.298.unr = phi double [ %90, %.lr.ph100.preheader ], [ %98, %.lr.ph100.prol.loopexit.unr-lcssa ]
  %99 = icmp ult i64 %88, 3
  br i1 %99, label %._crit_edge101.loopexit, label %.lr.ph100.preheader.new

.lr.ph100.preheader.new:                          ; preds = %.lr.ph100.prol.loopexit
  br label %.lr.ph100

.lr.ph100:                                        ; preds = %.lr.ph100, %.lr.ph100.preheader.new
  %indvars.iv142 = phi i64 [ %indvars.iv142.unr, %.lr.ph100.preheader.new ], [ %indvars.iv.next143.3, %.lr.ph100 ]
  %.298 = phi double [ %.298.unr, %.lr.ph100.preheader.new ], [ %121, %.lr.ph100 ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv142
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %4, i64 %indvars.iv142
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %.298, %107
  %110 = fsub double %109, %108
  %indvars.iv.next143.1 = add nsw i64 %indvars.iv142, 2
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv147, i64 %indvars.iv.next143.1
  %112 = bitcast double* %111 to <2 x double>*
  %113 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next143.1
  %114 = bitcast double* %113 to <2 x double>*
  %indvars.iv.next143.2 = add nsw i64 %indvars.iv142, 3
  %115 = load <2 x double>, <2 x double>* %112, align 8
  %116 = load <2 x double>, <2 x double>* %114, align 8
  %117 = fmul <2 x double> %115, %116
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %120 = fsub double %110, %118
  %121 = fsub double %120, %119
  %exitcond176.3 = icmp eq i64 %indvars.iv.next143.2, %88
  %indvars.iv.next143.3 = add nsw i64 %indvars.iv142, 4
  br i1 %exitcond176.3, label %._crit_edge101.loopexit.unr-lcssa, label %.lr.ph100

._crit_edge101.loopexit.unr-lcssa:                ; preds = %.lr.ph100
  br label %._crit_edge101.loopexit

._crit_edge101.loopexit:                          ; preds = %.lr.ph100.prol.loopexit, %._crit_edge101.loopexit.unr-lcssa
  %.lcssa201 = phi double [ %.lcssa201.unr, %.lr.ph100.prol.loopexit ], [ %121, %._crit_edge101.loopexit.unr-lcssa ]
  br label %._crit_edge101

._crit_edge101:                                   ; preds = %._crit_edge101.loopexit, %._crit_edge123._crit_edge128
  %.2.lcssa = phi double [ %90, %._crit_edge123._crit_edge128 ], [ %.lcssa201, %._crit_edge101.loopexit ]
  %122 = getelementptr inbounds double, double* %4, i64 %indvars.iv147
  store double %.2.lcssa, double* %122, align 8
  %indvars.iv.next148 = add nuw i64 %indvars.iv147, 1
  %123 = icmp slt i64 %indvars.iv.next148, 2000
  %indvars.iv.next175 = add nuw nsw i64 %88, 1
  br i1 %123, label %._crit_edge123._crit_edge128, label %._crit_edge101._crit_edge131.preheader

._crit_edge101._crit_edge131.preheader:           ; preds = %._crit_edge101
  br label %._crit_edge101._crit_edge131

._crit_edge101._crit_edge131:                     ; preds = %._crit_edge101._crit_edge131.preheader, %._crit_edge._crit_edge
  %indvar = phi i32 [ 0, %._crit_edge101._crit_edge131.preheader ], [ %indvar.next, %._crit_edge._crit_edge ]
  %indvars.iv139 = phi i64 [ 1999, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next140, %._crit_edge._crit_edge ]
  %indvars.iv = phi i32 [ 2000, %._crit_edge101._crit_edge131.preheader ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %124 = sub i32 2000, %indvar
  %125 = sext i32 %124 to i64
  %126 = sub nsw i64 1999, %125
  %127 = getelementptr inbounds double, double* %4, i64 %indvars.iv139
  %128 = load double, double* %127, align 8
  %129 = add nsw i64 %indvars.iv139, 1
  %130 = icmp slt i64 %129, 2000
  br i1 %130, label %.lr.ph, label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %._crit_edge101._crit_edge131
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  %132 = load double, double* %131, align 8
  %133 = fdiv double %128, %132
  %134 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  store double %133, double* %134, align 8
  br label %._crit_edge._crit_edge

.lr.ph:                                           ; preds = %._crit_edge101._crit_edge131
  %135 = sext i32 %indvars.iv to i64
  %136 = sub nsw i64 0, %125
  %xtraiter = and i64 %136, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %137

; <label>:137:                                    ; preds = %137, %.prol.preheader
  %indvars.iv137.prol = phi i64 [ %indvars.iv.next138.prol, %137 ], [ %135, %.prol.preheader ]
  %.394.prol = phi double [ %143, %137 ], [ %128, %.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %137 ], [ %xtraiter, %.prol.preheader ]
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv137.prol
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds double, double* %3, i64 %indvars.iv137.prol
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = fsub double %.394.prol, %142
  %indvars.iv.next138.prol = add nsw i64 %indvars.iv137.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.unr-lcssa, label %137, !llvm.loop !25

.prol.loopexit.unr-lcssa:                         ; preds = %137
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %143, %.prol.loopexit.unr-lcssa ]
  %indvars.iv137.unr = phi i64 [ %135, %.lr.ph ], [ %indvars.iv.next138.prol, %.prol.loopexit.unr-lcssa ]
  %.394.unr = phi double [ %128, %.lr.ph ], [ %143, %.prol.loopexit.unr-lcssa ]
  %144 = icmp ult i64 %126, 3
  br i1 %144, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %145

; <label>:145:                                    ; preds = %145, %.lr.ph.new
  %indvars.iv137 = phi i64 [ %indvars.iv137.unr, %.lr.ph.new ], [ %indvars.iv.next138.3, %145 ]
  %.394 = phi double [ %.394.unr, %.lr.ph.new ], [ %167, %145 ]
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv137
  %147 = bitcast double* %146 to <2 x double>*
  %148 = getelementptr inbounds double, double* %3, i64 %indvars.iv137
  %149 = bitcast double* %148 to <2 x double>*
  %150 = load <2 x double>, <2 x double>* %147, align 8
  %151 = load <2 x double>, <2 x double>* %149, align 8
  %152 = fmul <2 x double> %150, %151
  %153 = extractelement <2 x double> %152, i32 0
  %154 = extractelement <2 x double> %152, i32 1
  %155 = fsub double %.394, %153
  %156 = fsub double %155, %154
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %157 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv.next138.1
  %158 = bitcast double* %157 to <2 x double>*
  %159 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next138.1
  %160 = bitcast double* %159 to <2 x double>*
  %indvars.iv.next138.2 = add nsw i64 %indvars.iv137, 3
  %161 = load <2 x double>, <2 x double>* %158, align 8
  %162 = load <2 x double>, <2 x double>* %160, align 8
  %163 = fmul <2 x double> %161, %162
  %164 = extractelement <2 x double> %163, i32 0
  %165 = extractelement <2 x double> %163, i32 1
  %166 = fsub double %156, %164
  %167 = fsub double %166, %165
  %exitcond.3 = icmp eq i64 %indvars.iv.next138.2, 1999
  %indvars.iv.next138.3 = add nsw i64 %indvars.iv137, 4
  br i1 %exitcond.3, label %._crit_edge.unr-lcssa, label %145

._crit_edge.unr-lcssa:                            ; preds = %145
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit, %._crit_edge.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %167, %._crit_edge.unr-lcssa ]
  %168 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv139, i64 %indvars.iv139
  %169 = load double, double* %168, align 8
  %170 = fdiv double %.lcssa, %169
  %171 = getelementptr inbounds double, double* %3, i64 %indvars.iv139
  store double %170, double* %171, align 8
  %172 = icmp sgt i64 %indvars.iv139, 0
  br i1 %172, label %._crit_edge._crit_edge, label %173

._crit_edge._crit_edge:                           ; preds = %._crit_edge.thread, %._crit_edge
  %indvars.iv.next140 = add i64 %indvars.iv139, -1
  %indvars.iv.next = add i32 %indvars.iv, -1
  %indvar.next = add i32 %indvar, 1
  br label %._crit_edge101._crit_edge131

; <label>:173:                                    ; preds = %._crit_edge
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
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
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
