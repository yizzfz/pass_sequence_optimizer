; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %1, %._crit_edge19.._crit_edge_crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge19.._crit_edge_crit_edge ], [ 0, %1 ]
  %2 = shl i64 %indvars.iv57, 32
  %sext = add i64 %2, 4294967296
  %3 = ashr exact i64 %sext, 32
  %scevgep55 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %3
  %4 = sub i64 1998, %indvars.iv57
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  %7 = add nuw nsw i64 %6, 8
  br label %9

._crit_edge1:                                     ; preds = %9
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %8 = icmp slt i64 %indvars.iv.next58, 2000
  br i1 %8, label %._crit_edge19.._crit_edge_crit_edge, label %19

; <label>:9:                                      ; preds = %9, %.lr.ph
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %9 ], [ 0, %.lr.ph ]
  %10 = sub nsw i64 0, %indvars.iv40
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv40
  store double %15, double* %16, align 8
  %exitcond48 = icmp eq i64 %indvars.iv40, %indvars.iv57
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  br i1 %exitcond48, label %._crit_edge1, label %9

._crit_edge19.._crit_edge_crit_edge:              ; preds = %._crit_edge1
  %17 = bitcast double* %scevgep55 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %17, i8 0, i64 %7, i32 8, i1 false)
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv57
  store double 1.000000e+00, double* %18, align 8
  br label %.lr.ph

; <label>:19:                                     ; preds = %._crit_edge1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv57
  store double 1.000000e+00, double* %20, align 8
  %21 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %.._crit_edge2_crit_edge

.._crit_edge2_crit_edge:                          ; preds = %.._crit_edge2_crit_edge, %19
  %indvars.iv38 = phi i64 [ 0, %19 ], [ %indvars.iv.next39.7, %.._crit_edge2_crit_edge ]
  %22 = mul nuw nsw i64 %indvars.iv38, 16000
  %scevgep = getelementptr i8, i8* %21, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39 = or i64 %indvars.iv38, 1
  %23 = mul nuw nsw i64 %indvars.iv.next39, 16000
  %scevgep.1 = getelementptr i8, i8* %21, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.1 = or i64 %indvars.iv38, 2
  %24 = mul nuw nsw i64 %indvars.iv.next39.1, 16000
  %scevgep.2 = getelementptr i8, i8* %21, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.2 = or i64 %indvars.iv38, 3
  %25 = mul nuw nsw i64 %indvars.iv.next39.2, 16000
  %scevgep.3 = getelementptr i8, i8* %21, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.3 = or i64 %indvars.iv38, 4
  %26 = mul nuw nsw i64 %indvars.iv.next39.3, 16000
  %scevgep.4 = getelementptr i8, i8* %21, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.4 = or i64 %indvars.iv38, 5
  %27 = mul nuw nsw i64 %indvars.iv.next39.4, 16000
  %scevgep.5 = getelementptr i8, i8* %21, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.5 = or i64 %indvars.iv38, 6
  %28 = mul nuw nsw i64 %indvars.iv.next39.5, 16000
  %scevgep.6 = getelementptr i8, i8* %21, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.6 = or i64 %indvars.iv38, 7
  %29 = mul nuw nsw i64 %indvars.iv.next39.6, 16000
  %scevgep.7 = getelementptr i8, i8* %21, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next39.7 = add nsw i64 %indvars.iv38, 8
  %30 = icmp slt i64 %indvars.iv.next39.7, 2000
  br i1 %30, label %.._crit_edge2_crit_edge, label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %.._crit_edge2_crit_edge
  %31 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %21 to [2000 x [2000 x double]]*
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.preheader, %80
  %indvars.iv33 = phi i64 [ %34, %80 ], [ 0, %._crit_edge4.preheader ]
  %scevgep61 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv33
  %scevgep6162 = bitcast double* %scevgep61 to i8*
  %34 = add i64 %indvars.iv33, 1
  %scevgep63 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %34
  %scevgep6364 = bitcast double* %scevgep63 to i8*
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %middle.block, %._crit_edge4
  %indvars.iv31 = phi i64 [ 0, %._crit_edge4 ], [ %indvars.iv.next32, %middle.block ]
  %35 = mul i64 %indvars.iv31, 16000
  %scevgep59 = getelementptr i8, i8* %21, i64 %35
  %36 = add i64 %35, 16000
  %scevgep60 = getelementptr i8, i8* %21, i64 %36
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv33
  %bound0 = icmp ult i8* %scevgep59, %scevgep6364
  %bound1 = icmp ult i8* %scevgep6162, %scevgep60
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %37 to i8*
  %bound066 = icmp ult i8* %scevgep59, %bc
  %bound167 = icmp ult i8* %bc, %scevgep60
  %found.conflict68 = and i1 %bound066, %bound167
  %conflict.rdx = or i1 %found.conflict, %found.conflict68
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge6
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge6
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %38 = or i64 %index, 1
  %39 = or i64 %index, 2
  %40 = or i64 %index, 3
  %41 = load double, double* %37, align 8, !alias.scope !1
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv33
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv33
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %39, i64 %indvars.iv33
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %40, i64 %indvars.iv33
  %48 = load double, double* %44, align 8, !alias.scope !4
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = insertelement <2 x double> undef, double %48, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = fmul <2 x double> %43, %53
  %57 = fmul <2 x double> %43, %55
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv31, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = fadd <2 x double> %wide.load, %56
  %63 = fadd <2 x double> %wide.load70, %57
  store <2 x double> %62, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %63, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %64 = icmp eq i64 %index.next, 2000
  br i1 %64, label %middle.block.loopexit100, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv28 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next29.1, %scalar.ph ]
  %65 = load double, double* %37, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv33
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv31, i64 %indvars.iv28
  %70 = load double, double* %69, align 8
  %71 = fadd double %70, %68
  store double %71, double* %69, align 8
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %72 = load double, double* %37, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next29, i64 %indvars.iv33
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv31, i64 %indvars.iv.next29
  %77 = load double, double* %76, align 8
  %78 = fadd double %77, %75
  store double %78, double* %76, align 8
  %exitcond30.1 = icmp eq i64 %indvars.iv.next29, 1999
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond30.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit100:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit100, %middle.block.loopexit
  %indvars.iv.next32 = add nuw i64 %indvars.iv31, 1
  %79 = icmp slt i64 %indvars.iv.next32, 2000
  br i1 %79, label %._crit_edge6, label %80

