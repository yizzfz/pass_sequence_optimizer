; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %1, %._crit_edge..preheader10_crit_edge
  %indvars.iv59 = phi i64 [ 0, %1 ], [ %indvars.iv.next60, %._crit_edge..preheader10_crit_edge ]
  %indvars.iv57 = phi i64 [ 1, %1 ], [ %indvars.iv.next58, %._crit_edge..preheader10_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv59, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %3
  %4 = sub i64 1998, %indvars.iv59
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  br label %._crit_edge62

.preheader9:                                      ; preds = %._crit_edge62
  %scevgep56 = bitcast double* %scevgep to i8*
  %7 = add nuw nsw i64 %6, 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %8 = icmp slt i64 %indvars.iv.next60, 2000
  br i1 %8, label %._crit_edge.thread, label %._crit_edge

._crit_edge62:                                    ; preds = %._crit_edge62.._crit_edge62_crit_edge, %.lr.ph
  %indvars.iv42 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next43, %._crit_edge62.._crit_edge62_crit_edge ]
  %9 = sub nsw i64 0, %indvars.iv42
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv42
  store double %14, double* %15, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next43, %indvars.iv57
  br i1 %exitcond50, label %.preheader9, label %._crit_edge62.._crit_edge62_crit_edge

._crit_edge62.._crit_edge62_crit_edge:            ; preds = %._crit_edge62
  br label %._crit_edge62

._crit_edge.thread:                               ; preds = %.preheader9
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep56, i8 0, i64 %7, i32 8, i1 false)
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %16, align 8
  br label %._crit_edge..preheader10_crit_edge

._crit_edge:                                      ; preds = %.preheader9
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59, i64 %indvars.iv59
  store double 1.000000e+00, double* %17, align 8
  %exitcond61 = icmp eq i64 %indvars.iv.next60, 2000
  br i1 %exitcond61, label %.preheader6.preheader, label %._crit_edge.._crit_edge..preheader10_crit_edge_crit_edge

._crit_edge.._crit_edge..preheader10_crit_edge_crit_edge: ; preds = %._crit_edge
  br label %._crit_edge..preheader10_crit_edge

._crit_edge..preheader10_crit_edge:               ; preds = %._crit_edge.._crit_edge..preheader10_crit_edge_crit_edge, %._crit_edge.thread
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br label %.lr.ph

.preheader6.preheader:                            ; preds = %._crit_edge
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 32000000, i32 8, i1 false)
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader6

.preheader6:                                      ; preds = %..preheader6_crit_edge, %.preheader6.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader6.preheader ], [ %20, %..preheader6_crit_edge ]
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv33
  %scevgep6869 = bitcast double* %scevgep68 to i8*
  %20 = add nuw nsw i64 %indvars.iv33, 1
  %scevgep70 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %20
  %scevgep7071 = bitcast double* %scevgep70 to i8*
  br label %.preheader5

.preheader5:                                      ; preds = %middle.block..preheader5_crit_edge, %.preheader6
  %indvars.iv30 = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next31, %middle.block..preheader5_crit_edge ]
  %21 = mul nuw nsw i64 %indvars.iv30, 16000
  %scevgep66 = getelementptr i8, i8* %18, i64 %21
  %22 = add nuw nsw i64 %21, 16000
  %scevgep67 = getelementptr i8, i8* %18, i64 %22
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv33
  %bound0 = icmp ult i8* %scevgep66, %scevgep7071
  %bound1 = icmp ult i8* %scevgep6869, %scevgep67
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %23 to i8*
  %bound073 = icmp ult i8* %scevgep66, %bc
  %bound174 = icmp ult i8* %bc, %scevgep67
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx = or i1 %found.conflict, %found.conflict75
  br i1 %conflict.rdx, label %._crit_edge63.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader5
  br label %vector.body

