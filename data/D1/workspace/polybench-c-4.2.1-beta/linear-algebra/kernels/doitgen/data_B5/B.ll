; ModuleID = 'A.ll'
source_filename = "doitgen.c"
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = bitcast double* %5 to i8*
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader29.lr.ph, label %._crit_edge42

.preheader29.lr.ph:                               ; preds = %6
  %9 = icmp sgt i32 %1, 0
  %10 = icmp sgt i32 %2, 0
  %11 = icmp sgt i32 %2, 0
  %12 = icmp sgt i32 %2, 0
  %13 = add i32 %2, -1
  %14 = zext i32 %13 to i64
  %15 = shl nuw nsw i64 %14, 3
  %16 = add nuw nsw i64 %15, 8
  %xtraiter67 = and i32 %2, 1
  %lcmp.mod68 = icmp eq i32 %xtraiter67, 0
  %17 = icmp eq i32 %13, 0
  %wide.trip.count71 = zext i32 %2 to i64
  %wide.trip.count63.1 = zext i32 %2 to i64
  %xtraiter82 = and i32 %2, 3
  %lcmp.mod83 = icmp eq i32 %xtraiter82, 0
  %18 = icmp ult i32 %13, 3
  %wide.trip.count75.3 = zext i32 %2 to i64
  %wide.trip.count87 = zext i32 %1 to i64
  %xtraiter = and i32 %2, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %19 = icmp ult i32 %13, 3
  %wide.trip.count.3 = zext i32 %2 to i64
  %wide.trip.count56 = zext i32 %1 to i64
  %wide.trip.count91 = zext i32 %0 to i64
  br label %.preheader29

.preheader29:                                     ; preds = %._crit_edge39, %.preheader29.lr.ph
  %indvars.iv89 = phi i64 [ 0, %.preheader29.lr.ph ], [ %indvars.iv.next90, %._crit_edge39 ]
  br i1 %9, label %.preheader28.lr.ph, label %._crit_edge39

.preheader28.lr.ph:                               ; preds = %.preheader29
  br i1 %10, label %.preheader28.us.preheader, label %.preheader28.preheader

.preheader28.preheader:                           ; preds = %.preheader28.lr.ph
  br label %.preheader28

.preheader28.us.preheader:                        ; preds = %.preheader28.lr.ph
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %.preheader28.us.preheader, %._crit_edge35.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %._crit_edge35.us ], [ 0, %.preheader28.us.preheader ]
  br i1 %11, label %.lr.ph.us.us.preheader, label %.preheader.us.loopexit49

.lr.ph.us.us.preheader:                           ; preds = %.preheader28.us
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv85, i64 0
  br label %.lr.ph.us.us

.preheader.us.loopexit49:                         ; preds = %.preheader28.us
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %16, i32 8, i1 false)
  br label %.preheader.us

.preheader.us.loopexit:                           ; preds = %._crit_edge.us.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.loopexit, %.preheader.us.loopexit49
  br i1 %12, label %.lr.ph34.us, label %._crit_edge35.us

.lr.ph34.us:                                      ; preds = %.preheader.us
  br i1 %lcmp.mod83, label %.prol.loopexit81, label %.prol.preheader80.preheader

.prol.preheader80.preheader:                      ; preds = %.lr.ph34.us
  br label %.prol.preheader80

.prol.preheader80:                                ; preds = %.prol.preheader80.preheader, %.prol.preheader80
  %indvars.iv73.prol = phi i64 [ %indvars.iv.next74.prol, %.prol.preheader80 ], [ 0, %.prol.preheader80.preheader ]
  %prol.iter84 = phi i32 [ %prol.iter84.sub, %.prol.preheader80 ], [ %xtraiter82, %.prol.preheader80.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv73.prol
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv73.prol
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next74.prol = add nuw nsw i64 %indvars.iv73.prol, 1
  %prol.iter84.sub = add i32 %prol.iter84, -1
  %prol.iter84.cmp = icmp eq i32 %prol.iter84.sub, 0
  br i1 %prol.iter84.cmp, label %.prol.loopexit81.loopexit, label %.prol.preheader80, !llvm.loop !1

.prol.loopexit81.loopexit:                        ; preds = %.prol.preheader80
  br label %.prol.loopexit81

.prol.loopexit81:                                 ; preds = %.prol.loopexit81.loopexit, %.lr.ph34.us
  %indvars.iv73.unr = phi i64 [ 0, %.lr.ph34.us ], [ %indvars.iv.next74.prol, %.prol.loopexit81.loopexit ]
  br i1 %18, label %._crit_edge35.us, label %.lr.ph34.us.new.preheader

.lr.ph34.us.new.preheader:                        ; preds = %.prol.loopexit81
  br label %.lr.ph34.us.new

.lr.ph34.us.new:                                  ; preds = %.lr.ph34.us.new.preheader, %.lr.ph34.us.new
  %indvars.iv73 = phi i64 [ %indvars.iv.next74.3, %.lr.ph34.us.new ], [ %indvars.iv73.unr, %.lr.ph34.us.new.preheader ]
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv73
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv73
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next74
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv.next74
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv73, 2
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next74.1
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv.next74.1
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next74.2 = add nsw i64 %indvars.iv73, 3
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next74.2
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv.next74.2
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next74.3 = add nsw i64 %indvars.iv73, 4
  %exitcond76.3 = icmp eq i64 %indvars.iv.next74.3, %wide.trip.count75.3
  br i1 %exitcond76.3, label %._crit_edge35.us.loopexit, label %.lr.ph34.us.new

._crit_edge35.us.loopexit:                        ; preds = %.lr.ph34.us.new
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us.loopexit, %.prol.loopexit81, %.preheader.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  br i1 %exitcond88, label %._crit_edge39.loopexit, label %.preheader28.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv69
  store double 0.000000e+00, double* %46, align 8
  br i1 %lcmp.mod68, label %.prol.loopexit66, label %.prol.preheader65

.prol.preheader65:                                ; preds = %.lr.ph.us.us
  %47 = load double, double* %20, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv69
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %46, align 8
  %52 = fadd double %51, %50
  store double %52, double* %46, align 8
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.prol.preheader65, %.lr.ph.us.us
  %indvars.iv61.unr.ph = phi i64 [ 1, %.prol.preheader65 ], [ 0, %.lr.ph.us.us ]
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit66
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit66
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %.preheader.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %.lr.ph.us.us.new ], [ %indvars.iv61.unr.ph, %.lr.ph.us.us.new.preheader ]
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv61
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv61, i64 %indvars.iv69
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = load double, double* %46, align 8
  %59 = fadd double %58, %57
  store double %59, double* %46, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv85, i64 %indvars.iv.next62
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next62, i64 %indvars.iv69
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = load double, double* %46, align 8
  %66 = fadd double %65, %64
  store double %66, double* %46, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next62.1, %wide.trip.count63.1
  br i1 %exitcond64.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader28:                                     ; preds = %.preheader28.preheader, %._crit_edge35
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge35 ], [ 0, %.preheader28.preheader ]
  br i1 %12, label %.lr.ph34, label %._crit_edge35

