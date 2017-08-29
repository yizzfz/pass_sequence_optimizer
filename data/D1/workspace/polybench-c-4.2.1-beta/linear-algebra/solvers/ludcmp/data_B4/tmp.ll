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
  tail call fastcc void @init_array([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(double* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph41.preheader:
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41..lr.ph41_crit_edge, %.lr.ph41.preheader
  %indvars.iv79 = phi i64 [ 0, %.lr.ph41.preheader ], [ %indvars.iv.next80.1, %.lr.ph41..lr.ph41_crit_edge ]
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv79
  %5 = bitcast double* %4 to <2 x double>*
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv79
  %7 = bitcast double* %6 to <2 x double>*
  %8 = trunc i64 %indvars.iv79 to i32
  %9 = or i32 %8, 1
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv79
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  %12 = trunc i64 %indvars.iv.next80.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %10, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 2.000000e+03, double 2.000000e+03>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fadd <2 x double> %17, <double 4.000000e+00, double 4.000000e+00>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond81.1 = icmp eq i64 %indvars.iv.next80.1, 2000
  br i1 %exitcond81.1, label %.lr.ph41..lr.ph36_crit_edge, label %.lr.ph41..lr.ph41_crit_edge

.lr.ph41..lr.ph41_crit_edge:                      ; preds = %.lr.ph41
  br label %.lr.ph41

.lr.ph41..lr.ph36_crit_edge:                      ; preds = %.lr.ph41
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.lr.ph41..lr.ph36_crit_edge, %.lr.ph36.backedge
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %.lr.ph36.backedge ], [ 0, %.lr.ph41..lr.ph36_crit_edge ]
  %indvars.iv74 = phi i64 [ %indvars.iv74.be, %.lr.ph36.backedge ], [ 1, %.lr.ph41..lr.ph36_crit_edge ]
  %20 = mul nuw nsw i64 %indvars.iv76, 2001
  %21 = add nuw nsw i64 %20, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %21
  %scevgep73 = bitcast double* %scevgep to i8*
  %22 = sub i64 1998, %indvars.iv76
  %23 = shl i64 %22, 3
  %24 = and i64 %23, 34359738360
  %25 = add nuw nsw i64 %24, 8
  br label %._crit_edge9

._crit_edge10.preheader:                          ; preds = %._crit_edge9
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %26 = icmp slt i64 %indvars.iv.next77, 2000
  br i1 %26, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %._crit_edge10.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep73, i8 0, i64 %25, i32 8, i1 false)
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %27, align 8
  br label %.lr.ph36.backedge

._crit_edge9:                                     ; preds = %._crit_edge9.._crit_edge9_crit_edge, %.lr.ph36
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge9.._crit_edge9_crit_edge ], [ 0, %.lr.ph36 ]
  %28 = sub nsw i64 0, %indvars.iv63
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2000
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fadd double %32, 1.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv63
  store double %33, double* %34, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next64, %indvars.iv74
  br i1 %exitcond67, label %._crit_edge10.preheader, label %._crit_edge9.._crit_edge9_crit_edge

._crit_edge9.._crit_edge9_crit_edge:              ; preds = %._crit_edge9
  br label %._crit_edge9

._crit_edge:                                      ; preds = %._crit_edge10.preheader
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %35, align 8
  %exitcond78 = icmp eq i64 %indvars.iv.next77, 2000
  br i1 %exitcond78, label %._crit_edge13.preheader.lr.ph, label %._crit_edge..lr.ph36.backedge_crit_edge

._crit_edge..lr.ph36.backedge_crit_edge:          ; preds = %._crit_edge
  br label %.lr.ph36.backedge

.lr.ph36.backedge:                                ; preds = %._crit_edge..lr.ph36.backedge_crit_edge, %._crit_edge.thread
  %indvars.iv74.be = add nuw nsw i64 %indvars.iv74, 1
  br label %.lr.ph36

._crit_edge13.preheader.lr.ph:                    ; preds = %._crit_edge
  %36 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %37 = bitcast i8* %36 to [2000 x [2000 x double]]*
  call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 32000000, i32 8, i1 false)
  br label %._crit_edge15.preheader.us.us.preheader

