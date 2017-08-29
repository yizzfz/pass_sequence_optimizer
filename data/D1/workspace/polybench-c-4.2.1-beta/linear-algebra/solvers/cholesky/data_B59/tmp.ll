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
  tail call fastcc void @kernel_cholesky([2000 x double]* %4)
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
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
._crit_edge.preheader.lr.ph:
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge
  %indvars.iv76 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next77, %._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge ]
  %indvars.iv74 = phi i64 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next75, %._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv76, 2001
  %2 = sub i64 1998, %indvars.iv76
  %3 = shl i64 %2, 3
  br label %._crit_edge

._crit_edge8.preheader:                           ; preds = %._crit_edge
  %4 = add nuw nsw i64 %1, 1
  %5 = and i64 %3, 34359738360
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %4
  %6 = add nuw nsw i64 %5, 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %7 = icmp slt i64 %indvars.iv.next77, 2000
  br i1 %7, label %._crit_edge8._crit_edge.thread, label %._crit_edge8._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph34
  %indvars.iv59 = phi i64 [ 0, %.lr.ph34 ], [ %indvars.iv.next60, %._crit_edge.._crit_edge_crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv59
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv59
  store double %13, double* %14, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next60, %indvars.iv74
  br i1 %exitcond67, label %._crit_edge8.preheader, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge8._crit_edge.thread:                   ; preds = %._crit_edge8.preheader
  %15 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %15, i8 0, i64 %6, i32 8, i1 false)
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %16, align 8
  br label %._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge

._crit_edge8._crit_edge:                          ; preds = %._crit_edge8.preheader
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %17, align 8
  %exitcond78 = icmp eq i64 %indvars.iv.next77, 2000
  br i1 %exitcond78, label %._crit_edge11.preheader.lr.ph, label %._crit_edge8._crit_edge.._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge_crit_edge

._crit_edge8._crit_edge.._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge_crit_edge: ; preds = %._crit_edge8._crit_edge
  br label %._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge

._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge: ; preds = %._crit_edge8._crit_edge.._crit_edge8._crit_edge.._crit_edge.preheader_crit_edge_crit_edge, %._crit_edge8._crit_edge.thread
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  br label %.lr.ph34

._crit_edge11.preheader.lr.ph:                    ; preds = %._crit_edge8._crit_edge
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 32000000, i32 8, i1 false)
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %20 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %._crit_edge13.preheader.us.us.preheader

._crit_edge13.preheader.us.us.preheader:          ; preds = %._crit_edge11._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge, %._crit_edge11.preheader.lr.ph
  %indvars.iv50 = phi i64 [ 0, %._crit_edge11.preheader.lr.ph ], [ %indvars.iv.next51, %._crit_edge11._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge ]
  br label %._crit_edge13.preheader.us.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge13._crit_edge.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond52, label %._crit_edge14.preheader.us.preheader, label %._crit_edge11._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge

._crit_edge11._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge: ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge13.preheader.us.us.preheader

._crit_edge14.preheader.us.preheader:             ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge14.preheader.us

