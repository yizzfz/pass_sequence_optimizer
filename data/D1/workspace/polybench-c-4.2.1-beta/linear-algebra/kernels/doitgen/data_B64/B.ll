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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph31, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %6
  br label %._crit_edge

.lr.ph31:                                         ; preds = %6
  %8 = icmp sgt i32 %2, 0
  %9 = icmp sgt i32 %1, 0
  %10 = add i32 %2, -1
  %11 = sext i32 %0 to i64
  %xtraiter76 = and i32 %2, 1
  %lcmp.mod77 = icmp eq i32 %xtraiter76, 0
  %12 = icmp eq i32 %10, 0
  %wide.trip.count61 = zext i32 %2 to i64
  %xtraiter81 = and i32 %2, 3
  %lcmp.mod82 = icmp eq i32 %xtraiter81, 0
  %13 = icmp ult i32 %10, 3
  %wide.trip.count69 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter81, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %wide.trip.count69, -1
  %xtraiter = and i64 %wide.trip.count69, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %18 = icmp ult i64 %17, 7
  br label %._crit_edge14._crit_edge

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14.._crit_edge14._crit_edge_crit_edge, %.lr.ph31
  %indvars.iv71 = phi i64 [ 0, %.lr.ph31 ], [ %indvars.iv.next72, %._crit_edge14.._crit_edge14._crit_edge_crit_edge ]
  br i1 %9, label %.lr.ph13, label %._crit_edge14._crit_edge.._crit_edge14_crit_edge

._crit_edge14._crit_edge.._crit_edge14_crit_edge: ; preds = %._crit_edge14._crit_edge
  br label %._crit_edge14

.lr.ph13:                                         ; preds = %._crit_edge14._crit_edge
  br i1 %8, label %.lr.ph13.split.us.preheader, label %.lr.ph13.split.preheader

.lr.ph13.split.preheader:                         ; preds = %.lr.ph13
  br i1 %lcmp.mod, label %.lr.ph13.split.preheader..lr.ph13.split.prol.loopexit_crit_edge, label %.lr.ph13.split.prol.preheader

.lr.ph13.split.preheader..lr.ph13.split.prol.loopexit_crit_edge: ; preds = %.lr.ph13.split.preheader
  br label %.lr.ph13.split.prol.loopexit

.lr.ph13.split.prol.preheader:                    ; preds = %.lr.ph13.split.preheader
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol:                              ; preds = %.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge, %.lr.ph13.split.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge ], [ 0, %.lr.ph13.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge ], [ %xtraiter, %.lr.ph13.split.prol.preheader ]
  %indvars.iv.next48.prol = add nuw nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.split.prol.loopexit.unr-lcssa, label %.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge, !llvm.loop !1

.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge: ; preds = %.lr.ph13.split.prol
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph13.split.prol
  br label %.lr.ph13.split.prol.loopexit

.lr.ph13.split.prol.loopexit:                     ; preds = %.lr.ph13.split.preheader..lr.ph13.split.prol.loopexit_crit_edge, %.lr.ph13.split.prol.loopexit.unr-lcssa
  %indvars.iv47.unr = phi i64 [ 0, %.lr.ph13.split.preheader..lr.ph13.split.prol.loopexit_crit_edge ], [ %indvars.iv.next48.prol, %.lr.ph13.split.prol.loopexit.unr-lcssa ]
  br i1 %18, label %.lr.ph13.split.prol.loopexit.._crit_edge14.loopexit85_crit_edge, label %.lr.ph13.split.preheader.new

.lr.ph13.split.prol.loopexit.._crit_edge14.loopexit85_crit_edge: ; preds = %.lr.ph13.split.prol.loopexit
  br label %._crit_edge14.loopexit85

.lr.ph13.split.preheader.new:                     ; preds = %.lr.ph13.split.prol.loopexit
  br label %.lr.ph13.split

.lr.ph13.split.us.preheader:                      ; preds = %.lr.ph13
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %._crit_edge9.us..lr.ph13.split.us_crit_edge, %.lr.ph13.split.us.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge9.us..lr.ph13.split.us_crit_edge ], [ 0, %.lr.ph13.split.us.preheader ]
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.prol.loopexit80.._crit_edge9.us_crit_edge, %._crit_edge9.us.loopexit
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge14.loopexit, label %._crit_edge9.us..lr.ph13.split.us_crit_edge