._crit_edge15.preheader.us.us.preheader:          ; preds = %._crit_edge13._crit_edge.us.._crit_edge15.preheader.us.us.preheader_crit_edge, %._crit_edge13.preheader.lr.ph
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge13._crit_edge.us.._crit_edge15.preheader.us.us.preheader_crit_edge ], [ 0, %._crit_edge13.preheader.lr.ph ]
  br label %._crit_edge15.preheader.us.us

._crit_edge13._crit_edge.us:                      ; preds = %._crit_edge15._crit_edge.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next55, 2000
  br i1 %exitcond56, label %._crit_edge13._crit_edge.us.._crit_edge16.preheader.us_crit_edge, label %._crit_edge13._crit_edge.us.._crit_edge15.preheader.us.us.preheader_crit_edge

._crit_edge13._crit_edge.us.._crit_edge15.preheader.us.us.preheader_crit_edge: ; preds = %._crit_edge13._crit_edge.us
  br label %._crit_edge15.preheader.us.us.preheader

._crit_edge13._crit_edge.us.._crit_edge16.preheader.us_crit_edge: ; preds = %._crit_edge13._crit_edge.us
  br label %._crit_edge16.preheader.us

._crit_edge15.preheader.us.us:                    ; preds = %._crit_edge15._crit_edge.us.us.._crit_edge15.preheader.us.us_crit_edge, %._crit_edge15.preheader.us.us.preheader
  %indvars.iv51 = phi i64 [ 0, %._crit_edge15.preheader.us.us.preheader ], [ %indvars.iv.next52, %._crit_edge15._crit_edge.us.us.._crit_edge15.preheader.us.us_crit_edge ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv51, i64 %indvars.iv54
  br label %._crit_edge15.us.us

._crit_edge15._crit_edge.us.us:                   ; preds = %._crit_edge15.us.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond53, label %._crit_edge13._crit_edge.us, label %._crit_edge15._crit_edge.us.us.._crit_edge15.preheader.us.us_crit_edge

._crit_edge15._crit_edge.us.us.._crit_edge15.preheader.us.us_crit_edge: ; preds = %._crit_edge15._crit_edge.us.us
  br label %._crit_edge15.preheader.us.us

._crit_edge15.us.us:                              ; preds = %._crit_edge15.us.us.._crit_edge15.us.us_crit_edge, %._crit_edge15.preheader.us.us
  %indvars.iv48 = phi i64 [ 0, %._crit_edge15.preheader.us.us ], [ %indvars.iv.next49.1, %._crit_edge15.us.us.._crit_edge15.us.us_crit_edge ]
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv54
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv51, i64 %indvars.iv48
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %46 = load double, double* %38, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next49, i64 %indvars.iv54
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv51, i64 %indvars.iv.next49
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next49.1, 2000
  br i1 %exitcond50.1, label %._crit_edge15._crit_edge.us.us, label %._crit_edge15.us.us.._crit_edge15.us.us_crit_edge

._crit_edge15.us.us.._crit_edge15.us.us_crit_edge: ; preds = %._crit_edge15.us.us
  br label %._crit_edge15.us.us

._crit_edge16.preheader.us:                       ; preds = %._crit_edge16._crit_edge.us.._crit_edge16.preheader.us_crit_edge, %._crit_edge13._crit_edge.us.._crit_edge16.preheader.us_crit_edge
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge16._crit_edge.us.._crit_edge16.preheader.us_crit_edge ], [ 0, %._crit_edge13._crit_edge.us.._crit_edge16.preheader.us_crit_edge ]
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.._crit_edge16.us_crit_edge, %._crit_edge16.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge16.preheader.us ], [ %indvars.iv.next.4, %._crit_edge16.us.._crit_edge16.us_crit_edge ]
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %54 = bitcast double* %53 to i64*
  %55 = load i64, i64* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv.next
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %64 = bitcast double* %63 to i64*
  %65 = load i64, i64* %64, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %67 = bitcast double* %66 to i64*
  store i64 %65, i64* %67, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %69 = bitcast double* %68 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.3
  %74 = bitcast double* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv.next.3
  %77 = bitcast double* %76 to i64*
  store i64 %75, i64* %77, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge16._crit_edge.us, label %._crit_edge16.us.._crit_edge16.us_crit_edge

._crit_edge16.us.._crit_edge16.us_crit_edge:      ; preds = %._crit_edge16.us
  br label %._crit_edge16.us