; <label>:80:                                     ; preds = %middle.block
  %81 = icmp slt i64 %34, 2000
  br i1 %81, label %._crit_edge4, label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %80
  %82 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %83 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %84 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %85 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %86 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %87 = bitcast i8* %21 to [2000 x [2000 x double]]*
  %88 = bitcast i8* %21 to [2000 x [2000 x double]]*
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.preheader, %middle.block72
  %indvars.iv26 = phi i64 [ %89, %middle.block72 ], [ 0, %._crit_edge7.preheader ]
  %scevgep76 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 0
  %scevgep7677 = bitcast double* %scevgep76 to i8*
  %89 = add i64 %indvars.iv26, 1
  %scevgep78 = getelementptr [2000 x double], [2000 x double]* %0, i64 %89, i64 0
  %scevgep7879 = bitcast double* %scevgep78 to i8*
  %90 = mul i64 %indvars.iv26, 16000
  %scevgep80 = getelementptr i8, i8* %21, i64 %90
  %91 = add i64 %90, 16000
  %scevgep81 = getelementptr i8, i8* %21, i64 %91
  %bound082 = icmp ult i8* %scevgep7677, %scevgep81
  %bound183 = icmp ult i8* %scevgep80, %scevgep7879
  %memcheck.conflict85 = and i1 %bound082, %bound183
  br i1 %memcheck.conflict85, label %scalar.ph73.preheader, label %vector.body71.preheader

vector.body71.preheader:                          ; preds = %._crit_edge7
  br label %vector.body71

scalar.ph73.preheader:                            ; preds = %._crit_edge7
  br label %scalar.ph73