._crit_edge63.preheader:                          ; preds = %.preheader5
  br label %._crit_edge63

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %24 = or i64 %index, 1
  %25 = or i64 %index, 2
  %26 = or i64 %index, 3
  %27 = load double, double* %23, align 8, !alias.scope !1
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv33
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %24, i64 %indvars.iv33
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %25, i64 %indvars.iv33
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %26, i64 %indvars.iv33
  %34 = load double, double* %30, align 8, !alias.scope !4
  %35 = load double, double* %31, align 8, !alias.scope !4
  %36 = load double, double* %32, align 8, !alias.scope !4
  %37 = load double, double* %33, align 8, !alias.scope !4
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %37, i32 1
  %42 = fmul <2 x double> %29, %39
  %43 = fmul <2 x double> %29, %41
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv30, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !6, !noalias !8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !6, !noalias !8
  %48 = fadd <2 x double> %wide.load, %42
  %49 = fadd <2 x double> %wide.load77, %43
  store <2 x double> %48, <2 x double>* %45, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %49, <2 x double>* %47, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %50 = icmp eq i64 %index.next, 2000
  br i1 %50, label %middle.block.loopexit107, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge63:                                    ; preds = %._crit_edge63.._crit_edge63_crit_edge, %._crit_edge63.preheader
  %indvars.iv27 = phi i64 [ 0, %._crit_edge63.preheader ], [ %indvars.iv.next28.1, %._crit_edge63.._crit_edge63_crit_edge ]
  %51 = load double, double* %23, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv33
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv30, i64 %indvars.iv27
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next28 = or i64 %indvars.iv27, 1
  %58 = load double, double* %23, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next28, i64 %indvars.iv33
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next28
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %62, align 8
  %indvars.iv.next28.1 = add nuw nsw i64 %indvars.iv27, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next28.1, 2000
  br i1 %exitcond29.1, label %middle.block.loopexit, label %._crit_edge63.._crit_edge63_crit_edge, !llvm.loop !12

._crit_edge63.._crit_edge63_crit_edge:            ; preds = %._crit_edge63
  br label %._crit_edge63

middle.block.loopexit:                            ; preds = %._crit_edge63
  br label %middle.block

middle.block.loopexit107:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit107, %middle.block.loopexit
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next31, 2000
  br i1 %exitcond32, label %65, label %middle.block..preheader5_crit_edge

middle.block..preheader5_crit_edge:               ; preds = %middle.block
  br label %.preheader5

; <label>:65:                                     ; preds = %middle.block
  %exitcond35 = icmp eq i64 %20, 2000
  br i1 %exitcond35, label %.preheader.preheader, label %..preheader6_crit_edge

..preheader6_crit_edge:                           ; preds = %65
  br label %.preheader6

.preheader.preheader:                             ; preds = %65
  br label %.preheader