._crit_edge16._crit_edge.us:                      ; preds = %._crit_edge16.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond47, label %._crit_edge14._crit_edge, label %._crit_edge16._crit_edge.us.._crit_edge16.preheader.us_crit_edge

._crit_edge16._crit_edge.us.._crit_edge16.preheader.us_crit_edge: ; preds = %._crit_edge16._crit_edge.us
  br label %._crit_edge16.preheader.us

._crit_edge14._crit_edge:                         ; preds = %._crit_edge16._crit_edge.us
  tail call void @free(i8* nonnull %36) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
._crit_edge.preheader.preheader:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge11._crit_edge.._crit_edge.preheader_crit_edge, %._crit_edge.preheader.preheader
  %indvars.iv82 = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ %indvars.iv.next83, %._crit_edge11._crit_edge.._crit_edge.preheader_crit_edge ]
  %4 = icmp sgt i64 %indvars.iv82, 0
  br i1 %4, label %.lr.ph34.preheader, label %._crit_edge.preheader.._crit_edge11._crit_edge_crit_edge

._crit_edge.preheader.._crit_edge11._crit_edge_crit_edge: ; preds = %._crit_edge.preheader
  br label %._crit_edge11._crit_edge

.lr.ph34.preheader:                               ; preds = %._crit_edge.preheader
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 0
  br label %.lr.ph34

.lr.ph42:                                         ; preds = %._crit_edge
  br i1 %4, label %.lr.ph42.split.us.preheader, label %.lr.ph42.._crit_edge11._crit_edge_crit_edge

.lr.ph42.._crit_edge11._crit_edge_crit_edge:      ; preds = %.lr.ph42
  br label %._crit_edge11._crit_edge

.lr.ph42.split.us.preheader:                      ; preds = %.lr.ph42
  %xtraiter90 = and i64 %indvars.iv82, 1
  %lcmp.mod91 = icmp eq i64 %xtraiter90, 0
  %6 = icmp eq i64 %indvars.iv82, 1
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 0
  br label %.lr.ph42.split.us

.lr.ph42.split.us:                                ; preds = %._crit_edge39.us..lr.ph42.split.us_crit_edge, %.lr.ph42.split.us.preheader
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %._crit_edge39.us..lr.ph42.split.us_crit_edge ], [ %indvars.iv82, %.lr.ph42.split.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv79
  %9 = load double, double* %8, align 8
  br i1 %lcmp.mod91, label %.lr.ph42.split.us..prol.loopexit.unr-lcssa_crit_edge, label %.prol.preheader

.lr.ph42.split.us..prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph42.split.us
  br label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph42.split.us
  %10 = load double, double* %7, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv79
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %9, %13
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph42.split.us..prol.loopexit.unr-lcssa_crit_edge, %.prol.preheader
  %indvars.iv72.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph42.split.us..prol.loopexit.unr-lcssa_crit_edge ]
  %.136.us.unr.ph = phi double [ %14, %.prol.preheader ], [ %9, %.lr.ph42.split.us..prol.loopexit.unr-lcssa_crit_edge ]
  %.lcssa49.unr.ph = phi double [ %14, %.prol.preheader ], [ undef, %.lr.ph42.split.us..prol.loopexit.unr-lcssa_crit_edge ]
  br i1 %6, label %.prol.loopexit.unr-lcssa.._crit_edge39.us_crit_edge, label %.prol.loopexit.unr-lcssa..lr.ph42.split.us.new_crit_edge

.prol.loopexit.unr-lcssa..lr.ph42.split.us.new_crit_edge: ; preds = %.prol.loopexit.unr-lcssa
  br label %.lr.ph42.split.us.new

.prol.loopexit.unr-lcssa.._crit_edge39.us_crit_edge: ; preds = %.prol.loopexit.unr-lcssa
  br label %._crit_edge39.us

