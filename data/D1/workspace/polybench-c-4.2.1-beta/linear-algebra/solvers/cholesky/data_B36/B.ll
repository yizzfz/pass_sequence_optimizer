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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
.preheader14.lr.ph:
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.backedge, %.preheader14.lr.ph
  %indvars.iv83 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next84, %.lr.ph29.backedge ]
  %indvars.iv81 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv81.be, %.lr.ph29.backedge ]
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %1 = mul i64 %indvars.iv83, 2001
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %2 = icmp slt i64 %indvars.iv.next84, 2000
  br i1 %2, label %._crit_edge33.thread, label %._crit_edge33

._crit_edge33.thread:                             ; preds = %.preheader13
  %3 = add i64 %1, 1
  %4 = mul i64 %indvars.iv83, -8
  %5 = add i64 %4, 15992
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %3
  %6 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %5, i32 8, i1 false)
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv83
  store double 1.000000e+00, double* %7, align 8
  br label %.lr.ph29.backedge

.lr.ph29.backedge:                                ; preds = %._crit_edge33, %._crit_edge33.thread
  %indvars.iv81.be = add nuw nsw i64 %indvars.iv81, 1
  br label %.lr.ph29

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph29
  %indvars.iv69 = phi i64 [ 0, %.lr.ph29 ], [ %indvars.iv.next70, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv69
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv69
  store double %13, double* %14, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next70, %indvars.iv81
  br i1 %exitcond74, label %.preheader13, label %._crit_edge

._crit_edge33:                                    ; preds = %.preheader13
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv83
  store double 1.000000e+00, double* %15, align 8
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond86, label %.preheader10.lr.ph, label %.lr.ph29.backedge

.preheader10.lr.ph:                               ; preds = %._crit_edge33
  %16 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 32000000, i32 8, i1 false)
  %17 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %._crit_edge22.us, %.preheader10.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next58, %._crit_edge22.us ]
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond60, label %.preheader.us.preheader, label %.preheader9.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  %18 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next54, %._crit_edge20.us.us ]
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv57
  br label %._crit_edge3

._crit_edge20.us.us:                              ; preds = %._crit_edge3
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond56, label %._crit_edge22.us, label %.preheader9.us.us

._crit_edge3:                                     ; preds = %._crit_edge3, %.preheader9.us.us
  %indvars.iv49 = phi i64 [ 0, %.preheader9.us.us ], [ %indvars.iv.next50.1, %._crit_edge3 ]
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv57
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv53, i64 %indvars.iv49
  %25 = load double, double* %24, align 8
  %26 = fadd double %25, %23
  store double %26, double* %24, align 8
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %27 = load double, double* %19, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next50, i64 %indvars.iv57
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next50
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond.1, label %._crit_edge20.us.us, label %._crit_edge3

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.4, %._crit_edge4 ]
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next
  %40 = bitcast double* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv.next
  %43 = bitcast double* %42 to i64*
  store i64 %41, i64* %43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %45 = bitcast double* %44 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %50 = bitcast double* %49 to i64*
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.3
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv44, i64 %indvars.iv.next.3
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond88.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond88.4, label %._crit_edge.us, label %._crit_edge4

._crit_edge.us:                                   ; preds = %._crit_edge4
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond47, label %._crit_edge17, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  call void @free(i8* nonnull %16) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]*) unnamed_addr #0 {
.preheader4.preheader:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv47 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next48, %._crit_edge9 ]
  %indvars.iv25 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next26, %._crit_edge9 ]
  %1 = and i64 %indvars.iv47, 3
  %2 = add nsw i64 %indvars.iv25, -1
  %3 = icmp sgt i64 %indvars.iv25, 0
  br i1 %3, label %.preheader4..preheader_crit_edge, label %.preheader3.._crit_edge9_crit_edge

.preheader4..preheader_crit_edge:                 ; preds = %.preheader4
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 0
  br label %.preheader

.preheader3.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %.phi.trans.insert31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre32 = load double, double* %.phi.trans.insert31, align 8
  br label %._crit_edge9

.lr.ph8:                                          ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv25
  %.pre30 = load double, double* %5, align 8
  %xtraiter38 = and i64 %indvars.iv25, 3
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %.prol.loopexit37, label %.prol.preheader36.preheader

.prol.preheader36.preheader:                      ; preds = %.lr.ph8
  br label %.prol.preheader36

