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
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge23

.preheader6.lr.ph:                                ; preds = %6
  %8 = add i32 %2, -1
  %9 = sext i32 %2 to i64
  %10 = sext i32 %0 to i64
  %wide.trip.count59 = zext i32 %2 to i64
  %xtraiter75 = and i32 %2, 3
  %wide.trip.count67 = zext i32 %1 to i64
  %11 = add nsw i32 %xtraiter75, -1
  %12 = zext i32 %11 to i64
  %13 = add nuw nsw i64 %12, 1
  %14 = add nsw i64 %wide.trip.count67, -1
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %2, 0
  %xtraiter86 = and i64 %9, 1
  %lcmp.mod87 = icmp eq i64 %xtraiter86, 0
  %sunkaddr.prol = ptrtoint double* %5 to i64
  %17 = icmp eq i32 %2, 1
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %18 = icmp eq i32 %xtraiter75, 0
  %19 = icmp ult i32 %8, 3
  %xtraiter = and i64 %wide.trip.count67, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %14, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge16, %.preheader6.lr.ph
  %indvars.iv69 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next70, %._crit_edge16 ]
  br i1 %15, label %.preheader5.lr.ph, label %._crit_edge16

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %16, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter, %.preheader5.prol.preheader ]
  %indvars.iv.next48.prol = add nuw nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv47.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next48.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge16.loopexit84, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge14.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge14.us ], [ 0, %.preheader5.us.preheader ]
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv65, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit:                        ; preds = %.lr.ph13.us.new
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %.prol.loopexit74
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge16.loopexit, label %.preheader5.us