._crit_edge13.preheader.us.us:                    ; preds = %._crit_edge13._crit_edge.us.us.._crit_edge13.preheader.us.us_crit_edge, %._crit_edge13.preheader.us.us.preheader
  %indvars.iv47 = phi i64 [ 0, %._crit_edge13.preheader.us.us.preheader ], [ %indvars.iv.next48, %._crit_edge13._crit_edge.us.us.._crit_edge13.preheader.us.us_crit_edge ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv47, i64 %indvars.iv50
  br label %._crit_edge13.us.us

._crit_edge13._crit_edge.us.us:                   ; preds = %._crit_edge13.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond49, label %._crit_edge11._crit_edge.us, label %._crit_edge13._crit_edge.us.us.._crit_edge13.preheader.us.us_crit_edge

._crit_edge13._crit_edge.us.us.._crit_edge13.preheader.us.us_crit_edge: ; preds = %._crit_edge13._crit_edge.us.us
  br label %._crit_edge13.preheader.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us.._crit_edge13.us.us_crit_edge, %._crit_edge13.preheader.us.us
  %indvars.iv44 = phi i64 [ 0, %._crit_edge13.preheader.us.us ], [ %indvars.iv.next45.1, %._crit_edge13.us.us.._crit_edge13.us.us_crit_edge ]
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv50
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv47, i64 %indvars.iv44
  %27 = load double, double* %26, align 8
  %28 = fadd double %27, %25
  store double %28, double* %26, align 8
  %indvars.iv.next45 = or i64 %indvars.iv44, 1
  %29 = load double, double* %21, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next45, i64 %indvars.iv50
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next45
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next45.1 = add nuw nsw i64 %indvars.iv44, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next45.1, 2000
  br i1 %exitcond46.1, label %._crit_edge13._crit_edge.us.us, label %._crit_edge13.us.us.._crit_edge13.us.us_crit_edge

._crit_edge13.us.us.._crit_edge13.us.us_crit_edge: ; preds = %._crit_edge13.us.us
  br label %._crit_edge13.us.us

._crit_edge14.preheader.us:                       ; preds = %._crit_edge14._crit_edge.us.._crit_edge14.preheader.us_crit_edge, %._crit_edge14.preheader.us.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge14._crit_edge.us.._crit_edge14.preheader.us_crit_edge ], [ 0, %._crit_edge14.preheader.us.preheader ]
  %scevgep1 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 0
  %36 = add nuw i64 %indvars.iv41, 1
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 %36, i64 0
  %scevgep5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv41, i64 0
  %scevgep7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %36, i64 0
  %bound0 = icmp ult double* %scevgep1, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge14.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge14.preheader.us
  br label %vector.body

._crit_edge14.us.preheader:                       ; preds = %._crit_edge14.preheader.us
  br label %._crit_edge14.us

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body.vector.body_crit_edge ]
  %37 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv41, i64 %index
  %38 = bitcast double* %37 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !1
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x i64>*
  %wide.load10 = load <2 x i64>, <2 x i64>* %40, align 8, !alias.scope !1
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 %index
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %42, align 8, !alias.scope !4, !noalias !1
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %wide.load10, <2 x i64>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next = or i64 %index, 4
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv41, i64 %index.next
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !1
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x i64>*
  %wide.load10.1 = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 %index.next
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %50, align 8, !alias.scope !4, !noalias !1
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  store <2 x i64> %wide.load10.1, <2 x i64>* %52, align 8, !alias.scope !4, !noalias !1
  %index.next.1 = add nuw nsw i64 %index, 8
  %53 = icmp eq i64 %index.next.1, 2000
  br i1 %53, label %._crit_edge14._crit_edge.us.loopexit11, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.._crit_edge14.us_crit_edge, %._crit_edge14.us.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge14.us.preheader ], [ %indvars.iv.next.4, %._crit_edge14.us.._crit_edge14.us_crit_edge ]
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv41, i64 %indvars.iv
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 %indvars.iv
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv41, i64 %indvars.iv.next
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 %indvars.iv.next
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv41, i64 %indvars.iv.next.1
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 %indvars.iv.next.1
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv41, i64 %indvars.iv.next.2
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 %indvars.iv.next.2
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv41, i64 %indvars.iv.next.3
  %75 = bitcast double* %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv41, i64 %indvars.iv.next.3
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge14._crit_edge.us.loopexit, label %._crit_edge14.us.._crit_edge14.us_crit_edge, !llvm.loop !9

._crit_edge14.us.._crit_edge14.us_crit_edge:      ; preds = %._crit_edge14.us
  br label %._crit_edge14.us

._crit_edge14._crit_edge.us.loopexit:             ; preds = %._crit_edge14.us
  br label %._crit_edge14._crit_edge.us