.lr.ph42.split.us.new:                            ; preds = %.lr.ph42.split.us.new..lr.ph42.split.us.new_crit_edge, %.prol.loopexit.unr-lcssa..lr.ph42.split.us.new_crit_edge
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.1, %.lr.ph42.split.us.new..lr.ph42.split.us.new_crit_edge ], [ %indvars.iv72.unr.ph, %.prol.loopexit.unr-lcssa..lr.ph42.split.us.new_crit_edge ]
  %.136.us = phi double [ %28, %.lr.ph42.split.us.new..lr.ph42.split.us.new_crit_edge ], [ %.136.us.unr.ph, %.prol.loopexit.unr-lcssa..lr.ph42.split.us.new_crit_edge ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv72
  %16 = bitcast double* %15 to <2 x double>*
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv72, i64 %indvars.iv79
  %18 = load double, double* %17, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %19 = load <2 x double>, <2 x double>* %16, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next73, i64 %indvars.iv79
  %21 = load double, double* %20, align 8
  %22 = insertelement <2 x double> undef, double %18, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fmul <2 x double> %19, %23
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fsub double %.136.us, %25
  %28 = fsub double %27, %26
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %exitcond76.1 = icmp eq i64 %indvars.iv.next73.1, %indvars.iv82
  br i1 %exitcond76.1, label %.lr.ph42.split.us.new.._crit_edge39.us_crit_edge, label %.lr.ph42.split.us.new..lr.ph42.split.us.new_crit_edge

.lr.ph42.split.us.new..lr.ph42.split.us.new_crit_edge: ; preds = %.lr.ph42.split.us.new
  br label %.lr.ph42.split.us.new

.lr.ph42.split.us.new.._crit_edge39.us_crit_edge: ; preds = %.lr.ph42.split.us.new
  br label %._crit_edge39.us

._crit_edge39.us:                                 ; preds = %.lr.ph42.split.us.new.._crit_edge39.us_crit_edge, %.prol.loopexit.unr-lcssa.._crit_edge39.us_crit_edge
  %.lcssa49 = phi double [ %.lcssa49.unr.ph, %.prol.loopexit.unr-lcssa.._crit_edge39.us_crit_edge ], [ %28, %.lr.ph42.split.us.new.._crit_edge39.us_crit_edge ]
  store double %.lcssa49, double* %8, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next80, 2000
  br i1 %exitcond81, label %._crit_edge39.us.._crit_edge11._crit_edge_crit_edge, label %._crit_edge39.us..lr.ph42.split.us_crit_edge

._crit_edge39.us..lr.ph42.split.us_crit_edge:     ; preds = %._crit_edge39.us
  br label %.lr.ph42.split.us

._crit_edge39.us.._crit_edge11._crit_edge_crit_edge: ; preds = %._crit_edge39.us
  br label %._crit_edge11._crit_edge

.lr.ph34:                                         ; preds = %._crit_edge..lr.ph34_crit_edge, %.lr.ph34.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge..lr.ph34_crit_edge ], [ 0, %.lr.ph34.preheader ]
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv65
  %30 = load double, double* %29, align 8
  %31 = icmp sgt i64 %indvars.iv65, 0
  br i1 %31, label %.lr.ph30.preheader, label %.lr.ph34.._crit_edge_crit_edge

.lr.ph34.._crit_edge_crit_edge:                   ; preds = %.lr.ph34
  br label %._crit_edge

.lr.ph30.preheader:                               ; preds = %.lr.ph34
  %xtraiter88 = and i64 %indvars.iv65, 1
  %lcmp.mod89 = icmp eq i64 %xtraiter88, 0
  br i1 %lcmp.mod89, label %.lr.ph30.preheader..lr.ph30.prol.loopexit.unr-lcssa_crit_edge, label %.lr.ph30.prol.preheader

.lr.ph30.preheader..lr.ph30.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph30.preheader
  br label %.lr.ph30.prol.loopexit.unr-lcssa

.lr.ph30.prol.preheader:                          ; preds = %.lr.ph30.preheader
  %32 = load double, double* %5, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv65
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %30, %35
  br label %.lr.ph30.prol.loopexit.unr-lcssa