._crit_edge9.us..lr.ph13.split.us_crit_edge:      ; preds = %._crit_edge9.us
  br label %.lr.ph13.split.us

.lr.ph8.us.new:                                   ; preds = %.lr.ph8.us.new..lr.ph8.us.new_crit_edge, %.lr.ph8.us.new.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.3, %.lr.ph8.us.new..lr.ph8.us.new_crit_edge ], [ %indvars.iv63.unr, %.lr.ph8.us.new.preheader ]
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %21 = bitcast double* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.1
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.1
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.2
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.2
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next64.3 = add nsw i64 %indvars.iv63, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next64.3, %wide.trip.count61
  br i1 %exitcond66.3, label %._crit_edge9.us.loopexit, label %.lr.ph8.us.new..lr.ph8.us.new_crit_edge

.lr.ph8.us.new..lr.ph8.us.new_crit_edge:          ; preds = %.lr.ph8.us.new
  br label %.lr.ph8.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph13.split.us
  %indvars.iv59 = phi i64 [ 0, %.lr.ph13.split.us ], [ %indvars.iv.next60, %._crit_edge.us.us..lr.ph.us.us_crit_edge ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %40, align 8
  br i1 %lcmp.mod77, label %.lr.ph.us.us..prol.loopexit75_crit_edge, label %.prol.preheader74

.lr.ph.us.us..prol.loopexit75_crit_edge:          ; preds = %.lr.ph.us.us
  br label %.prol.loopexit75

.prol.preheader74:                                ; preds = %.lr.ph.us.us
  %41 = load double, double* %19, align 8
  %42 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %44, 0.000000e+00
  store double %45, double* %40, align 8
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.lr.ph.us.us..prol.loopexit75_crit_edge, %.prol.preheader74
  %46 = phi double [ %45, %.prol.preheader74 ], [ 0.000000e+00, %.lr.ph.us.us..prol.loopexit75_crit_edge ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader74 ], [ 0, %.lr.ph.us.us..prol.loopexit75_crit_edge ]
  br i1 %12, label %.prol.loopexit75.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit75.._crit_edge.us.us_crit_edge:     ; preds = %.prol.loopexit75
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit75
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit75.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %.lr.ph8.us, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %47 = phi double [ %59, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %46, %.lr.ph.us.us.new.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv55
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %47, %52
  store double %53, double* %40, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %54 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next56
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %40, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count61
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph8.us:                                       ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod82, label %.lr.ph8.us..prol.loopexit80_crit_edge, label %.prol.preheader79.preheader

.lr.ph8.us..prol.loopexit80_crit_edge:            ; preds = %.lr.ph8.us
  br label %.prol.loopexit80

.prol.preheader79.preheader:                      ; preds = %.lr.ph8.us
  br label %.prol.preheader79

.prol.preheader79:                                ; preds = %.prol.preheader79..prol.preheader79_crit_edge, %.prol.preheader79.preheader
  %indvars.iv63.prol = phi i64 [ %indvars.iv.next64.prol, %.prol.preheader79..prol.preheader79_crit_edge ], [ 0, %.prol.preheader79.preheader ]
  %prol.iter83 = phi i32 [ %prol.iter83.sub, %.prol.preheader79..prol.preheader79_crit_edge ], [ %xtraiter81, %.prol.preheader79.preheader ]
  %60 = getelementptr inbounds double, double* %5, i64 %indvars.iv63.prol
  %61 = bitcast double* %60 to i64*
  %62 = load i64, i64* %61, align 8
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63.prol
  %64 = bitcast double* %63 to i64*
  store i64 %62, i64* %64, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter83.sub = add nsw i32 %prol.iter83, -1
  %prol.iter83.cmp = icmp eq i32 %prol.iter83.sub, 0
  br i1 %prol.iter83.cmp, label %.prol.loopexit80.loopexit, label %.prol.preheader79..prol.preheader79_crit_edge, !llvm.loop !3

.prol.preheader79..prol.preheader79_crit_edge:    ; preds = %.prol.preheader79
  br label %.prol.preheader79

.prol.loopexit80.loopexit:                        ; preds = %.prol.preheader79
  br label %.prol.loopexit80

.prol.loopexit80:                                 ; preds = %.lr.ph8.us..prol.loopexit80_crit_edge, %.prol.loopexit80.loopexit
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph8.us..prol.loopexit80_crit_edge ], [ %16, %.prol.loopexit80.loopexit ]
  br i1 %13, label %.prol.loopexit80.._crit_edge9.us_crit_edge, label %.lr.ph8.us.new.preheader

.prol.loopexit80.._crit_edge9.us_crit_edge:       ; preds = %.prol.loopexit80
  br label %._crit_edge9.us

.lr.ph8.us.new.preheader:                         ; preds = %.prol.loopexit80
  br label %.lr.ph8.us.new

.lr.ph13.split:                                   ; preds = %.lr.ph13.split..lr.ph13.split_crit_edge, %.lr.ph13.split.preheader.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %.lr.ph13.split.preheader.new ], [ %indvars.iv.next48.7, %.lr.ph13.split..lr.ph13.split_crit_edge ]
  %indvars.iv.next48.7 = add nsw i64 %indvars.iv47, 8
  %exitcond50.7 = icmp eq i64 %indvars.iv.next48.7, %wide.trip.count69
  br i1 %exitcond50.7, label %._crit_edge14.loopexit85.unr-lcssa, label %.lr.ph13.split..lr.ph13.split_crit_edge