vector.body71:                                    ; preds = %vector.body71, %vector.body71.preheader
  %index88 = phi i64 [ 0, %vector.body71.preheader ], [ %index.next89.1, %vector.body71 ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv26, i64 %index88
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load96 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load97 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !13
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %index88
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load96, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load97, <2 x i64>* %99, align 8, !alias.scope !16, !noalias !13
  %index.next89 = or i64 %index88, 4
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvars.iv26, i64 %index.next89
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load96.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load97.1 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %index.next89
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load96.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load97.1, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %index.next89.1 = add nsw i64 %index88, 8
  %108 = icmp eq i64 %index.next89.1, 2000
  br i1 %108, label %middle.block72.loopexit99, label %vector.body71, !llvm.loop !18

scalar.ph73:                                      ; preds = %scalar.ph73, %scalar.ph73.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph73.preheader ], [ %indvars.iv.next.4, %scalar.ph73 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv26, i64 %indvars.iv
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next.2
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next.2
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvars.iv26, i64 %indvars.iv.next.3
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv.next.3
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %middle.block72.loopexit, label %scalar.ph73, !llvm.loop !19

middle.block72.loopexit:                          ; preds = %scalar.ph73
  br label %middle.block72

middle.block72.loopexit99:                        ; preds = %vector.body71
  br label %middle.block72

middle.block72:                                   ; preds = %middle.block72.loopexit99, %middle.block72.loopexit
  %134 = icmp slt i64 %89, 2000
  br i1 %134, label %._crit_edge7, label %135

; <label>:135:                                    ; preds = %middle.block72
  tail call void @free(i8* nonnull %21) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %1
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge11 ], [ 0, %1 ]
  %indvars.iv27 = phi i32 [ %indvars.iv.next28, %._crit_edge11 ], [ -1, %1 ]
  %2 = add i64 %indvars.iv35, 4294967295
  %3 = and i64 %2, 4294967295
  %4 = icmp sgt i64 %indvars.iv35, 0
  br i1 %4, label %._crit_edge1.preheader, label %._crit_edge11

._crit_edge1.preheader:                           ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 0
  br label %._crit_edge1

._crit_edge3.lr.ph:                               ; preds = %._crit_edge5
  br i1 true, label %._crit_edge3.us.preheader, label %._crit_edge3.lr.ph.._crit_edge11_crit_edge

._crit_edge3.lr.ph.._crit_edge11_crit_edge:       ; preds = %._crit_edge3.lr.ph
  br label %._crit_edge11

