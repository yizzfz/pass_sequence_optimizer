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

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph27, label %._crit_edge28

.lr.ph27:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = add i32 %2, -1
  %11 = sext i32 %2 to i64
  %12 = sext i32 %0 to i64
  %wide.trip.count63 = zext i32 %2 to i64
  %xtraiter79 = and i32 %2, 3
  %lcmp.mod80 = icmp eq i32 %xtraiter79, 0
  %13 = icmp ult i32 %10, 3
  %wide.trip.count71 = zext i32 %1 to i64
  %14 = add nsw i32 %xtraiter79, -1
  %15 = zext i32 %14 to i64
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %wide.trip.count71, -1
  %xtraiter86 = and i64 %11, 1
  %lcmp.mod87 = icmp eq i64 %xtraiter86, 0
  %18 = icmp eq i32 %2, 1
  %xtraiter = and i64 %wide.trip.count71, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = icmp ult i64 %17, 7
  br label %20

; <label>:20:                                     ; preds = %._crit_edge18, %.lr.ph27
  %indvars.iv73 = phi i64 [ 0, %.lr.ph27 ], [ %indvars.iv.next74, %._crit_edge18 ]
  br i1 %8, label %.lr.ph17, label %._crit_edge18

.lr.ph17:                                         ; preds = %20
  br i1 %9, label %.lr.ph17.split.us.preheader, label %.lr.ph17.split.preheader

.lr.ph17.split.preheader:                         ; preds = %.lr.ph17
  br i1 %lcmp.mod, label %.lr.ph17.split.prol.loopexit, label %.lr.ph17.split.prol.preheader

.lr.ph17.split.prol.preheader:                    ; preds = %.lr.ph17.split.preheader
  br label %.lr.ph17.split.prol

.lr.ph17.split.prol:                              ; preds = %.lr.ph17.split.prol, %.lr.ph17.split.prol.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.lr.ph17.split.prol ], [ 0, %.lr.ph17.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph17.split.prol ], [ %xtraiter, %.lr.ph17.split.prol.preheader ]
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph17.split.prol.loopexit.unr-lcssa, label %.lr.ph17.split.prol, !llvm.loop !1

.lr.ph17.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph17.split.prol
  br label %.lr.ph17.split.prol.loopexit

.lr.ph17.split.prol.loopexit:                     ; preds = %.lr.ph17.split.preheader, %.lr.ph17.split.prol.loopexit.unr-lcssa
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph17.split.preheader ], [ %indvars.iv.next52.prol, %.lr.ph17.split.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge18.loopexit84, label %.lr.ph17.split.preheader.new

.lr.ph17.split.preheader.new:                     ; preds = %.lr.ph17.split.prol.loopexit
  br label %.lr.ph17.split

.lr.ph17.split.us.preheader:                      ; preds = %.lr.ph17
  br label %.lr.ph17.split.us

.lr.ph17.split.us:                                ; preds = %.lr.ph17.split.us.preheader, %._crit_edge13.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge13.us ], [ 0, %.lr.ph17.split.us.preheader ]
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 0
  br label %.lr.ph.us.us

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge.us.us
  br i1 %lcmp.mod80, label %.prol.loopexit78, label %.prol.preheader77.preheader

.prol.preheader77.preheader:                      ; preds = %._crit_edge7.us.loopexit
  br label %.prol.preheader77

.prol.preheader77:                                ; preds = %.prol.preheader77.preheader, %.prol.preheader77
  %indvars.iv65.prol = phi i64 [ %indvars.iv.next66.prol, %.prol.preheader77 ], [ 0, %.prol.preheader77.preheader ]
  %prol.iter81 = phi i32 [ %prol.iter81.sub, %.prol.preheader77 ], [ %xtraiter79, %.prol.preheader77.preheader ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv65.prol
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv65.prol
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter81.sub = add nsw i32 %prol.iter81, -1
  %prol.iter81.cmp = icmp eq i32 %prol.iter81.sub, 0
  br i1 %prol.iter81.cmp, label %.prol.loopexit78.loopexit, label %.prol.preheader77, !llvm.loop !3

.prol.loopexit78.loopexit:                        ; preds = %.prol.preheader77
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.prol.loopexit78.loopexit, %._crit_edge7.us.loopexit
  %indvars.iv65.unr = phi i64 [ 0, %._crit_edge7.us.loopexit ], [ %16, %.prol.loopexit78.loopexit ]
  br i1 %13, label %._crit_edge13.us, label %.lr.ph12.us.new.preheader

.lr.ph12.us.new.preheader:                        ; preds = %.prol.loopexit78
  br label %.lr.ph12.us.new

.lr.ph12.us.new:                                  ; preds = %.lr.ph12.us.new.preheader, %.lr.ph12.us.new
  %indvars.iv65 = phi i64 [ %indvars.iv.next66.3, %.lr.ph12.us.new ], [ %indvars.iv65.unr, %.lr.ph12.us.new.preheader ]
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv65
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv65
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next66
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next66.1 = add nsw i64 %indvars.iv65, 2
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66.1
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next66.1
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next66.2 = add nsw i64 %indvars.iv65, 3
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66.2
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next66.2
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next66.3 = add nsw i64 %indvars.iv65, 4
  %exitcond68.3 = icmp eq i64 %indvars.iv.next66.3, %wide.trip.count63
  br i1 %exitcond68.3, label %._crit_edge13.us.loopexit, label %.lr.ph12.us.new

._crit_edge13.us.loopexit:                        ; preds = %.lr.ph12.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit78
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge18.loopexit, label %.lr.ph17.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph17.split.us, %._crit_edge.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us.us ], [ 0, %.lr.ph17.split.us ]
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  store double 0.000000e+00, double* %47, align 8
  br i1 %lcmp.mod87, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %48