.lr.ph13.split..lr.ph13.split_crit_edge:          ; preds = %.lr.ph13.split
  br label %.lr.ph13.split

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit85.unr-lcssa:               ; preds = %.lr.ph13.split
  br label %._crit_edge14.loopexit85

._crit_edge14.loopexit85:                         ; preds = %.lr.ph13.split.prol.loopexit.._crit_edge14.loopexit85_crit_edge, %._crit_edge14.loopexit85.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14._crit_edge.._crit_edge14_crit_edge, %._crit_edge14.loopexit85, %._crit_edge14.loopexit
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond = icmp eq i64 %indvars.iv.next72, %11
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge14.._crit_edge14._crit_edge_crit_edge

._crit_edge14.._crit_edge14._crit_edge_crit_edge: ; preds = %._crit_edge14
  br label %._crit_edge14._crit_edge

._crit_edge.loopexit:                             ; preds = %._crit_edge14
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
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
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph21:
  br label %.lr.ph21.split.us

.lr.ph21.split.us:                                ; preds = %._crit_edge10.us.us.._crit_edge15.us_crit_edge..lr.ph21.split.us_crit_edge, %.lr.ph21
  %indvars.iv56 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next57, %._crit_edge10.us.us.._crit_edge15.us_crit_edge..lr.ph21.split.us_crit_edge ]
  br label %.lr.ph9.us.us