.lr.ph13.us.new:                                  ; preds = %.lr.ph13.us.new.preheader, %.lr.ph13.us.new
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.3, %.lr.ph13.us.new ], [ %indvars.iv61.unr, %.lr.ph13.us.new.preheader ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv65, i64 %indvars.iv61
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv65, i64 %indvars.iv.next62
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62.1
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv65, i64 %indvars.iv.next62.1
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next62.2 = add nsw i64 %indvars.iv61, 3
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next62.2
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv65, i64 %indvars.iv.next62.2
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next62.3 = add nsw i64 %indvars.iv61, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next62.3, %wide.trip.count59
  br i1 %exitcond64.3, label %._crit_edge14.us.loopexit, label %.lr.ph13.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %._crit_edge.us.us
  br i1 %18, label %.prol.loopexit74, label %.prol.preheader73.preheader

.prol.preheader73.preheader:                      ; preds = %..preheader_crit_edge.us.loopexit
  br label %.prol.preheader73

.prol.preheader73:                                ; preds = %.prol.preheader73.preheader, %.prol.preheader73
  %indvars.iv61.prol = phi i64 [ %indvars.iv.next62.prol, %.prol.preheader73 ], [ 0, %.prol.preheader73.preheader ]
  %prol.iter77 = phi i32 [ %prol.iter77.sub, %.prol.preheader73 ], [ %xtraiter75, %.prol.preheader73.preheader ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv61.prol
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv65, i64 %indvars.iv61.prol
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next62.prol = add nuw nsw i64 %indvars.iv61.prol, 1
  %prol.iter77.sub = add nsw i32 %prol.iter77, -1
  %prol.iter77.cmp = icmp eq i32 %prol.iter77.sub, 0
  br i1 %prol.iter77.cmp, label %.prol.loopexit74.loopexit, label %.prol.preheader73, !llvm.loop !3

.prol.loopexit74.loopexit:                        ; preds = %.prol.preheader73
  br label %.prol.loopexit74

.prol.loopexit74:                                 ; preds = %.prol.loopexit74.loopexit, %..preheader_crit_edge.us.loopexit
  %indvars.iv61.unr = phi i64 [ 0, %..preheader_crit_edge.us.loopexit ], [ %13, %.prol.loopexit74.loopexit ]
  br i1 %19, label %._crit_edge14.us, label %.lr.ph13.us.new.preheader

.lr.ph13.us.new.preheader:                        ; preds = %.prol.loopexit74
  br label %.lr.ph13.us.new

.lr.ph.us.us:                                     ; preds = %.preheader5.us, %._crit_edge.us.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge.us.us ], [ 0, %.preheader5.us ]
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv57
  store double 0.000000e+00, double* %47, align 8
  br i1 %lcmp.mod87, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %48

; <label>:48:                                     ; preds = %.prol.preheader
  %49 = load double, double* %21, align 8
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv57
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %sunkaddr80.prol = shl nuw nsw i64 %indvars.iv57, 3
  %sunkaddr81.prol = add i64 %sunkaddr.prol, %sunkaddr80.prol
  %sunkaddr82.prol = inttoptr i64 %sunkaddr81.prol to double*
  %53 = load double, double* %sunkaddr82.prol, align 8
  %54 = fadd double %52, %53
  store double %54, double* %sunkaddr82.prol, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph.us.us, %48
  %indvars.iv55.unr.ph = phi i64 [ 1, %48 ], [ 0, %.lr.ph.us.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit
  %sunkaddr80 = shl nuw nsw i64 %indvars.iv57, 3
  %sunkaddr81 = add i64 %sunkaddr, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  %sunkaddr80.1 = shl nuw nsw i64 %indvars.iv57, 3
  %sunkaddr81.1 = add i64 %sunkaddr.1, %sunkaddr80.1
  %sunkaddr82.1 = inttoptr i64 %sunkaddr81.1 to double*
  br label %55

._crit_edge.us.us.unr-lcssa:                      ; preds = %55
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %..preheader_crit_edge.us.loopexit, label %.lr.ph.us.us

; <label>:55:                                     ; preds = %55, %.lr.ph.us.us.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next56.1, %55 ]
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv65, i64 %indvars.iv55
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv57
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = load double, double* %sunkaddr82, align 8
  %62 = fadd double %60, %61
  store double %62, double* %sunkaddr82, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv65, i64 %indvars.iv.next56
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv57
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = load double, double* %sunkaddr82.1, align 8
  %69 = fadd double %67, %68
  store double %69, double* %sunkaddr82.1, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next56.1, %9
  br i1 %exitcond.1, label %._crit_edge.us.us.unr-lcssa, label %55

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %.preheader5.preheader.new ], [ %indvars.iv.next48.7, %.preheader5 ]
  %indvars.iv.next48.7 = add nsw i64 %indvars.iv47, 8
  %exitcond50.7 = icmp eq i64 %indvars.iv.next48.7, %wide.trip.count67
  br i1 %exitcond50.7, label %._crit_edge16.loopexit84.unr-lcssa, label %.preheader5

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16.loopexit84.unr-lcssa:               ; preds = %.preheader5
  br label %._crit_edge16.loopexit84

._crit_edge16.loopexit84:                         ; preds = %.preheader5.prol.loopexit, %._crit_edge16.loopexit84.unr-lcssa
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit84, %._crit_edge16.loopexit, %.preheader6
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next70, %10
  br i1 %exitcond85, label %._crit_edge23.loopexit, label %.preheader6

._crit_edge23.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
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

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge18.us, %.preheader7.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next58, %._crit_edge18.us ]
  br label %.preheader6.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next58, 150
  br i1 %exitcond66, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge18.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %.preheader7.us, %._crit_edge16.us.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge16.us.us ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv53, %indvars.iv57
  br label %6

._crit_edge16.us.us:                              ; preds = %6
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 140
  br i1 %exitcond56, label %._crit_edge18.us, label %.preheader6.us.us

; <label>:6:                                      ; preds = %6, %.preheader6.us.us
  %indvars.iv49 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next50.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv49
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv49
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next50
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 160
  br i1 %exitcond52.1, label %._crit_edge16.us.us, label %6

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv46, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv46, %indvars.iv.next
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 160
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 1.600000e+02, double 1.600000e+02>
  %33 = bitcast double* %25 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %20

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next47, 160
  br i1 %exitcond65, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.preheader3.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge11, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge5.us.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge5.us.us ], [ 0, %.preheader3.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv35
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %.preheader.us.us

; <label>:11:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %16, %11
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge5.us.us, label %11

._crit_edge11:                                    ; preds = %._crit_edge6.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
