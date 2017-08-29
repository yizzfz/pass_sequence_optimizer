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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
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
  br i1 %8, label %9, label %.._crit_edge_crit_edge4

.._crit_edge_crit_edge4:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge4, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %._crit_edge.preheader.lr.ph, label %._crit_edge39.thread

._crit_edge39.thread:                             ; preds = %2
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge12._crit_edge

._crit_edge.preheader.lr.ph:                      ; preds = %2
  br label %.lr.ph34

.lr.ph34:                                         ; preds = %._crit_edge8._crit_edge..lr.ph34_crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv87 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next88, %._crit_edge8._crit_edge..lr.ph34_crit_edge ]
  %indvars.iv85 = phi i64 [ 1, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next86, %._crit_edge8._crit_edge..lr.ph34_crit_edge ]
  br label %._crit_edge

._crit_edge8.preheader:                           ; preds = %._crit_edge
  %4 = sub i64 1998, %indvars.iv87
  %5 = mul nuw nsw i64 %indvars.iv87, 2001
  %6 = shl i64 %4, 3
  %7 = add nuw nsw i64 %5, 1
  %8 = and i64 %6, 34359738360
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %9 = icmp slt i64 %indvars.iv.next88, 2000
  br i1 %9, label %._crit_edge8._crit_edge.loopexit, label %._crit_edge8.preheader.._crit_edge8._crit_edge_crit_edge

._crit_edge8.preheader.._crit_edge8._crit_edge_crit_edge: ; preds = %._crit_edge8.preheader
  br label %._crit_edge8._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.lr.ph34
  %indvars.iv69 = phi i64 [ 0, %.lr.ph34 ], [ %indvars.iv.next70, %._crit_edge.._crit_edge_crit_edge ]
  %10 = sub nsw i64 0, %indvars.iv69
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv69
  store double %15, double* %16, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next70, %indvars.iv85
  br i1 %exitcond76, label %._crit_edge8.preheader, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge8._crit_edge.loopexit:                 ; preds = %._crit_edge8.preheader
  %17 = add nuw nsw i64 %8, 8
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %7
  %18 = bitcast double* %scevgep81 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %18, i8 0, i64 %17, i32 8, i1 false)
  br label %._crit_edge8._crit_edge

._crit_edge8._crit_edge:                          ; preds = %._crit_edge8.preheader.._crit_edge8._crit_edge_crit_edge, %._crit_edge8._crit_edge.loopexit
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv87, i64 %indvars.iv87
  store double 1.000000e+00, double* %19, align 8
  %exitcond90 = icmp eq i64 %indvars.iv.next88, 2000
  br i1 %exitcond90, label %._crit_edge39, label %._crit_edge8._crit_edge..lr.ph34_crit_edge

._crit_edge8._crit_edge..lr.ph34_crit_edge:       ; preds = %._crit_edge8._crit_edge
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  br label %.lr.ph34

._crit_edge39:                                    ; preds = %._crit_edge8._crit_edge
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge9._crit_edge.us

._crit_edge9._crit_edge.us:                       ; preds = %._crit_edge9._crit_edge.us.._crit_edge9._crit_edge.us_crit_edge, %._crit_edge39
  %indvars.iv65 = phi i64 [ 0, %._crit_edge39 ], [ %indvars.iv.next66, %._crit_edge9._crit_edge.us.._crit_edge9._crit_edge.us_crit_edge ]
  %21 = mul nuw nsw i64 %indvars.iv65, 16000
  %scevgep = getelementptr i8, i8* %20, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, 2000
  br i1 %exitcond68, label %._crit_edge9._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge, label %._crit_edge9._crit_edge.us.._crit_edge9._crit_edge.us_crit_edge

._crit_edge9._crit_edge.us.._crit_edge9._crit_edge.us_crit_edge: ; preds = %._crit_edge9._crit_edge.us
  br label %._crit_edge9._crit_edge.us

._crit_edge9._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge: ; preds = %._crit_edge9._crit_edge.us
  %22 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %._crit_edge13.preheader.us.us.preheader

._crit_edge13.preheader.us.us.preheader:          ; preds = %._crit_edge11._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge, %._crit_edge9._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge11._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge ], [ 0, %._crit_edge9._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge ]
  br label %._crit_edge13.preheader.us.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge13._crit_edge.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond60, label %._crit_edge11._crit_edge.us.._crit_edge14.preheader.us_crit_edge, label %._crit_edge11._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge

._crit_edge11._crit_edge.us.._crit_edge13.preheader.us.us.preheader_crit_edge: ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge13.preheader.us.us.preheader

._crit_edge11._crit_edge.us.._crit_edge14.preheader.us_crit_edge: ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge14.preheader.us

._crit_edge13.preheader.us.us:                    ; preds = %._crit_edge13._crit_edge.us.us.._crit_edge13.preheader.us.us_crit_edge, %._crit_edge13.preheader.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %._crit_edge13.preheader.us.us.preheader ], [ %indvars.iv.next54, %._crit_edge13._crit_edge.us.us.._crit_edge13.preheader.us.us_crit_edge ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv57
  br label %._crit_edge13.us.us

._crit_edge13._crit_edge.us.us:                   ; preds = %._crit_edge13.us.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond56, label %._crit_edge11._crit_edge.us, label %._crit_edge13._crit_edge.us.us.._crit_edge13.preheader.us.us_crit_edge

._crit_edge13._crit_edge.us.us.._crit_edge13.preheader.us.us_crit_edge: ; preds = %._crit_edge13._crit_edge.us.us
  br label %._crit_edge13.preheader.us.us

._crit_edge13.us.us:                              ; preds = %._crit_edge13.us.us.._crit_edge13.us.us_crit_edge, %._crit_edge13.preheader.us.us
  %indvars.iv49 = phi i64 [ 0, %._crit_edge13.preheader.us.us ], [ %indvars.iv.next50, %._crit_edge13.us.us.._crit_edge13.us.us_crit_edge ]
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv57
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %29 = load double, double* %28, align 8
  %30 = fadd double %29, %27
  store double %30, double* %28, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, 2000
  br i1 %exitcond52, label %._crit_edge13._crit_edge.us.us, label %._crit_edge13.us.us.._crit_edge13.us.us_crit_edge

._crit_edge13.us.us.._crit_edge13.us.us_crit_edge: ; preds = %._crit_edge13.us.us
  br label %._crit_edge13.us.us

._crit_edge14.preheader.us:                       ; preds = %._crit_edge14._crit_edge.us.._crit_edge14.preheader.us_crit_edge, %._crit_edge11._crit_edge.us.._crit_edge14.preheader.us_crit_edge
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge14._crit_edge.us.._crit_edge14.preheader.us_crit_edge ], [ 0, %._crit_edge11._crit_edge.us.._crit_edge14.preheader.us_crit_edge ]
  %scevgep94 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 0
  %scevgep96 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 2000
  %scevgep98 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv45, i64 0
  %scevgep100 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv45, i64 2000
  br i1 false, label %._crit_edge14.preheader.us.._crit_edge14.us_crit_edge, label %min.iters.checked

._crit_edge14.preheader.us.._crit_edge14.us_crit_edge: ; preds = %._crit_edge14.preheader.us
  br label %._crit_edge14.us.preheader

min.iters.checked:                                ; preds = %._crit_edge14.preheader.us
  br i1 false, label %min.iters.checked.._crit_edge14.us_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge14.us_crit_edge:     ; preds = %min.iters.checked
  br label %._crit_edge14.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep94, %scevgep100
  %bound1 = icmp ult double* %scevgep98, %scevgep96
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck.._crit_edge14.us_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck.._crit_edge14.us_crit_edge:       ; preds = %vector.memcheck
  br label %._crit_edge14.us.preheader

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.memcheck.vector.body_crit_edge ]
  %31 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv45, i64 %index
  %32 = bitcast double* %31 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  %wide.load103 = load <2 x i64>, <2 x i64>* %34, align 8, !alias.scope !1
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %index
  %36 = bitcast double* %35 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %36, align 8, !alias.scope !4, !noalias !1
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x i64>*
  store <2 x i64> %wide.load103, <2 x i64>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next = add i64 %index, 4
  %39 = icmp eq i64 %index.next, 2000
  br i1 %39, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 true, label %middle.block.._crit_edge14._crit_edge.us_crit_edge, label %middle.block.._crit_edge14.us_crit_edge

middle.block.._crit_edge14.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge14.us.preheader

._crit_edge14.us.preheader:                       ; preds = %._crit_edge14.preheader.us.._crit_edge14.us_crit_edge, %min.iters.checked.._crit_edge14.us_crit_edge, %vector.memcheck.._crit_edge14.us_crit_edge, %middle.block.._crit_edge14.us_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck.._crit_edge14.us_crit_edge ], [ 0, %min.iters.checked.._crit_edge14.us_crit_edge ], [ 0, %._crit_edge14.preheader.us.._crit_edge14.us_crit_edge ], [ 2000, %middle.block.._crit_edge14.us_crit_edge ]
  br label %._crit_edge14.us