.preheader:                                       ; preds = %middle.block79..preheader_crit_edge, %.preheader.preheader
  %indvars.iv24 = phi i64 [ %66, %middle.block79..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 0
  %scevgep8384 = bitcast double* %scevgep83 to i8*
  %66 = add nuw nsw i64 %indvars.iv24, 1
  %scevgep85 = getelementptr [2000 x double], [2000 x double]* %0, i64 %66, i64 0
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  %67 = mul nuw nsw i64 %indvars.iv24, 16000
  %scevgep87 = getelementptr i8, i8* %18, i64 %67
  %68 = add nuw nsw i64 %67, 16000
  %scevgep88 = getelementptr i8, i8* %18, i64 %68
  %bound089 = icmp ult i8* %scevgep8384, %scevgep88
  %bound190 = icmp ult i8* %scevgep87, %scevgep8586
  %found.conflict91 = and i1 %bound089, %bound190
  br i1 %found.conflict91, label %._crit_edge64.preheader, label %vector.body78.preheader

vector.body78.preheader:                          ; preds = %.preheader
  br label %vector.body78

._crit_edge64.preheader:                          ; preds = %.preheader
  br label %._crit_edge64

vector.body78:                                    ; preds = %vector.body78.vector.body78_crit_edge, %vector.body78.preheader
  %index95 = phi i64 [ 0, %vector.body78.preheader ], [ %index.next96.1, %vector.body78.vector.body78_crit_edge ]
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv24, i64 %index95
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load103 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !13
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load104 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !13
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %index95
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load103, <2 x i64>* %74, align 8, !alias.scope !16, !noalias !13
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load104, <2 x i64>* %76, align 8, !alias.scope !16, !noalias !13
  %index.next96 = or i64 %index95, 4
  %77 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv24, i64 %index.next96
  %78 = bitcast double* %77 to <2 x i64>*
  %wide.load103.1 = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !13
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load104.1 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %index.next96
  %82 = bitcast double* %81 to <2 x i64>*
  store <2 x i64> %wide.load103.1, <2 x i64>* %82, align 8, !alias.scope !16, !noalias !13
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load104.1, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %index.next96.1 = add nuw nsw i64 %index95, 8
  %85 = icmp eq i64 %index.next96.1, 2000
  br i1 %85, label %middle.block79.loopexit106, label %vector.body78.vector.body78_crit_edge, !llvm.loop !18

vector.body78.vector.body78_crit_edge:            ; preds = %vector.body78
  br label %vector.body78

._crit_edge64:                                    ; preds = %._crit_edge64.._crit_edge64_crit_edge, %._crit_edge64.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge64.preheader ], [ %indvars.iv.next.4, %._crit_edge64.._crit_edge64_crit_edge ]
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv24, i64 %indvars.iv
  %87 = bitcast double* %86 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv24, i64 %indvars.iv.next
  %92 = bitcast double* %91 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv.next
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv24, i64 %indvars.iv.next.1
  %97 = bitcast double* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv.next.1
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv24, i64 %indvars.iv.next.2
  %102 = bitcast double* %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv.next.2
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv24, i64 %indvars.iv.next.3
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv.next.3
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block79.loopexit, label %._crit_edge64.._crit_edge64_crit_edge, !llvm.loop !19

._crit_edge64.._crit_edge64_crit_edge:            ; preds = %._crit_edge64
  br label %._crit_edge64

middle.block79.loopexit:                          ; preds = %._crit_edge64
  br label %middle.block79

middle.block79.loopexit106:                       ; preds = %vector.body78
  br label %middle.block79

middle.block79:                                   ; preds = %middle.block79.loopexit106, %middle.block79.loopexit
  %exitcond26 = icmp eq i64 %66, 2000
  br i1 %exitcond26, label %111, label %middle.block79..preheader_crit_edge

middle.block79..preheader_crit_edge:              ; preds = %middle.block79
  br label %.preheader

; <label>:111:                                    ; preds = %middle.block79
  tail call void @free(i8* nonnull %18) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge11..preheader5_crit_edge, %2
  %indvars.iv47 = phi i2 [ %indvars.iv.next48, %._crit_edge11..preheader5_crit_edge ], [ 0, %2 ]
  %indvars.iv36 = phi i64 [ 0, %2 ], [ %indvars.iv.next37, %._crit_edge11..preheader5_crit_edge ]
  %3 = zext i2 %indvars.iv47 to i64
  %4 = add nsw i64 %indvars.iv36, -1
  %5 = icmp sgt i64 %indvars.iv36, 0
  br i1 %5, label %.preheader.preheader, label %.preheader5.._crit_edge11_crit_edge

.preheader5.._crit_edge11_crit_edge:              ; preds = %.preheader5
  br label %._crit_edge11

.preheader.preheader:                             ; preds = %.preheader5
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 0
  br label %.preheader

.lr.ph10:                                         ; preds = %._crit_edge
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv36
  %.pre41 = load double, double* %7, align 8
  %xtraiter42 = and i64 %indvars.iv36, 3
  %lcmp.mod43 = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod43, label %.lr.ph10.._crit_edge39.prol.loopexit_crit_edge, label %._crit_edge39.prol.preheader