.prol.preheader36:                                ; preds = %.prol.preheader36.preheader, %.prol.preheader36
  %6 = phi double [ %10, %.prol.preheader36 ], [ %.pre30, %.prol.preheader36.preheader ]
  %indvars.iv20.prol = phi i64 [ %indvars.iv.next21.prol, %.prol.preheader36 ], [ 0, %.prol.preheader36.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader36 ], [ %xtraiter38, %.prol.preheader36.preheader ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv20.prol
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fsub double %6, %9
  store double %10, double* %5, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  %indvars.iv.next21.prol = add nuw nsw i64 %indvars.iv20.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit37.loopexit, label %.prol.preheader36, !llvm.loop !1

.prol.loopexit37.loopexit:                        ; preds = %.prol.preheader36
  br label %.prol.loopexit37

.prol.loopexit37:                                 ; preds = %.prol.loopexit37.loopexit, %.lr.ph8
  %.lcssa34.unr = phi double [ undef, %.lr.ph8 ], [ %10, %.prol.loopexit37.loopexit ]
  %.unr40 = phi double [ %.pre30, %.lr.ph8 ], [ %10, %.prol.loopexit37.loopexit ]
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph8 ], [ %1, %.prol.loopexit37.loopexit ]
  %11 = icmp ult i64 %2, 3
  br i1 %11, label %._crit_edge9, label %.lr.ph8.new.preheader

.lr.ph8.new.preheader:                            ; preds = %.prol.loopexit37
  br label %.lr.ph8.new

.preheader:                                       ; preds = %._crit_edge, %.preheader4..preheader_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader4..preheader_crit_edge ], [ %indvars.iv.next15, %._crit_edge ]
  %12 = icmp sgt i64 %indvars.iv14, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv14
  %.pre = load double, double* %13, align 8
  br i1 %12, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %14

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load double, double* %4, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 0
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %.pre, %18
  store double %19, double* %13, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %14
  %.lcssa.unr.ph = phi double [ %19, %14 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %19, %14 ], [ %.pre, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %14 ], [ 0, %.lr.ph ]
  %20 = icmp eq i64 %indvars.iv14, 1
  br i1 %20, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %21 = phi double [ %33, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  store double %33, double* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv14
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %34 = phi double [ %.pre, %.preheader ], [ %.lcssa.unr.ph, %.prol.loopexit ], [ %33, %._crit_edge.loopexit ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv14
  %36 = load double, double* %35, align 8
  %37 = fdiv double %34, %36
  store double %37, double* %13, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, %indvars.iv25
  br i1 %exitcond19, label %.lr.ph8, label %.preheader

.lr.ph8.new:                                      ; preds = %.lr.ph8.new.preheader, %.lr.ph8.new
  %38 = phi double [ %54, %.lr.ph8.new ], [ %.unr40, %.lr.ph8.new.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.3, %.lr.ph8.new ], [ %indvars.iv20.unr, %.lr.ph8.new.preheader ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv20
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %40
  %42 = fsub double %38, %41
  store double %42, double* %5, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv.next21
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %44
  %46 = fsub double %42, %45
  store double %46, double* %5, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv.next21.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %48
  %50 = fsub double %46, %49
  store double %50, double* %5, align 8
  %indvars.iv.next21.2 = add nsw i64 %indvars.iv20, 3
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv.next21.2
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %52
  %54 = fsub double %50, %53
  store double %54, double* %5, align 8
  %indvars.iv.next21.3 = add nuw nsw i64 %indvars.iv20, 4
  %exitcond24.3 = icmp eq i64 %indvars.iv.next21.3, %indvars.iv25
  br i1 %exitcond24.3, label %._crit_edge9.loopexit, label %.lr.ph8.new

._crit_edge9.loopexit:                            ; preds = %.lr.ph8.new
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.prol.loopexit37, %.preheader3.._crit_edge9_crit_edge
  %.pre-phi33 = phi double* [ %.phi.trans.insert31, %.preheader3.._crit_edge9_crit_edge ], [ %5, %.prol.loopexit37 ], [ %5, %._crit_edge9.loopexit ]
  %55 = phi double [ %.pre32, %.preheader3.._crit_edge9_crit_edge ], [ %.lcssa34.unr, %.prol.loopexit37 ], [ %54, %._crit_edge9.loopexit ]
  %56 = call double @sqrt(double %55) #3
  store double %56, double* %.pre-phi33, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next26, 2000
  %indvars.iv.next48 = add nuw nsw i64 %1, 1
  br i1 %exitcond35, label %._crit_edge11, label %.preheader4

._crit_edge11:                                    ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]*) unnamed_addr #0 {
.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next8, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv9, 2000
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge2

; <label>:10:                                     ; preds = %._crit_edge3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv9, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge, label %._crit_edge3

._crit_edge:                                      ; preds = %._crit_edge2
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, 2000
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  br i1 %exitcond13, label %._crit_edge4, label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