._crit_edge3.us.preheader:                        ; preds = %._crit_edge3.lr.ph
  %wide.trip.count29 = zext i32 %indvars.iv27 to i64
  %6 = and i64 %2, 1
  %lcmp.mod42 = icmp eq i64 %6, 0
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 0
  %8 = icmp eq i64 %3, 0
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.preheader, %._crit_edge9.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge9.us ], [ %indvars.iv35, %._crit_edge3.us.preheader ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv33
  %.pre38 = load double, double* %9, align 8
  br i1 %lcmp.mod42, label %.prol.preheader39, label %.prol.loopexit40.unr-lcssa

.prol.preheader39:                                ; preds = %._crit_edge3.us
  br label %10

; <label>:10:                                     ; preds = %.prol.preheader39
  %11 = load double, double* %7, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv33
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fsub double %.pre38, %14
  store double %15, double* %9, align 8
  br label %.prol.loopexit40.unr-lcssa

.prol.loopexit40.unr-lcssa:                       ; preds = %._crit_edge3.us, %10
  %.unr43.ph = phi double [ %15, %10 ], [ %.pre38, %._crit_edge3.us ]
  %indvars.iv23.unr.ph = phi i64 [ 1, %10 ], [ 0, %._crit_edge3.us ]
  br label %.prol.loopexit40

.prol.loopexit40:                                 ; preds = %.prol.loopexit40.unr-lcssa
  br i1 %8, label %._crit_edge9.us, label %._crit_edge3.us.new

._crit_edge3.us.new:                              ; preds = %.prol.loopexit40
  br label %16

; <label>:16:                                     ; preds = %16, %._crit_edge3.us.new
  %17 = phi double [ %.unr43.ph, %._crit_edge3.us.new ], [ %29, %16 ]
  %indvars.iv23 = phi i64 [ %indvars.iv23.unr.ph, %._crit_edge3.us.new ], [ %indvars.iv.next24.1, %16 ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv23
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv33
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %9, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv.next24
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next24, i64 %indvars.iv33
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %9, align 8
  %exitcond30.1 = icmp eq i64 %indvars.iv.next24, %wide.trip.count29
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, 2
  br i1 %exitcond30.1, label %._crit_edge9.us.unr-lcssa, label %16

._crit_edge9.us.unr-lcssa:                        ; preds = %16
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.prol.loopexit40, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next34 = add nuw i64 %indvars.iv33, 1
  %30 = icmp slt i64 %indvars.iv.next34, 2000
  br i1 %30, label %._crit_edge3.us, label %._crit_edge11.loopexit

._crit_edge1:                                     ; preds = %._crit_edge1.preheader, %._crit_edge5
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge5 ], [ 0, %._crit_edge1.preheader ]
  %indvars.iv17 = phi i32 [ %indvars.iv.next18, %._crit_edge5 ], [ -1, %._crit_edge1.preheader ]
  %31 = add i64 %indvars.iv21, 4294967295
  %32 = and i64 %31, 4294967295
  %33 = icmp sgt i64 %indvars.iv21, 0
  br i1 %33, label %.lr.ph, label %._crit_edge1.._crit_edge5_crit_edge

._crit_edge1.._crit_edge5_crit_edge:              ; preds = %._crit_edge1
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv21
  %.pre37 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge5

.lr.ph:                                           ; preds = %._crit_edge1
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv21
  %wide.trip.count19 = zext i32 %indvars.iv17 to i64
  %.pre = load double, double* %34, align 8
  %35 = and i64 %31, 1
  %lcmp.mod = icmp eq i64 %35, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %36

; <label>:36:                                     ; preds = %.prol.preheader
  %37 = load double, double* %5, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv21
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %.pre, %40
  store double %41, double* %34, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %36
  %.lcssa.unr.ph = phi double [ %41, %36 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %41, %36 ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %36 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %42 = icmp eq i64 %32, 0
  br i1 %42, label %._crit_edge5.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %43

; <label>:43:                                     ; preds = %43, %.lr.ph.new
  %44 = phi double [ %.unr.ph, %.lr.ph.new ], [ %56, %43 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %43 ]
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv21
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv.next
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv21
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fsub double %50, %55
  store double %56, double* %34, align 8
  %exitcond20.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count19
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond20.1, label %._crit_edge5.loopexit.unr-lcssa, label %43

._crit_edge5.loopexit.unr-lcssa:                  ; preds = %43
  br label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %.prol.loopexit, %._crit_edge5.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %56, %._crit_edge5.loopexit.unr-lcssa ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge1.._crit_edge5_crit_edge, %._crit_edge5.loopexit
  %.pre-phi = phi double* [ %.phi.trans.insert, %._crit_edge1.._crit_edge5_crit_edge ], [ %34, %._crit_edge5.loopexit ]
  %57 = phi double [ %.pre37, %._crit_edge1.._crit_edge5_crit_edge ], [ %.lcssa, %._crit_edge5.loopexit ]
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv21
  %59 = load double, double* %58, align 8
  %60 = fdiv double %57, %59
  store double %60, double* %.pre-phi, align 8
  %indvars.iv.next22 = add nuw i64 %indvars.iv21, 1
  %61 = icmp slt i64 %indvars.iv.next22, %indvars.iv35
  %indvars.iv.next18 = add nsw i32 %indvars.iv17, 1
  br i1 %61, label %._crit_edge1, label %._crit_edge3.lr.ph

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge3.lr.ph.._crit_edge11_crit_edge, %._crit_edge11.loopexit, %._crit_edge
  %indvars.iv.next36 = add nuw i64 %indvars.iv35, 1
  %62 = icmp slt i64 %indvars.iv.next36, 2000
  %indvars.iv.next28 = add nsw i32 %indvars.iv27, 1
  br i1 %62, label %._crit_edge, label %63

; <label>:63:                                     ; preds = %._crit_edge11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv6 = phi i64 [ 0, %1 ], [ %indvars.iv.next7, %18 ]
  %6 = mul nsw i64 %indvars.iv6, 2000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge4, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge4 ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge4

; <label>:11:                                     ; preds = %._crit_edge5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge5, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %17 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %17, label %._crit_edge5, label %18

; <label>:18:                                     ; preds = %._crit_edge4
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %19 = icmp slt i64 %indvars.iv.next7, 2000
  br i1 %19, label %._crit_edge, label %20

; <label>:20:                                     ; preds = %18
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