.lr.ph30.prol.loopexit.unr-lcssa:                 ; preds = %.lr.ph30.preheader..lr.ph30.prol.loopexit.unr-lcssa_crit_edge, %.lr.ph30.prol.preheader
  %indvars.iv60.unr.ph = phi i64 [ 1, %.lr.ph30.prol.preheader ], [ 0, %.lr.ph30.preheader..lr.ph30.prol.loopexit.unr-lcssa_crit_edge ]
  %.028.unr.ph = phi double [ %36, %.lr.ph30.prol.preheader ], [ %30, %.lr.ph30.preheader..lr.ph30.prol.loopexit.unr-lcssa_crit_edge ]
  %.lcssa48.unr.ph = phi double [ %36, %.lr.ph30.prol.preheader ], [ undef, %.lr.ph30.preheader..lr.ph30.prol.loopexit.unr-lcssa_crit_edge ]
  %37 = icmp eq i64 %indvars.iv65, 1
  br i1 %37, label %.lr.ph30.prol.loopexit.unr-lcssa.._crit_edge_crit_edge, label %.lr.ph30.prol.loopexit.unr-lcssa..lr.ph30_crit_edge

.lr.ph30.prol.loopexit.unr-lcssa..lr.ph30_crit_edge: ; preds = %.lr.ph30.prol.loopexit.unr-lcssa
  br label %.lr.ph30

.lr.ph30.prol.loopexit.unr-lcssa.._crit_edge_crit_edge: ; preds = %.lr.ph30.prol.loopexit.unr-lcssa
  br label %._crit_edge

.lr.ph30:                                         ; preds = %.lr.ph30..lr.ph30_crit_edge, %.lr.ph30.prol.loopexit.unr-lcssa..lr.ph30_crit_edge
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %.lr.ph30..lr.ph30_crit_edge ], [ %indvars.iv60.unr.ph, %.lr.ph30.prol.loopexit.unr-lcssa..lr.ph30_crit_edge ]
  %.028 = phi double [ %51, %.lr.ph30..lr.ph30_crit_edge ], [ %.028.unr.ph, %.lr.ph30.prol.loopexit.unr-lcssa..lr.ph30_crit_edge ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv60
  %39 = bitcast double* %38 to <2 x double>*
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv65
  %41 = load double, double* %40, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %42 = load <2 x double>, <2 x double>* %39, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next61, i64 %indvars.iv65
  %44 = load double, double* %43, align 8
  %45 = insertelement <2 x double> undef, double %41, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fmul <2 x double> %42, %46
  %48 = extractelement <2 x double> %47, i32 0
  %49 = extractelement <2 x double> %47, i32 1
  %50 = fsub double %.028, %48
  %51 = fsub double %50, %49
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next61.1, %indvars.iv65
  br i1 %exitcond64.1, label %.lr.ph30.._crit_edge_crit_edge, label %.lr.ph30..lr.ph30_crit_edge

.lr.ph30..lr.ph30_crit_edge:                      ; preds = %.lr.ph30
  br label %.lr.ph30

.lr.ph30.._crit_edge_crit_edge:                   ; preds = %.lr.ph30
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph30.._crit_edge_crit_edge, %.lr.ph30.prol.loopexit.unr-lcssa.._crit_edge_crit_edge, %.lr.ph34.._crit_edge_crit_edge
  %.0.lcssa = phi double [ %30, %.lr.ph34.._crit_edge_crit_edge ], [ %.lcssa48.unr.ph, %.lr.ph30.prol.loopexit.unr-lcssa.._crit_edge_crit_edge ], [ %51, %.lr.ph30.._crit_edge_crit_edge ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv65, i64 %indvars.iv65
  %53 = load double, double* %52, align 8
  %54 = fdiv double %.0.lcssa, %53
  store double %54, double* %29, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next66, %indvars.iv82
  br i1 %exitcond70, label %.lr.ph42, label %._crit_edge..lr.ph34_crit_edge

._crit_edge..lr.ph34_crit_edge:                   ; preds = %._crit_edge
  br label %.lr.ph34

._crit_edge11._crit_edge:                         ; preds = %._crit_edge39.us.._crit_edge11._crit_edge_crit_edge, %.lr.ph42.._crit_edge11._crit_edge_crit_edge, %._crit_edge.preheader.._crit_edge11._crit_edge_crit_edge
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next83, 2000
  br i1 %exitcond84, label %._crit_edge11._crit_edge..lr.ph26_crit_edge, label %._crit_edge11._crit_edge.._crit_edge.preheader_crit_edge

._crit_edge11._crit_edge.._crit_edge.preheader_crit_edge: ; preds = %._crit_edge11._crit_edge
  br label %._crit_edge.preheader

._crit_edge11._crit_edge..lr.ph26_crit_edge:      ; preds = %._crit_edge11._crit_edge
  br label %.lr.ph26

.lr.ph26:                                         ; preds = %._crit_edge10..lr.ph26_crit_edge, %._crit_edge11._crit_edge..lr.ph26_crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge10..lr.ph26_crit_edge ], [ 0, %._crit_edge11._crit_edge..lr.ph26_crit_edge ]
  %55 = add i64 %indvars.iv57, -1
  %56 = getelementptr inbounds double, double* %1, i64 %indvars.iv57
  %57 = load double, double* %56, align 8
  %58 = icmp sgt i64 %indvars.iv57, 0
  br i1 %58, label %.lr.ph22.preheader, label %.lr.ph26.._crit_edge10_crit_edge

.lr.ph26.._crit_edge10_crit_edge:                 ; preds = %.lr.ph26
  br label %._crit_edge10

.lr.ph22.preheader:                               ; preds = %.lr.ph26
  %xtraiter85 = and i64 %indvars.iv57, 3
  %lcmp.mod86 = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod86, label %.lr.ph22.preheader..lr.ph22.prol.loopexit_crit_edge, label %.lr.ph22.preheader..lr.ph22.prol_crit_edge

.lr.ph22.preheader..lr.ph22.prol_crit_edge:       ; preds = %.lr.ph22.preheader
  br label %.lr.ph22.prol

.lr.ph22.preheader..lr.ph22.prol.loopexit_crit_edge: ; preds = %.lr.ph22.preheader
  br label %.lr.ph22.prol.loopexit

.lr.ph22.prol:                                    ; preds = %.lr.ph22.prol..lr.ph22.prol_crit_edge, %.lr.ph22.preheader..lr.ph22.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph22.prol..lr.ph22.prol_crit_edge ], [ 0, %.lr.ph22.preheader..lr.ph22.prol_crit_edge ]
  %.220.prol = phi double [ %64, %.lr.ph22.prol..lr.ph22.prol_crit_edge ], [ %57, %.lr.ph22.preheader..lr.ph22.prol_crit_edge ]
  %prol.iter87 = phi i64 [ %prol.iter87.sub, %.lr.ph22.prol..lr.ph22.prol_crit_edge ], [ %xtraiter85, %.lr.ph22.preheader..lr.ph22.prol_crit_edge ]
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv.prol
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %3, i64 %indvars.iv.prol
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fsub double %.220.prol, %63
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter87.sub = add i64 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i64 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %.lr.ph22.prol..lr.ph22.prol.loopexit_crit_edge, label %.lr.ph22.prol..lr.ph22.prol_crit_edge, !llvm.loop !1