; <label>:48:                                     ; preds = %.prol.preheader
  %49 = load double, double* %21, align 8
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv61
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %52, 0.000000e+00
  store double %53, double* %47, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph.us.us, %48
  %.unr.ph = phi double [ %53, %48 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv59.unr.ph = phi i64 [ 1, %48 ], [ 0, %.lr.ph.us.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %18, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit
  br label %54

._crit_edge.us.us.unr-lcssa:                      ; preds = %54
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge7.us.loopexit, label %.lr.ph.us.us

; <label>:54:                                     ; preds = %54, %.lr.ph.us.us.new
  %55 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %67, %54 ]
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next60.1, %54 ]
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv59
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv59, i64 %indvars.iv61
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %60, %55
  store double %61, double* %47, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv.next60
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next60, i64 %indvars.iv61
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %66, %61
  store double %67, double* %47, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next60.1, %11
  br i1 %exitcond.1, label %._crit_edge.us.us.unr-lcssa, label %54

.lr.ph17.split:                                   ; preds = %.lr.ph17.split, %.lr.ph17.split.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.lr.ph17.split.preheader.new ], [ %indvars.iv.next52.7, %.lr.ph17.split ]
  %indvars.iv.next52.7 = add nsw i64 %indvars.iv51, 8
  %exitcond54.7 = icmp eq i64 %indvars.iv.next52.7, %wide.trip.count71
  br i1 %exitcond54.7, label %._crit_edge18.loopexit84.unr-lcssa, label %.lr.ph17.split

._crit_edge18.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge18

._crit_edge18.loopexit84.unr-lcssa:               ; preds = %.lr.ph17.split
  br label %._crit_edge18.loopexit84

._crit_edge18.loopexit84:                         ; preds = %.lr.ph17.split.prol.loopexit, %._crit_edge18.loopexit84.unr-lcssa
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit84, %._crit_edge18.loopexit, %20
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next74, %12
  br i1 %exitcond85, label %._crit_edge28.loopexit, label %20

._crit_edge28.loopexit:                           ; preds = %._crit_edge18
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #2 {
.lr.ph24:
  br label %.lr.ph24.split.us

.lr.ph24.split.us:                                ; preds = %._crit_edge18.us, %.lr.ph24
  %indvars.iv58 = phi i64 [ 0, %.lr.ph24 ], [ %indvars.iv.next59, %._crit_edge18.us ]
  br label %.lr.ph13.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next59, 150
  br i1 %exitcond67, label %.lr.ph6.split.us.preheader, label %.lr.ph24.split.us

.lr.ph6.split.us.preheader:                       ; preds = %._crit_edge18.us
  br label %.lr.ph6.split.us

.lr.ph13.us.us:                                   ; preds = %.lr.ph24.split.us, %._crit_edge14.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge14.us.us ], [ 0, %.lr.ph24.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv54, %indvars.iv58
  br label %.lr.ph13.us.us.new

._crit_edge14.us.us:                              ; preds = %.lr.ph13.us.us.new
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 140
  br i1 %exitcond57, label %._crit_edge18.us, label %.lr.ph13.us.us

.lr.ph13.us.us.new:                               ; preds = %.lr.ph13.us.us, %.lr.ph13.us.us.new
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph13.us.us.new ], [ 0, %.lr.ph13.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv50
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58, i64 %indvars.iv54, i64 %indvars.iv50
  %indvars.iv.next51 = or i64 %indvars.iv50, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next51
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, 160
  br i1 %exitcond53.1, label %._crit_edge14.us.us, label %.lr.ph13.us.us.new

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph6.split.us.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge.us ], [ 0, %.lr.ph6.split.us.preheader ]
  br label %.lr.ph6.split.us.new

.lr.ph6.split.us.new:                             ; preds = %.lr.ph6.split.us, %.lr.ph6.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph6.split.us.new ], [ 0, %.lr.ph6.split.us ]
  %19 = mul nuw nsw i64 %indvars.iv, %indvars.iv47
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv47, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv47
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
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph6.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph6.split.us.new
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, 160
  br i1 %exitcond, label %._crit_edge7, label %.lr.ph6.split.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #0 {
.lr.ph13:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %._crit_edge7.us, %.lr.ph13
  %indvars.iv40 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next41, %._crit_edge7.us ]
  %8 = mul nuw nsw i64 %indvars.iv40, 140
  br label %.lr.ph.us.us

._crit_edge7.us:                                  ; preds = %._crit_edge4.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, 150
  br i1 %exitcond, label %._crit_edge14, label %.lr.ph13.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph13.split.us, %._crit_edge4.us.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge4.us.us ], [ 0, %.lr.ph13.split.us ]
  %9 = add nuw nsw i64 %indvars.iv36, %8
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge4.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 140
  br i1 %exitcond39, label %._crit_edge7.us, label %.lr.ph.us.us

; <label>:11:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond35, label %._crit_edge4.us.us, label %11

._crit_edge14:                                    ; preds = %._crit_edge7.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
