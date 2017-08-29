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
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %10

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %10

; <label>:10:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %1
  %indvars.iv98 = phi i64 [ 0, %1 ], [ %4, %.lr.ph.backedge ]
  %indvars.iv96 = phi i64 [ 1, %1 ], [ %indvars.iv96.be, %.lr.ph.backedge ]
  %2 = sub i64 1998, %indvars.iv98
  %3 = shl i64 %2, 3
  br label %10

.preheader52:                                     ; preds = %10
  %4 = add nuw nsw i64 %indvars.iv98, 1
  %5 = icmp slt i64 %4, 2000
  br i1 %5, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %.preheader52
  %6 = and i64 %3, 34359738360
  %7 = add nuw nsw i64 %6, 8
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %4
  %8 = mul nuw nsw i64 %indvars.iv98, 2000
  %scevgep94 = getelementptr double, double* %scevgep, i64 %8
  %scevgep9495 = bitcast double* %scevgep94 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep9495, i8 0, i64 %7, i32 8, i1 false)
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv98, i64 %indvars.iv98
  store double 1.000000e+00, double* %9, align 8
  br label %.lr.ph.backedge

; <label>:10:                                     ; preds = %10, %.lr.ph
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %10 ], [ 0, %.lr.ph ]
  %11 = sub nsw i64 0, %indvars.iv84
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 2000
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.000000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv98, i64 %indvars.iv84
  store double %16, double* %17, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next85, %indvars.iv96
  br i1 %exitcond88, label %.preheader52, label %10

._crit_edge:                                      ; preds = %.preheader52
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv98, i64 %indvars.iv98
  store double 1.000000e+00, double* %18, align 8
  %exitcond100 = icmp eq i64 %4, 2000
  br i1 %exitcond100, label %.preheader49.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv96.be = add nuw nsw i64 %indvars.iv96, 1
  br label %.lr.ph

.preheader49.preheader:                           ; preds = %._crit_edge
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 32000000, i32 8, i1 false)
  %20 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader49

.preheader49:                                     ; preds = %38, %.preheader49.preheader
  %indvars.iv75 = phi i64 [ 0, %.preheader49.preheader ], [ %indvars.iv.next76, %38 ]
  br label %.preheader48

.preheader48:                                     ; preds = %37, %.preheader49
  %indvars.iv72 = phi i64 [ 0, %.preheader49 ], [ %indvars.iv.next73, %37 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv72, i64 %indvars.iv75
  br label %22

; <label>:22:                                     ; preds = %22, %.preheader48
  %indvars.iv69 = phi i64 [ 0, %.preheader48 ], [ %indvars.iv.next70.1, %22 ]
  %23 = load double, double* %21, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv75
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv72, i64 %indvars.iv69
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %26
  store double %29, double* %27, align 8
  %indvars.iv.next70 = or i64 %indvars.iv69, 1
  %30 = load double, double* %21, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next70, i64 %indvars.iv75
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next70
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  %indvars.iv.next70.1 = add nuw nsw i64 %indvars.iv69, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next70.1, 2000
  br i1 %exitcond71.1, label %37, label %22

; <label>:37:                                     ; preds = %22
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next73, 2000
  br i1 %exitcond74, label %38, label %.preheader48

; <label>:38:                                     ; preds = %37
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next76, 2000
  br i1 %exitcond77, label %.preheader.preheader, label %.preheader49

.preheader.preheader:                             ; preds = %38
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %65
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %65 ], [ 0, %.preheader.preheader ]
  br label %39

; <label>:39:                                     ; preds = %39, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %39 ]
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv67, i64 %indvars.iv
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv67, i64 %indvars.iv.next
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv.next
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %50 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv67, i64 %indvars.iv.next.1
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv.next.1
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv67, i64 %indvars.iv.next.2
  %56 = bitcast double* %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv.next.2
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv67, i64 %indvars.iv.next.3
  %61 = bitcast double* %60 to i64*
  %62 = load i64, i64* %61, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67, i64 %indvars.iv.next.3
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %65, label %39

; <label>:65:                                     ; preds = %39
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond = icmp eq i64 %indvars.iv.next68, 2000
  br i1 %exitcond, label %66, label %.preheader

; <label>:66:                                     ; preds = %65
  tail call void @free(i8* nonnull %19) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader35.preheader, label %._crit_edge46

.preheader35.preheader:                           ; preds = %2
  %wide.trip.count82 = zext i32 %0 to i64
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader, %._crit_edge42
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge42 ], [ 0, %.preheader35.preheader ]
  %4 = add nuw i64 %indvars.iv80, 4294967295
  %5 = icmp sgt i64 %indvars.iv80, 0
  br i1 %5, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 0
  br label %.preheader33

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter6984 = and i64 %indvars.iv80, 1
  %7 = trunc i64 %4 to i32
  %8 = icmp eq i64 %xtraiter6984, 0
  %9 = icmp eq i32 %7, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge40.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge40.us ], [ %indvars.iv80, %.preheader.us.preheader ]
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv74
  %.pre50 = load double, double* %10, align 8
  br i1 %8, label %.prol.loopexit68, label %11

; <label>:11:                                     ; preds = %.preheader.us
  %12 = load double, double* %6, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv74
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %.pre50, %15
  store double %16, double* %10, align 8
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.preheader.us, %11
  %indvars.iv62.unr.ph = phi i64 [ 1, %11 ], [ 0, %.preheader.us ]
  %.unr71.ph = phi double [ %16, %11 ], [ %.pre50, %.preheader.us ]
  br i1 %9, label %._crit_edge40.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit68
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %.preheader.us.new ], [ %indvars.iv62.unr.ph, %.preheader.us.new.preheader ]
  %17 = phi double [ %29, %.preheader.us.new ], [ %.unr71.ph, %.preheader.us.new.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv62
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv74
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %10, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next63
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next63, i64 %indvars.iv74
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %23, %28
  store double %29, double* %10, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond66.1 = icmp eq i64 %indvars.iv.next63.1, %indvars.iv80
  br i1 %exitcond66.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit68
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, %wide.trip.count82
  br i1 %exitcond77, label %._crit_edge42.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge ], [ 0, %.preheader33.preheader ]
  %30 = add nuw i64 %indvars.iv56, 4294967295
  %31 = icmp sgt i64 %indvars.iv56, 0
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv56
  %.pre = load double, double* %32, align 8
  br i1 %31, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter85 = and i64 %indvars.iv56, 1
  %lcmp.mod = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %33

; <label>:33:                                     ; preds = %.lr.ph
  %34 = load double, double* %6, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv56
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %.pre, %37
  store double %38, double* %32, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %33
  %indvars.iv.unr.ph = phi i64 [ 1, %33 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %38, %33 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %38, %33 ], [ undef, %.lr.ph ]
  %39 = trunc i64 %30 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %41 = phi double [ %53, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv56
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv56
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fsub double %47, %52
  store double %53, double* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv56
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader33, %.prol.loopexit
  %54 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader33 ], [ %53, %._crit_edge.loopexit ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv56
  %56 = load double, double* %55, align 8
  %57 = fdiv double %54, %56
  store double %57, double* %32, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv80
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader35
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %._crit_edge46.loopexit, label %.preheader35

._crit_edge46.loopexit:                           ; preds = %._crit_edge42
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv12, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count
  br i1 %exitcond15, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