._crit_edge14._crit_edge.us.loopexit11:           ; preds = %vector.body
  br label %._crit_edge14._crit_edge.us

._crit_edge14._crit_edge.us:                      ; preds = %._crit_edge14._crit_edge.us.loopexit11, %._crit_edge14._crit_edge.us.loopexit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next42, 2000
  br i1 %exitcond43, label %._crit_edge12._crit_edge, label %._crit_edge14._crit_edge.us.._crit_edge14.preheader.us_crit_edge

._crit_edge14._crit_edge.us.._crit_edge14.preheader.us_crit_edge: ; preds = %._crit_edge14._crit_edge.us
  br label %._crit_edge14.preheader.us

._crit_edge12._crit_edge:                         ; preds = %._crit_edge14._crit_edge.us
  tail call void @free(i8* nonnull %18) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
._crit_edge.preheader.preheader:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv9 = phi i2 [ %indvars.iv.next10, %._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge ], [ 0, %._crit_edge.preheader.preheader ]
  %indvars.iv33 = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ %indvars.iv.next34, %._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge ]
  %1 = zext i2 %indvars.iv9 to i64
  %2 = add nsw i64 %indvars.iv33, -1
  %3 = icmp sgt i64 %indvars.iv33, 0
  br i1 %3, label %._crit_edge3.preheader.preheader, label %._crit_edge.preheader.._crit_edge4._crit_edge_crit_edge

._crit_edge.preheader.._crit_edge4._crit_edge_crit_edge: ; preds = %._crit_edge.preheader
  br label %._crit_edge4._crit_edge

._crit_edge3.preheader.preheader:                 ; preds = %._crit_edge.preheader
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 0
  br label %._crit_edge3.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv33
  %.pre2 = load double, double* %5, align 8
  %xtraiter4 = and i64 %indvars.iv33, 3
  %lcmp.mod5 = icmp eq i64 %xtraiter4, 0
  br i1 %lcmp.mod5, label %.lr.ph8.._crit_edge4.prol.loopexit_crit_edge, label %._crit_edge4.prol.preheader

.lr.ph8.._crit_edge4.prol.loopexit_crit_edge:     ; preds = %.lr.ph8
  br label %._crit_edge4.prol.loopexit

._crit_edge4.prol.preheader:                      ; preds = %.lr.ph8
  br label %._crit_edge4.prol