.lr.ph34:                                         ; preds = %.preheader28
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph34
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %67 = getelementptr inbounds double, double* %5, i64 %indvars.iv.prol
  %68 = bitcast double* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv54, i64 %indvars.iv.prol
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph34
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph34 ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %19, label %._crit_edge35, label %.lr.ph34.new.preheader

.lr.ph34.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph34.new

.lr.ph34.new:                                     ; preds = %.lr.ph34.new.preheader, %.lr.ph34.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph34.new ], [ %indvars.iv.unr, %.lr.ph34.new.preheader ]
  %72 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv54, i64 %indvars.iv
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %77 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv54, i64 %indvars.iv.next
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %82 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.1
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv54, i64 %indvars.iv.next.1
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.2
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv89, i64 %indvars.iv54, i64 %indvars.iv.next.2
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge35.loopexit, label %.lr.ph34.new

._crit_edge35.loopexit:                           ; preds = %.lr.ph34.new
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %.prol.loopexit, %.preheader28
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond, label %._crit_edge39.loopexit95, label %.preheader28

._crit_edge39.loopexit:                           ; preds = %._crit_edge35.us
  br label %._crit_edge39

._crit_edge39.loopexit95:                         ; preds = %._crit_edge35
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit95, %._crit_edge39.loopexit, %.preheader29
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %._crit_edge42.loopexit, label %.preheader29

._crit_edge42.loopexit:                           ; preds = %._crit_edge39
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %11
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %15

; <label>:15:                                     ; preds = %11, %14, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.preheader29.lr.ph:
  br label %.preheader29.us

.preheader29.us:                                  ; preds = %.preheader29.lr.ph, %._crit_edge39.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge39.us ], [ 0, %.preheader29.lr.ph ]
  br label %.preheader28.us.us

._crit_edge39.us:                                 ; preds = %._crit_edge36.us.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 150
  br i1 %exitcond71, label %.preheader.us.preheader, label %.preheader29.us

.preheader.us.preheader:                          ; preds = %._crit_edge39.us
  br label %.preheader.us

.preheader28.us.us:                               ; preds = %.preheader29.us, %._crit_edge36.us.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge36.us.us ], [ 0, %.preheader29.us ]
  %5 = mul nuw nsw i64 %indvars.iv64, %indvars.iv68
  br label %.preheader28.us.us.new

._crit_edge36.us.us:                              ; preds = %.preheader28.us.us.new
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 140
  br i1 %exitcond67, label %._crit_edge39.us, label %.preheader28.us.us

.preheader28.us.us.new:                           ; preds = %.preheader28.us.us, %.preheader28.us.us.new
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %.preheader28.us.us.new ], [ 0, %.preheader28.us.us ]
  %6 = add nsw i64 %indvars.iv56, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.600000e+02
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv56
  store double %10, double* %11, align 8
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %12 = add nsw i64 %indvars.iv.next57, %5
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.600000e+02
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv.next57
  store double %16, double* %17, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next57.1, 160
  br i1 %exitcond59.1, label %._crit_edge36.us.us, label %.preheader28.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %18 = mul nuw nsw i64 %indvars.iv, %indvars.iv52
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, 1.600000e+02
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv
  store double %22, double* %23, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv52
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.600000e+02
  %29 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv.next
  store double %28, double* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 160
  br i1 %exitcond, label %._crit_edge33, label %.preheader.us

._crit_edge33:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.preheader16.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader16.us

.preheader16.us:                                  ; preds = %._crit_edge20.us, %.preheader16.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader16.lr.ph ], [ %indvars.iv.next40, %._crit_edge20.us ]
  %8 = mul nsw i64 %indvars.iv39, 140
  br label %.preheader.us.us

._crit_edge20.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond42, label %._crit_edge23, label %.preheader16.us

.preheader.us.us:                                 ; preds = %.preheader16.us, %._crit_edge.us.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us.us ], [ 0, %.preheader16.us ]
  %9 = add i64 %indvars.iv35, %8
  %10 = mul i64 %9, 160
  br label %11

._crit_edge.us.us:                                ; preds = %18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge20.us, label %.preheader.us.us

; <label>:11:                                     ; preds = %18, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ 0, %.preheader.us.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %18

; <label>:18:                                     ; preds = %16, %11
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge.us.us, label %11

._crit_edge23:                                    ; preds = %._crit_edge20.us
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #6
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
