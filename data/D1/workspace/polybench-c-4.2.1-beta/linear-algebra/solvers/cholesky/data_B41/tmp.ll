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
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader13.lr.ph:
  br label %.lr.ph35

.lr.ph35:                                         ; preds = %._crit_edge40, %.preheader13.lr.ph
  %indvars.iv85 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next86, %._crit_edge40 ]
  %indvars.iv83 = phi i64 [ 1, %.preheader13.lr.ph ], [ %indvars.iv.next84, %._crit_edge40 ]
  %2 = mul nuw nsw i64 %indvars.iv85, 2001
  %3 = add nuw nsw i64 %2, 1
  %4 = sub nsw i64 1998, %indvars.iv85
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph35
  %indvars.iv69 = phi i64 [ 0, %.lr.ph35 ], [ %indvars.iv.next70, %._crit_edge ]
  %7 = sub nsw i64 0, %indvars.iv69
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv69
  store double %12, double* %13, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next70, %indvars.iv83
  br i1 %exitcond74, label %._crit_edge36, label %._crit_edge

._crit_edge36:                                    ; preds = %._crit_edge
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %3
  %14 = add nuw nsw i64 %6, 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %15 = icmp slt i64 %indvars.iv.next86, 2000
  br i1 %15, label %._crit_edge40.loopexit, label %._crit_edge40

._crit_edge40.loopexit:                           ; preds = %._crit_edge36
  %16 = bitcast double* %scevgep81 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %16, i8 0, i64 %14, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge36, %._crit_edge40.loopexit
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv85, i64 %indvars.iv85
  store double 1.000000e+00, double* %17, align 8
  %exitcond96 = icmp eq i64 %indvars.iv.next86, 2000
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  br i1 %exitcond96, label %._crit_edge42, label %.lr.ph35

._crit_edge42:                                    ; preds = %._crit_edge40
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us, %._crit_edge42
  %indvars.iv65 = phi i64 [ 0, %._crit_edge42 ], [ %indvars.iv.next66.7, %._crit_edge32.us ]
  %19 = mul nuw nsw i64 %indvars.iv65, 16000
  %scevgep = getelementptr i8, i8* %18, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66 = or i64 %indvars.iv65, 1
  %20 = mul nuw nsw i64 %indvars.iv.next66, 16000
  %scevgep.1 = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.1 = or i64 %indvars.iv65, 2
  %21 = mul nuw nsw i64 %indvars.iv.next66.1, 16000
  %scevgep.2 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.2 = or i64 %indvars.iv65, 3
  %22 = mul nuw nsw i64 %indvars.iv.next66.2, 16000
  %scevgep.3 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.3 = or i64 %indvars.iv65, 4
  %23 = mul nuw nsw i64 %indvars.iv.next66.3, 16000
  %scevgep.4 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.4 = or i64 %indvars.iv65, 5
  %24 = mul nuw nsw i64 %indvars.iv.next66.4, 16000
  %scevgep.5 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.5 = or i64 %indvars.iv65, 6
  %25 = mul nuw nsw i64 %indvars.iv.next66.5, 16000
  %scevgep.6 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.6 = or i64 %indvars.iv65, 7
  %26 = mul nuw nsw i64 %indvars.iv.next66.6, 16000
  %scevgep.7 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next66.7 = add nuw nsw i64 %indvars.iv65, 8
  %exitcond94.7 = icmp eq i64 %indvars.iv.next66.7, 2000
  br i1 %exitcond94.7, label %.preheader9.us.us.preheader.preheader, label %._crit_edge32.us

.preheader9.us.us.preheader.preheader:            ; preds = %._crit_edge32.us
  %27 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %28 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %.preheader9.us.us.preheader.preheader, %._crit_edge21.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge21.us ], [ 0, %.preheader9.us.us.preheader.preheader ]
  br label %.preheader9.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge19.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond92, label %.preheader.us.preheader, label %.preheader9.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge21.us
  br label %.preheader.us

.preheader9.us.us:                                ; preds = %._crit_edge19.us.us, %.preheader9.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next54, %._crit_edge19.us.us ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv57
  br label %._crit_edge97

._crit_edge19.us.us:                              ; preds = %._crit_edge97
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond91, label %._crit_edge21.us, label %.preheader9.us.us