middle.block.._crit_edge14._crit_edge.us_crit_edge: ; preds = %middle.block
  br label %._crit_edge14._crit_edge.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.preheader, %._crit_edge14.us.._crit_edge14.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge14.us.._crit_edge14.us_crit_edge ], [ %indvars.iv.ph, %._crit_edge14.us.preheader ]
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond44, label %._crit_edge14.us.._crit_edge14._crit_edge.us_crit_edge, label %._crit_edge14.us.._crit_edge14.us_crit_edge, !llvm.loop !9

._crit_edge14.us.._crit_edge14.us_crit_edge:      ; preds = %._crit_edge14.us
  br label %._crit_edge14.us

._crit_edge14.us.._crit_edge14._crit_edge.us_crit_edge: ; preds = %._crit_edge14.us
  br label %._crit_edge14._crit_edge.us

._crit_edge14._crit_edge.us:                      ; preds = %._crit_edge14.us.._crit_edge14._crit_edge.us_crit_edge, %middle.block.._crit_edge14._crit_edge.us_crit_edge
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond48, label %._crit_edge14._crit_edge.us.._crit_edge12._crit_edge_crit_edge, label %._crit_edge14._crit_edge.us.._crit_edge14.preheader.us_crit_edge

._crit_edge14._crit_edge.us.._crit_edge14.preheader.us_crit_edge: ; preds = %._crit_edge14._crit_edge.us
  br label %._crit_edge14.preheader.us

._crit_edge14._crit_edge.us.._crit_edge12._crit_edge_crit_edge: ; preds = %._crit_edge14._crit_edge.us
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge14._crit_edge.us.._crit_edge12._crit_edge_crit_edge, %._crit_edge39.thread
  %45 = phi i8* [ %3, %._crit_edge39.thread ], [ %20, %._crit_edge14._crit_edge.us.._crit_edge12._crit_edge_crit_edge ]
  tail call void @free(i8* %45) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %._crit_edge.preheader.preheader, label %.._crit_edge10_crit_edge

.._crit_edge10_crit_edge:                         ; preds = %2
  br label %._crit_edge10

._crit_edge.preheader.preheader:                  ; preds = %2
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv33 = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ %indvars.iv.next34, %._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge ]
  %3 = icmp sgt i64 %indvars.iv33, 0
  br i1 %3, label %._crit_edge.preheader.._crit_edge3.preheader_crit_edge, label %._crit_edge.preheader.._crit_edge4._crit_edge_crit_edge

._crit_edge.preheader.._crit_edge4._crit_edge_crit_edge: ; preds = %._crit_edge.preheader
  br label %._crit_edge4._crit_edge

._crit_edge.preheader.._crit_edge3.preheader_crit_edge: ; preds = %._crit_edge.preheader
  br label %._crit_edge3.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv33
  %.pre38 = load double, double* %4, align 8
  br label %._crit_edge4

._crit_edge3.preheader:                           ; preds = %._crit_edge.._crit_edge3.preheader_crit_edge, %._crit_edge.preheader.._crit_edge3.preheader_crit_edge
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge.._crit_edge3.preheader_crit_edge ], [ 0, %._crit_edge.preheader.._crit_edge3.preheader_crit_edge ]
  %5 = icmp sgt i64 %indvars.iv17, 0
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv17
  %.pre = load double, double* %6, align 8
  br i1 %5, label %._crit_edge3.preheader.._crit_edge3_crit_edge, label %._crit_edge3.preheader.._crit_edge_crit_edge

._crit_edge3.preheader.._crit_edge_crit_edge:     ; preds = %._crit_edge3.preheader
  br label %._crit_edge