._crit_edge4.prol:                                ; preds = %._crit_edge4.prol.._crit_edge4.prol_crit_edge, %._crit_edge4.prol.preheader
  %6 = phi double [ %.pre2, %._crit_edge4.prol.preheader ], [ %10, %._crit_edge4.prol.._crit_edge4.prol_crit_edge ]
  %indvars.iv25.prol = phi i64 [ 0, %._crit_edge4.prol.preheader ], [ %indvars.iv.next26.prol, %._crit_edge4.prol.._crit_edge4.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter4, %._crit_edge4.prol.preheader ], [ %prol.iter.sub, %._crit_edge4.prol.._crit_edge4.prol_crit_edge ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv25.prol
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fsub double %6, %9
  store double %10, double* %5, align 8
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv25.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge4.prol.loopexit.unr-lcssa, label %._crit_edge4.prol.._crit_edge4.prol_crit_edge, !llvm.loop !10

._crit_edge4.prol.._crit_edge4.prol_crit_edge:    ; preds = %._crit_edge4.prol
  br label %._crit_edge4.prol

._crit_edge4.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge4.prol
  br label %._crit_edge4.prol.loopexit

._crit_edge4.prol.loopexit:                       ; preds = %.lr.ph8.._crit_edge4.prol.loopexit_crit_edge, %._crit_edge4.prol.loopexit.unr-lcssa
  %.unr6 = phi double [ %.pre2, %.lr.ph8.._crit_edge4.prol.loopexit_crit_edge ], [ %10, %._crit_edge4.prol.loopexit.unr-lcssa ]
  %indvars.iv25.unr = phi i64 [ 0, %.lr.ph8.._crit_edge4.prol.loopexit_crit_edge ], [ %1, %._crit_edge4.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %2, 3
  br i1 %11, label %._crit_edge4.prol.loopexit.._crit_edge4._crit_edge.loopexit_crit_edge, label %.lr.ph8.new

._crit_edge4.prol.loopexit.._crit_edge4._crit_edge.loopexit_crit_edge: ; preds = %._crit_edge4.prol.loopexit
  br label %._crit_edge4._crit_edge.loopexit

.lr.ph8.new:                                      ; preds = %._crit_edge4.prol.loopexit
  br label %._crit_edge4

._crit_edge3.preheader:                           ; preds = %._crit_edge.._crit_edge3.preheader_crit_edge, %._crit_edge3.preheader.preheader
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge.._crit_edge3.preheader_crit_edge ], [ 0, %._crit_edge3.preheader.preheader ]
  %12 = icmp sgt i64 %indvars.iv17, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv17
  %.pre = load double, double* %13, align 8
  br i1 %12, label %._crit_edge3.preheader3, label %._crit_edge3.preheader.._crit_edge_crit_edge

._crit_edge3.preheader.._crit_edge_crit_edge:     ; preds = %._crit_edge3.preheader
  br label %._crit_edge

._crit_edge3.preheader3:                          ; preds = %._crit_edge3.preheader
  %xtraiter = and i64 %indvars.iv17, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge3.preheader3.._crit_edge3.prol.loopexit.unr-lcssa_crit_edge, label %._crit_edge3.prol.preheader

._crit_edge3.preheader3.._crit_edge3.prol.loopexit.unr-lcssa_crit_edge: ; preds = %._crit_edge3.preheader3
  br label %._crit_edge3.prol.loopexit.unr-lcssa

._crit_edge3.prol.preheader:                      ; preds = %._crit_edge3.preheader3
  br label %._crit_edge3.prol

._crit_edge3.prol:                                ; preds = %._crit_edge3.prol.preheader
  %14 = load double, double* %4, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 0
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %13, align 8
  br label %._crit_edge3.prol.loopexit.unr-lcssa

._crit_edge3.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge3.preheader3.._crit_edge3.prol.loopexit.unr-lcssa_crit_edge, %._crit_edge3.prol
  %.lcssa.unr.ph = phi double [ %18, %._crit_edge3.prol ], [ undef, %._crit_edge3.preheader3.._crit_edge3.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %18, %._crit_edge3.prol ], [ %.pre, %._crit_edge3.preheader3.._crit_edge3.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge3.prol ], [ 0, %._crit_edge3.preheader3.._crit_edge3.prol.loopexit.unr-lcssa_crit_edge ]
  br label %._crit_edge3.prol.loopexit

._crit_edge3.prol.loopexit:                       ; preds = %._crit_edge3.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %indvars.iv17, 1
  br i1 %19, label %._crit_edge3.prol.loopexit.._crit_edge.loopexit_crit_edge, label %._crit_edge3.preheader3.new

._crit_edge3.prol.loopexit.._crit_edge.loopexit_crit_edge: ; preds = %._crit_edge3.prol.loopexit
  br label %._crit_edge.loopexit

._crit_edge3.preheader3.new:                      ; preds = %._crit_edge3.prol.loopexit
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.._crit_edge3_crit_edge, %._crit_edge3.preheader3.new
  %20 = phi double [ %.unr.ph, %._crit_edge3.preheader3.new ], [ %32, %._crit_edge3.._crit_edge3_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge3.preheader3.new ], [ %indvars.iv.next.1, %._crit_edge3.._crit_edge3_crit_edge ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv17
  br i1 %exitcond16.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge3.._crit_edge3_crit_edge

._crit_edge3.._crit_edge3_crit_edge:              ; preds = %._crit_edge3
  br label %._crit_edge3

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge3
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge3.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge3.prol.loopexit.._crit_edge.loopexit_crit_edge ], [ %32, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit
  %33 = phi double [ %.pre, %._crit_edge3.preheader.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv17, i64 %indvars.iv17
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %13, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next18, %indvars.iv33
  br i1 %exitcond24, label %.lr.ph8, label %._crit_edge.._crit_edge3.preheader_crit_edge

._crit_edge.._crit_edge3.preheader_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge3.preheader

._crit_edge4:                                     ; preds = %._crit_edge4.._crit_edge4_crit_edge, %.lr.ph8.new
  %37 = phi double [ %.unr6, %.lr.ph8.new ], [ %53, %._crit_edge4.._crit_edge4_crit_edge ]
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr, %.lr.ph8.new ], [ %indvars.iv.next26.3, %._crit_edge4.._crit_edge4_crit_edge ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv25
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fsub double %37, %40
  store double %41, double* %5, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv.next26
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %5, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv.next26.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %5, align 8
  %indvars.iv.next26.2 = add nsw i64 %indvars.iv25, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv.next26.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %5, align 8
  %indvars.iv.next26.3 = add nsw i64 %indvars.iv25, 4
  %exitcond32.3 = icmp eq i64 %indvars.iv.next26.3, %indvars.iv33
  br i1 %exitcond32.3, label %._crit_edge4._crit_edge.loopexit.unr-lcssa, label %._crit_edge4.._crit_edge4_crit_edge

._crit_edge4.._crit_edge4_crit_edge:              ; preds = %._crit_edge4
  br label %._crit_edge4

._crit_edge4._crit_edge.loopexit.unr-lcssa:       ; preds = %._crit_edge4
  br label %._crit_edge4._crit_edge.loopexit

._crit_edge4._crit_edge.loopexit:                 ; preds = %._crit_edge4.prol.loopexit.._crit_edge4._crit_edge.loopexit_crit_edge, %._crit_edge4._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge4._crit_edge

._crit_edge4._crit_edge:                          ; preds = %._crit_edge.preheader.._crit_edge4._crit_edge_crit_edge, %._crit_edge4._crit_edge.loopexit
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv33
  %55 = load double, double* %54, align 8
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %54, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond, label %._crit_edge10, label %._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge

._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge: ; preds = %._crit_edge4._crit_edge
  %indvars.iv.next10 = add i2 %indvars.iv9, 1
  br label %._crit_edge.preheader

._crit_edge10:                                    ; preds = %._crit_edge4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge._crit_edge..lr.ph_crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ %indvars.iv.next14, %._crit_edge._crit_edge..lr.ph_crit_edge ]
  %indvars.iv11 = phi i64 [ 1, %._crit_edge.preheader.preheader ], [ %indvars.iv.next12, %._crit_edge._crit_edge..lr.ph_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv13, 2000
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2.._crit_edge2._crit_edge_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2.._crit_edge2._crit_edge_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge2._crit_edge.._crit_edge2_crit_edge

._crit_edge2._crit_edge.._crit_edge2_crit_edge:   ; preds = %._crit_edge2._crit_edge
  br label %._crit_edge2

; <label>:10:                                     ; preds = %._crit_edge2._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2._crit_edge.._crit_edge2_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %indvars.iv11
  br i1 %exitcond10, label %._crit_edge._crit_edge, label %._crit_edge2.._crit_edge2._crit_edge_crit_edge

._crit_edge2.._crit_edge2._crit_edge_crit_edge:   ; preds = %._crit_edge2
  br label %._crit_edge2._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge2
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 2000
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond, label %._crit_edge, label %._crit_edge._crit_edge..lr.ph_crit_edge

._crit_edge._crit_edge..lr.ph_crit_edge:          ; preds = %._crit_edge._crit_edge
  br label %.lr.ph

._crit_edge:                                      ; preds = %._crit_edge._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