._crit_edge97:                                    ; preds = %._crit_edge97, %.preheader9.us.us
  %indvars.iv49 = phi i64 [ 0, %.preheader9.us.us ], [ %indvars.iv.next50.1, %._crit_edge97 ]
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv49, i64 %indvars.iv57
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %37 = load double, double* %29, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next50, i64 %indvars.iv57
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next50
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %40
  store double %43, double* %41, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond90.1, label %._crit_edge19.us.us, label %._crit_edge97

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep102 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 0
  %scevgep104 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 2000
  %scevgep106 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 0
  %scevgep108 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 2000
  %bound0 = icmp ult double* %scevgep102, %scevgep108
  %bound1 = icmp ult double* %scevgep106, %scevgep104
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge98.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

._crit_edge98.preheader:                          ; preds = %.preheader.us
  br label %._crit_edge98

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 %index
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !1
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load111 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %index
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %49, align 8, !alias.scope !4, !noalias !1
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load111, <2 x i64>* %51, align 8, !alias.scope !4, !noalias !1
  %index.next = or i64 %index, 4
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 %index.next
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !1
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load111.1 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !1
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %index.next
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %57, align 8, !alias.scope !4, !noalias !1
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load111.1, <2 x i64>* %59, align 8, !alias.scope !4, !noalias !1
  %index.next.1 = add nuw nsw i64 %index, 8
  %60 = icmp eq i64 %index.next.1, 2000
  br i1 %60, label %._crit_edge.us.loopexit112, label %vector.body, !llvm.loop !6

._crit_edge98:                                    ; preds = %._crit_edge98, %._crit_edge98.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge98.preheader ], [ %indvars.iv.next.4, %._crit_edge98 ]
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %67 = bitcast double* %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %77 = bitcast double* %76 to i64*
  %78 = load i64, i64* %77, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %80 = bitcast double* %79 to i64*
  store i64 %78, i64* %80, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.3
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.3
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond89.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond89.4, label %._crit_edge.us.loopexit, label %._crit_edge98, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %._crit_edge98
  br label %._crit_edge.us

._crit_edge.us.loopexit112:                       ; preds = %vector.body
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit112, %._crit_edge.us.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond, label %._crit_edge16, label %.preheader.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* %18) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
.preheader4.preheader:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv43 = phi i2 [ %indvars.iv.next44, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %indvars.iv25 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next26, %._crit_edge9 ]
  %2 = zext i2 %indvars.iv43 to i64
  %3 = add nsw i64 %indvars.iv25, -1
  %4 = icmp sgt i64 %indvars.iv25, 0
  br i1 %4, label %.preheader.preheader, label %.preheader4.._crit_edge9_crit_edge

.preheader.preheader:                             ; preds = %.preheader4
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 0
  br label %.preheader

.preheader4.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre34 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge9

.lr.ph8:                                          ; preds = %._crit_edge
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre33 = load double, double* %6, align 8
  %xtraiter37 = and i64 %indvars.iv25, 3
  %lcmp.mod38 = icmp eq i64 %xtraiter37, 0
  br i1 %lcmp.mod38, label %._crit_edge31.prol.loopexit, label %._crit_edge31.prol.preheader

._crit_edge31.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge31.prol