.lr.ph10.._crit_edge39.prol.loopexit_crit_edge:   ; preds = %.lr.ph10
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.preheader:                     ; preds = %.lr.ph10
  br label %._crit_edge39.prol

._crit_edge39.prol:                               ; preds = %._crit_edge39.prol.._crit_edge39.prol_crit_edge, %._crit_edge39.prol.preheader
  %8 = phi double [ %.pre41, %._crit_edge39.prol.preheader ], [ %12, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %indvars.iv28.prol = phi i64 [ 0, %._crit_edge39.prol.preheader ], [ %indvars.iv.next29.prol, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter42, %._crit_edge39.prol.preheader ], [ %prol.iter.sub, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv28.prol
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %10
  %12 = fsub double %8, %11
  store double %12, double* %7, align 8
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv28.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge39.prol.loopexit.unr-lcssa, label %._crit_edge39.prol.._crit_edge39.prol_crit_edge, !llvm.loop !20

._crit_edge39.prol.._crit_edge39.prol_crit_edge:  ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol

._crit_edge39.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.loopexit:                      ; preds = %.lr.ph10.._crit_edge39.prol.loopexit_crit_edge, %._crit_edge39.prol.loopexit.unr-lcssa
  %.unr44 = phi double [ %.pre41, %.lr.ph10.._crit_edge39.prol.loopexit_crit_edge ], [ %12, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %indvars.iv28.unr = phi i64 [ 0, %.lr.ph10.._crit_edge39.prol.loopexit_crit_edge ], [ %3, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %4, 3
  br i1 %13, label %._crit_edge39.prol.loopexit.._crit_edge11.loopexit_crit_edge, label %.lr.ph10.new

._crit_edge39.prol.loopexit.._crit_edge11.loopexit_crit_edge: ; preds = %._crit_edge39.prol.loopexit
  br label %._crit_edge11.loopexit

.lr.ph10.new:                                     ; preds = %._crit_edge39.prol.loopexit
  br label %._crit_edge39

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %14 = icmp sgt i64 %indvars.iv20, 0
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv20
  %.pre = load double, double* %15, align 8
  br i1 %14, label %._crit_edge38.preheader, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

._crit_edge38.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv20, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge, label %._crit_edge38.prol.preheader

._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge: ; preds = %._crit_edge38.preheader
  br label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.preheader:                     ; preds = %._crit_edge38.preheader
  br label %._crit_edge38.prol

._crit_edge38.prol:                               ; preds = %._crit_edge38.prol.preheader
  %16 = load double, double* %6, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 0
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %.pre, %19
  store double %20, double* %15, align 8
  br label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge, %._crit_edge38.prol
  %.lcssa.unr.ph = phi double [ %20, %._crit_edge38.prol ], [ undef, %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %20, %._crit_edge38.prol ], [ %.pre, %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge38.prol ], [ 0, %._crit_edge38.preheader.._crit_edge38.prol.loopexit.unr-lcssa_crit_edge ]
  br label %._crit_edge38.prol.loopexit

._crit_edge38.prol.loopexit:                      ; preds = %._crit_edge38.prol.loopexit.unr-lcssa
  %21 = icmp eq i64 %indvars.iv20, 1
  br i1 %21, label %._crit_edge38.prol.loopexit.._crit_edge.loopexit_crit_edge, label %._crit_edge38.preheader.new

._crit_edge38.prol.loopexit.._crit_edge.loopexit_crit_edge: ; preds = %._crit_edge38.prol.loopexit
  br label %._crit_edge.loopexit

._crit_edge38.preheader.new:                      ; preds = %._crit_edge38.prol.loopexit
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.._crit_edge38_crit_edge, %._crit_edge38.preheader.new
  %22 = phi double [ %.unr.ph, %._crit_edge38.preheader.new ], [ %34, %._crit_edge38.._crit_edge38_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge38.preheader.new ], [ %indvars.iv.next.1, %._crit_edge38.._crit_edge38_crit_edge ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fsub double %22, %27
  store double %28, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %28, %33
  store double %34, double* %15, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond19.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge38.._crit_edge38_crit_edge

._crit_edge38.._crit_edge38_crit_edge:            ; preds = %._crit_edge38
  br label %._crit_edge38

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge38
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge38.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge38.prol.loopexit.._crit_edge.loopexit_crit_edge ], [ %34, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %35 = phi double [ %.pre, %.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv20
  %37 = load double, double* %36, align 8
  %38 = fdiv double %35, %37
  store double %38, double* %15, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next21, %indvars.iv36
  br i1 %exitcond27, label %.lr.ph10, label %._crit_edge..preheader_crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

._crit_edge39:                                    ; preds = %._crit_edge39.._crit_edge39_crit_edge, %.lr.ph10.new
  %39 = phi double [ %.unr44, %.lr.ph10.new ], [ %55, %._crit_edge39.._crit_edge39_crit_edge ]
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr, %.lr.ph10.new ], [ %indvars.iv.next29.3, %._crit_edge39.._crit_edge39_crit_edge ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv28
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fsub double %39, %42
  store double %43, double* %7, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next29
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fsub double %43, %46
  store double %47, double* %7, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next29.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %49
  %51 = fsub double %47, %50
  store double %51, double* %7, align 8
  %indvars.iv.next29.2 = add nsw i64 %indvars.iv28, 3
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next29.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %53
  %55 = fsub double %51, %54
  store double %55, double* %7, align 8
  %indvars.iv.next29.3 = add nsw i64 %indvars.iv28, 4
  %exitcond35.3 = icmp eq i64 %indvars.iv.next29.3, %indvars.iv36
  br i1 %exitcond35.3, label %._crit_edge11.loopexit.unr-lcssa, label %._crit_edge39.._crit_edge39_crit_edge

._crit_edge39.._crit_edge39_crit_edge:            ; preds = %._crit_edge39
  br label %._crit_edge39

._crit_edge11.loopexit.unr-lcssa:                 ; preds = %._crit_edge39
  br label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge39.prol.loopexit.._crit_edge11.loopexit_crit_edge, %._crit_edge11.loopexit.unr-lcssa
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.preheader5.._crit_edge11_crit_edge, %._crit_edge11.loopexit
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv36
  %57 = load double, double* %56, align 8
  %58 = tail call double @sqrt(double %57) #3
  store double %58, double* %56, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 2000
  %indvars.iv.next48 = add i2 %indvars.iv47, 1
  br i1 %exitcond, label %59, label %._crit_edge11..preheader5_crit_edge

._crit_edge11..preheader5_crit_edge:              ; preds = %._crit_edge11
  br label %.preheader5

; <label>:59:                                     ; preds = %._crit_edge11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %2
  %indvars.iv13 = phi i64 [ 0, %2 ], [ %indvars.iv.next14, %._crit_edge..lr.ph_crit_edge ]
  %indvars.iv11 = phi i64 [ 1, %2 ], [ %indvars.iv.next12, %._crit_edge..lr.ph_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv13, 2000
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge15.._crit_edge16_crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge16.._crit_edge15_crit_edge

._crit_edge16.._crit_edge15_crit_edge:            ; preds = %._crit_edge16
  br label %._crit_edge15

; <label>:12:                                     ; preds = %._crit_edge16
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge16.._crit_edge15_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %indvars.iv11
  br i1 %exitcond10, label %._crit_edge, label %._crit_edge15.._crit_edge16_crit_edge

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16

._crit_edge:                                      ; preds = %._crit_edge15
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 2000
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond, label %18, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

; <label>:18:                                     ; preds = %._crit_edge
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