.lr.ph9.us.us:                                    ; preds = %.lr.ph9.us.us.new.._crit_edge10.us.us_crit_edge..lr.ph9.us.us_crit_edge, %.lr.ph21.split.us
  %indvars.iv52 = phi i64 [ 0, %.lr.ph21.split.us ], [ %indvars.iv.next53, %.lr.ph9.us.us.new.._crit_edge10.us.us_crit_edge..lr.ph9.us.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv56, %indvars.iv52
  br label %.lr.ph9.us.us.new

._crit_edge10.us.us.._crit_edge15.us_crit_edge:   ; preds = %.lr.ph9.us.us.new.._crit_edge10.us.us_crit_edge
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next57, 150
  br i1 %exitcond66, label %.lr.ph3.split.us.preheader, label %._crit_edge10.us.us.._crit_edge15.us_crit_edge..lr.ph21.split.us_crit_edge

._crit_edge10.us.us.._crit_edge15.us_crit_edge..lr.ph21.split.us_crit_edge: ; preds = %._crit_edge10.us.us.._crit_edge15.us_crit_edge
  br label %.lr.ph21.split.us

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge10.us.us.._crit_edge15.us_crit_edge
  br label %.lr.ph3.split.us

.lr.ph9.us.us.new:                                ; preds = %.lr.ph9.us.us.new..lr.ph9.us.us.new_crit_edge, %.lr.ph9.us.us
  %indvars.iv48 = phi i64 [ 0, %.lr.ph9.us.us ], [ %indvars.iv.next49.1, %.lr.ph9.us.us.new..lr.ph9.us.us.new_crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv48
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv48
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next49
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 160
  br i1 %exitcond51.1, label %.lr.ph9.us.us.new.._crit_edge10.us.us_crit_edge, label %.lr.ph9.us.us.new..lr.ph9.us.us.new_crit_edge

.lr.ph9.us.us.new..lr.ph9.us.us.new_crit_edge:    ; preds = %.lr.ph9.us.us.new
  br label %.lr.ph9.us.us.new

.lr.ph9.us.us.new.._crit_edge10.us.us_crit_edge:  ; preds = %.lr.ph9.us.us.new
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 140
  br i1 %exitcond55, label %._crit_edge10.us.us.._crit_edge15.us_crit_edge, label %.lr.ph9.us.us.new.._crit_edge10.us.us_crit_edge..lr.ph9.us.us_crit_edge

.lr.ph9.us.us.new.._crit_edge10.us.us_crit_edge..lr.ph9.us.us_crit_edge: ; preds = %.lr.ph9.us.us.new.._crit_edge10.us.us_crit_edge
  br label %.lr.ph9.us.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us..lr.ph3.split.us_crit_edge, %.lr.ph3.split.us.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us..lr.ph3.split.us_crit_edge ], [ 0, %.lr.ph3.split.us.preheader ]
  br label %.lr.ph3.split.us.new

.lr.ph3.split.us.new:                             ; preds = %.lr.ph3.split.us.new..lr.ph3.split.us.new_crit_edge, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next.1, %.lr.ph3.split.us.new..lr.ph3.split.us.new_crit_edge ]
  %19 = mul nuw nsw i64 %indvars.iv45, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv45, %indvars.iv.next
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.600000e+02, double 1.600000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph3.split.us.new..lr.ph3.split.us.new_crit_edge

.lr.ph3.split.us.new..lr.ph3.split.us.new_crit_edge: ; preds = %.lr.ph3.split.us.new
  br label %.lr.ph3.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph3.split.us.new
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, 160
  br i1 %exitcond, label %._crit_edge4, label %._crit_edge.us..lr.ph3.split.us_crit_edge

._crit_edge.us..lr.ph3.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph3.split.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph9:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %._crit_edge.us.us.._crit_edge3.us_crit_edge..lr.ph9.split.us_crit_edge, %.lr.ph9
  %indvars.iv34 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next35, %._crit_edge.us.us.._crit_edge3.us_crit_edge..lr.ph9.split.us_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv34, 140
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph9.split.us
  %indvars.iv30 = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next31, %._crit_edge.us.us..lr.ph.us.us_crit_edge ]
  %9 = add nuw nsw i64 %8, %indvars.iv30
  %10 = mul nuw nsw i64 %9, 160
  br label %._crit_edge39

._crit_edge.us.us:                                ; preds = %._crit_edge37
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 140
  br i1 %exitcond33, label %._crit_edge.us.us.._crit_edge3.us_crit_edge, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

._crit_edge.us.us.._crit_edge3.us_crit_edge:      ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 150
  br i1 %exitcond, label %._crit_edge10, label %._crit_edge.us.us.._crit_edge3.us_crit_edge..lr.ph9.split.us_crit_edge

._crit_edge.us.us.._crit_edge3.us_crit_edge..lr.ph9.split.us_crit_edge: ; preds = %._crit_edge.us.us.._crit_edge3.us_crit_edge
  br label %.lr.ph9.split.us

._crit_edge39:                                    ; preds = %._crit_edge37.._crit_edge39_crit_edge, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %._crit_edge37.._crit_edge39_crit_edge ]
  %11 = add nuw nsw i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge39.._crit_edge37_crit_edge

._crit_edge39.._crit_edge37_crit_edge:            ; preds = %._crit_edge39
  br label %._crit_edge37

; <label>:15:                                     ; preds = %._crit_edge39
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge39.._crit_edge37_crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond29, label %._crit_edge.us.us, label %._crit_edge37.._crit_edge39_crit_edge

._crit_edge37.._crit_edge39_crit_edge:            ; preds = %._crit_edge37
  br label %._crit_edge39

._crit_edge10:                                    ; preds = %._crit_edge.us.us.._crit_edge3.us_crit_edge
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