._crit_edge31.prol:                               ; preds = %._crit_edge31.prol, %._crit_edge31.prol.preheader
  %7 = phi double [ %.pre33, %._crit_edge31.prol.preheader ], [ %11, %._crit_edge31.prol ]
  %indvars.iv20.prol = phi i64 [ 0, %._crit_edge31.prol.preheader ], [ %indvars.iv.next21.prol, %._crit_edge31.prol ]
  %prol.iter = phi i64 [ %xtraiter37, %._crit_edge31.prol.preheader ], [ %prol.iter.sub, %._crit_edge31.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv20.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge31.prol.loopexit.unr-lcssa, label %._crit_edge31.prol, !llvm.loop !10

._crit_edge31.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge31.prol
  br label %._crit_edge31.prol.loopexit

._crit_edge31.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge31.prol.loopexit.unr-lcssa
  %.lcssa36.unr = phi double [ undef, %.lr.ph8 ], [ %11, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %.unr39 = phi double [ %.pre33, %.lr.ph8 ], [ %11, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph8 ], [ %2, %._crit_edge31.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %3, 3
  br i1 %12, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge31.prol.loopexit
  br label %._crit_edge31

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge ], [ 0, %.preheader.preheader ]
  %13 = icmp sgt i64 %indvars.iv14, 0
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv14
  %.pre = load double, double* %14, align 8
  br i1 %13, label %._crit_edge30.preheader, label %._crit_edge

._crit_edge30.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge30.prol.loopexit.unr-lcssa, label %._crit_edge30.prol.preheader

._crit_edge30.prol.preheader:                     ; preds = %._crit_edge30.preheader
  br label %._crit_edge30.prol

._crit_edge30.prol:                               ; preds = %._crit_edge30.prol.preheader
  %15 = load double, double* %5, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 0
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %14, align 8
  br label %._crit_edge30.prol.loopexit.unr-lcssa

._crit_edge30.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge30.preheader, %._crit_edge30.prol
  %.lcssa.unr.ph = phi double [ %19, %._crit_edge30.prol ], [ undef, %._crit_edge30.preheader ]
  %.unr.ph = phi double [ %19, %._crit_edge30.prol ], [ %.pre, %._crit_edge30.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge30.prol ], [ 0, %._crit_edge30.preheader ]
  br label %._crit_edge30.prol.loopexit

._crit_edge30.prol.loopexit:                      ; preds = %._crit_edge30.prol.loopexit.unr-lcssa
  %20 = icmp eq i64 %indvars.iv14, 1
  br i1 %20, label %._crit_edge.loopexit, label %._crit_edge30.preheader.new

._crit_edge30.preheader.new:                      ; preds = %._crit_edge30.prol.loopexit
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30, %._crit_edge30.preheader.new
  %21 = phi double [ %.unr.ph, %._crit_edge30.preheader.new ], [ %33, %._crit_edge30 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge30.preheader.new ], [ %indvars.iv.next.1, %._crit_edge30 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %14, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv14
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge30

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge30
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge30.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge30.prol.loopexit ], [ %33, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %34 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv14
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  store double %37, double* %14, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, %indvars.iv25
  br i1 %exitcond19, label %.lr.ph8, label %.preheader

._crit_edge31:                                    ; preds = %._crit_edge31, %.lr.ph8.new
  %38 = phi double [ %.unr39, %.lr.ph8.new ], [ %54, %._crit_edge31 ]
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr, %.lr.ph8.new ], [ %indvars.iv.next21.3, %._crit_edge31 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv20
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fsub double %38, %41
  store double %42, double* %6, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fsub double %42, %45
  store double %46, double* %6, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fsub double %46, %49
  store double %50, double* %6, align 8
  %indvars.iv.next21.2 = add nsw i64 %indvars.iv20, 3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next21.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fsub double %50, %53
  store double %54, double* %6, align 8
  %indvars.iv.next21.3 = add nsw i64 %indvars.iv20, 4
  %exitcond24.3 = icmp eq i64 %indvars.iv.next21.3, %indvars.iv25
  br i1 %exitcond24.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge31

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge31
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge31.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  %.lcssa36 = phi double [ %.lcssa36.unr, %._crit_edge31.prol.loopexit ], [ %54, %._crit_edge9.loopexit.unr-lcssa ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4.._crit_edge9_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader4.._crit_edge9_crit_edge ], [ %6, %._crit_edge9.loopexit ]
  %55 = phi double [ %.pre34, %.preheader4.._crit_edge9_crit_edge ], [ %.lcssa36, %._crit_edge9.loopexit ]
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %.pre-phi, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next26, 2000
  %indvars.iv.next44 = add i2 %indvars.iv43, 1
  br i1 %exitcond29, label %._crit_edge11, label %.preheader4

._crit_edge11:                                    ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next8, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv9, 2000
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge14, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge14 ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge14

; <label>:11:                                     ; preds = %._crit_edge15
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge15, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge, label %._crit_edge15

._crit_edge:                                      ; preds = %._crit_edge14
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, 2000
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  br i1 %exitcond13, label %._crit_edge4, label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