._crit_edge3.preheader.._crit_edge3_crit_edge:    ; preds = %._crit_edge3.preheader
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.._crit_edge3_crit_edge, %._crit_edge3.preheader.._crit_edge3_crit_edge
  %7 = phi double [ %13, %._crit_edge3.._crit_edge3_crit_edge ], [ %.pre, %._crit_edge3.preheader.._crit_edge3_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge3.._crit_edge3_crit_edge ], [ 0, %._crit_edge3.preheader.._crit_edge3_crit_edge ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %7, %12
  store double %13, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next, %indvars.iv17
  br i1 %exitcond16, label %._crit_edge3.._crit_edge_crit_edge, label %._crit_edge3.._crit_edge3_crit_edge

._crit_edge3.._crit_edge3_crit_edge:              ; preds = %._crit_edge3
  br label %._crit_edge3

._crit_edge3.._crit_edge_crit_edge:               ; preds = %._crit_edge3
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3.._crit_edge_crit_edge, %._crit_edge3.preheader.._crit_edge_crit_edge
  %14 = phi double [ %.pre, %._crit_edge3.preheader.._crit_edge_crit_edge ], [ %13, %._crit_edge3.._crit_edge_crit_edge ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv17
  %16 = load double, double* %15, align 8
  %17 = fdiv double %14, %16
  store double %17, double* %6, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next18, %indvars.iv33
  br i1 %exitcond24, label %.lr.ph8, label %._crit_edge.._crit_edge3.preheader_crit_edge

._crit_edge.._crit_edge3.preheader_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge3.preheader

._crit_edge4:                                     ; preds = %._crit_edge4.._crit_edge4_crit_edge, %.lr.ph8
  %18 = phi double [ %.pre38, %.lr.ph8 ], [ %22, %._crit_edge4.._crit_edge4_crit_edge ]
  %indvars.iv25 = phi i64 [ 0, %.lr.ph8 ], [ %indvars.iv.next26, %._crit_edge4.._crit_edge4_crit_edge ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv25
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %20
  %22 = fsub double %18, %21
  store double %22, double* %4, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next26, %indvars.iv33
  br i1 %exitcond32, label %._crit_edge4.._crit_edge4._crit_edge_crit_edge, label %._crit_edge4.._crit_edge4_crit_edge

._crit_edge4.._crit_edge4_crit_edge:              ; preds = %._crit_edge4
  br label %._crit_edge4

._crit_edge4.._crit_edge4._crit_edge_crit_edge:   ; preds = %._crit_edge4
  br label %._crit_edge4._crit_edge

._crit_edge4._crit_edge:                          ; preds = %._crit_edge4.._crit_edge4._crit_edge_crit_edge, %._crit_edge.preheader.._crit_edge4._crit_edge_crit_edge
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv33
  %24 = load double, double* %23, align 8
  %25 = tail call double @sqrt(double %24) #3
  store double %25, double* %23, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond36, label %._crit_edge4._crit_edge.._crit_edge10_crit_edge, label %._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge

._crit_edge4._crit_edge.._crit_edge.preheader_crit_edge: ; preds = %._crit_edge4._crit_edge
  br label %._crit_edge.preheader

._crit_edge4._crit_edge.._crit_edge10_crit_edge:  ; preds = %._crit_edge4._crit_edge
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge4._crit_edge.._crit_edge10_crit_edge, %.._crit_edge10_crit_edge
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
  br i1 true, label %._crit_edge.preheader.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

._crit_edge.preheader.preheader:                  ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge._crit_edge..lr.ph_crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ %indvars.iv.next14, %._crit_edge._crit_edge..lr.ph_crit_edge ]
  %indvars.iv11 = phi i64 [ 1, %._crit_edge.preheader.preheader ], [ %indvars.iv.next12, %._crit_edge._crit_edge..lr.ph_crit_edge ]
  %7 = mul nsw i64 %indvars.iv13, 2000
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2.._crit_edge2._crit_edge_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2.._crit_edge2._crit_edge_crit_edge ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2._crit_edge.._crit_edge2_crit_edge

._crit_edge2._crit_edge.._crit_edge2_crit_edge:   ; preds = %._crit_edge2._crit_edge
  br label %._crit_edge2

; <label>:12:                                     ; preds = %._crit_edge2._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2._crit_edge.._crit_edge2_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %indvars.iv11
  br i1 %exitcond10, label %._crit_edge._crit_edge, label %._crit_edge2.._crit_edge2._crit_edge_crit_edge

._crit_edge2.._crit_edge2._crit_edge_crit_edge:   ; preds = %._crit_edge2
  br label %._crit_edge2._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge2
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond16, label %._crit_edge._crit_edge.._crit_edge_crit_edge, label %._crit_edge._crit_edge..lr.ph_crit_edge

._crit_edge._crit_edge..lr.ph_crit_edge:          ; preds = %._crit_edge._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %.lr.ph

._crit_edge._crit_edge.._crit_edge_crit_edge:     ; preds = %._crit_edge._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.._crit_edge_crit_edge, %.._crit_edge_crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