.lr.ph22.prol..lr.ph22.prol_crit_edge:            ; preds = %.lr.ph22.prol
  br label %.lr.ph22.prol

.lr.ph22.prol..lr.ph22.prol.loopexit_crit_edge:   ; preds = %.lr.ph22.prol
  br label %.lr.ph22.prol.loopexit

.lr.ph22.prol.loopexit:                           ; preds = %.lr.ph22.prol..lr.ph22.prol.loopexit_crit_edge, %.lr.ph22.preheader..lr.ph22.prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph22.preheader..lr.ph22.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.lr.ph22.prol..lr.ph22.prol.loopexit_crit_edge ]
  %.220.unr = phi double [ %57, %.lr.ph22.preheader..lr.ph22.prol.loopexit_crit_edge ], [ %64, %.lr.ph22.prol..lr.ph22.prol.loopexit_crit_edge ]
  %.lcssa47.unr = phi double [ undef, %.lr.ph22.preheader..lr.ph22.prol.loopexit_crit_edge ], [ %64, %.lr.ph22.prol..lr.ph22.prol.loopexit_crit_edge ]
  %65 = icmp ult i64 %55, 3
  br i1 %65, label %.lr.ph22.prol.loopexit.._crit_edge10_crit_edge, label %.lr.ph22.prol.loopexit..lr.ph22_crit_edge

.lr.ph22.prol.loopexit..lr.ph22_crit_edge:        ; preds = %.lr.ph22.prol.loopexit
  br label %.lr.ph22

.lr.ph22.prol.loopexit.._crit_edge10_crit_edge:   ; preds = %.lr.ph22.prol.loopexit
  br label %._crit_edge10

.lr.ph22:                                         ; preds = %.lr.ph22..lr.ph22_crit_edge, %.lr.ph22.prol.loopexit..lr.ph22_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph22..lr.ph22_crit_edge ], [ %indvars.iv.unr, %.lr.ph22.prol.loopexit..lr.ph22_crit_edge ]
  %.220 = phi double [ %87, %.lr.ph22..lr.ph22_crit_edge ], [ %.220.unr, %.lr.ph22.prol.loopexit..lr.ph22_crit_edge ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv
  %67 = bitcast double* %66 to <2 x double>*
  %68 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %69 = bitcast double* %68 to <2 x double>*
  %70 = load <2 x double>, <2 x double>* %67, align 8
  %71 = load <2 x double>, <2 x double>* %69, align 8
  %72 = fmul <2 x double> %70, %71
  %73 = extractelement <2 x double> %72, i32 0
  %74 = extractelement <2 x double> %72, i32 1
  %75 = fsub double %.220, %73
  %76 = fsub double %75, %74
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %78 = bitcast double* %77 to <2 x double>*
  %79 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %80 = bitcast double* %79 to <2 x double>*
  %81 = load <2 x double>, <2 x double>* %78, align 8
  %82 = load <2 x double>, <2 x double>* %80, align 8
  %83 = fmul <2 x double> %81, %82
  %84 = extractelement <2 x double> %83, i32 0
  %85 = extractelement <2 x double> %83, i32 1
  %86 = fsub double %76, %84
  %87 = fsub double %86, %85
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond56.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv57
  br i1 %exitcond56.3, label %.lr.ph22.._crit_edge10_crit_edge, label %.lr.ph22..lr.ph22_crit_edge

.lr.ph22..lr.ph22_crit_edge:                      ; preds = %.lr.ph22
  br label %.lr.ph22

.lr.ph22.._crit_edge10_crit_edge:                 ; preds = %.lr.ph22
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph22.._crit_edge10_crit_edge, %.lr.ph22.prol.loopexit.._crit_edge10_crit_edge, %.lr.ph26.._crit_edge10_crit_edge
  %.2.lcssa = phi double [ %57, %.lr.ph26.._crit_edge10_crit_edge ], [ %.lcssa47.unr, %.lr.ph22.prol.loopexit.._crit_edge10_crit_edge ], [ %87, %.lr.ph22.._crit_edge10_crit_edge ]
  %88 = getelementptr inbounds double, double* %3, i64 %indvars.iv57
  store double %.2.lcssa, double* %88, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond59, label %._crit_edge10..lr.ph18_crit_edge, label %._crit_edge10..lr.ph26_crit_edge

._crit_edge10..lr.ph26_crit_edge:                 ; preds = %._crit_edge10
  br label %.lr.ph26

._crit_edge10..lr.ph18_crit_edge:                 ; preds = %._crit_edge10
  br label %.lr.ph18

.lr.ph18:                                         ; preds = %._crit_edge12..lr.ph18_crit_edge, %._crit_edge10..lr.ph18_crit_edge
  %indvar = phi i64 [ %indvar.next, %._crit_edge12..lr.ph18_crit_edge ], [ 0, %._crit_edge10..lr.ph18_crit_edge ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge12..lr.ph18_crit_edge ], [ 2000, %._crit_edge10..lr.ph18_crit_edge ]
  %89 = add i64 %indvar, -1
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, -1
  %90 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53
  %91 = load double, double* %90, align 8
  %92 = icmp slt i64 %indvars.iv52, 2000
  br i1 %92, label %.lr.ph.preheader, label %.lr.ph18.._crit_edge12_crit_edge

.lr.ph18.._crit_edge12_crit_edge:                 ; preds = %.lr.ph18
  br label %._crit_edge12

.lr.ph.preheader:                                 ; preds = %.lr.ph18
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.preheader..lr.ph.prol_crit_edge

.lr.ph.preheader..lr.ph.prol_crit_edge:           ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge:  ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol.loopexit

.lr.ph.prol:                                      ; preds = %.lr.ph.prol..lr.ph.prol_crit_edge, %.lr.ph.preheader..lr.ph.prol_crit_edge
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %indvars.iv52, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %.313.prol = phi double [ %98, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %91, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %xtraiter, %.lr.ph.preheader..lr.ph.prol_crit_edge ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next53, i64 %indvars.iv50.prol
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %2, i64 %indvars.iv50.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.313.prol, %97
  %indvars.iv.next51.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, label %.lr.ph.prol..lr.ph.prol_crit_edge, !llvm.loop !3

.lr.ph.prol..lr.ph.prol_crit_edge:                ; preds = %.lr.ph.prol
  br label %.lr.ph.prol

.lr.ph.prol..lr.ph.prol.loopexit_crit_edge:       ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge
  %indvars.iv50.unr = phi i64 [ %indvars.iv52, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %indvars.iv.next51.prol, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ]
  %.313.unr = phi double [ %91, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %98, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader..lr.ph.prol.loopexit_crit_edge ], [ %98, %.lr.ph.prol..lr.ph.prol.loopexit_crit_edge ]
  %99 = icmp ult i64 %89, 3
  br i1 %99, label %.lr.ph.prol.loopexit.._crit_edge12_crit_edge, label %.lr.ph.prol.loopexit..lr.ph_crit_edge

.lr.ph.prol.loopexit..lr.ph_crit_edge:            ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph.prol.loopexit.._crit_edge12_crit_edge:     ; preds = %.lr.ph.prol.loopexit
  br label %._crit_edge12

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.prol.loopexit..lr.ph_crit_edge
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.3, %.lr.ph..lr.ph_crit_edge ], [ %indvars.iv50.unr, %.lr.ph.prol.loopexit..lr.ph_crit_edge ]
  %.313 = phi double [ %121, %.lr.ph..lr.ph_crit_edge ], [ %.313.unr, %.lr.ph.prol.loopexit..lr.ph_crit_edge ]
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next53, i64 %indvars.iv50
  %101 = bitcast double* %100 to <2 x double>*
  %102 = getelementptr inbounds double, double* %2, i64 %indvars.iv50
  %103 = bitcast double* %102 to <2 x double>*
  %104 = load <2 x double>, <2 x double>* %101, align 8
  %105 = load <2 x double>, <2 x double>* %103, align 8
  %106 = fmul <2 x double> %104, %105
  %107 = extractelement <2 x double> %106, i32 0
  %108 = extractelement <2 x double> %106, i32 1
  %109 = fsub double %.313, %107
  %110 = fsub double %109, %108
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next53, i64 %indvars.iv.next51.1
  %112 = bitcast double* %111 to <2 x double>*
  %113 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next51.1
  %114 = bitcast double* %113 to <2 x double>*
  %115 = load <2 x double>, <2 x double>* %112, align 8
  %116 = load <2 x double>, <2 x double>* %114, align 8
  %117 = fmul <2 x double> %115, %116
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  %120 = fsub double %110, %118
  %121 = fsub double %120, %119
  %indvars.iv.next51.3 = add nsw i64 %indvars.iv50, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next51.3, 2000
  br i1 %exitcond.3, label %.lr.ph.._crit_edge12_crit_edge, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  br label %.lr.ph

.lr.ph.._crit_edge12_crit_edge:                   ; preds = %.lr.ph
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.lr.ph.._crit_edge12_crit_edge, %.lr.ph.prol.loopexit.._crit_edge12_crit_edge, %.lr.ph18.._crit_edge12_crit_edge
  %.3.lcssa = phi double [ %91, %.lr.ph18.._crit_edge12_crit_edge ], [ %.lcssa.unr, %.lr.ph.prol.loopexit.._crit_edge12_crit_edge ], [ %121, %.lr.ph.._crit_edge12_crit_edge ]
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next53, i64 %indvars.iv.next53
  %123 = load double, double* %122, align 8
  %124 = fdiv double %.3.lcssa, %123
  %125 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next53
  store double %124, double* %125, align 8
  %126 = icmp sgt i64 %indvars.iv52, 1
  br i1 %126, label %._crit_edge12..lr.ph18_crit_edge, label %._crit_edge12._crit_edge

._crit_edge12..lr.ph18_crit_edge:                 ; preds = %._crit_edge12
  %indvar.next = add i64 %indvar, 1
  br label %.lr.ph18

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %._crit_edge..lr.ph_crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph.._crit_edge_crit_edge

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.lr.ph
  br label %._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.._crit_edge_crit_edge, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge3, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
