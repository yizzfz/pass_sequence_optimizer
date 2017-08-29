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
  br i1 %7, label %.lr.ph30, label %._crit_edge

.lr.ph30:                                         ; preds = %6
  %8 = add i32 %2, -1
  %9 = sext i32 %0 to i64
  %xtraiter76 = and i32 %2, 1
  %wide.trip.count61 = zext i32 %2 to i64
  %xtraiter81 = and i32 %2, 3
  %wide.trip.count69 = zext i32 %1 to i64
  %10 = add nsw i32 %xtraiter81, -1
  %11 = zext i32 %10 to i64
  %12 = add nuw nsw i64 %11, 1
  %13 = add nsw i64 %wide.trip.count69, -1
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  %16 = icmp eq i32 %xtraiter76, 0
  %17 = icmp eq i32 %8, 0
  %sunkaddr90 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %18 = icmp eq i32 %xtraiter81, 0
  %19 = icmp ult i32 %8, 3
  %xtraiter = and i64 %wide.trip.count69, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %13, 7
  br label %._crit_edge14._crit_edge

._crit_edge14._crit_edge:                         ; preds = %._crit_edge14, %.lr.ph30
  %indvars.iv71 = phi i64 [ 0, %.lr.ph30 ], [ %indvars.iv.next72, %._crit_edge14 ]
  br i1 %14, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %._crit_edge14._crit_edge
  br i1 %15, label %.lr.ph13.split.us.preheader, label %.lr.ph13.split.preheader

.lr.ph13.split.preheader:                         ; preds = %.lr.ph13
  br i1 %lcmp.mod, label %.lr.ph13.split.prol.loopexit, label %.lr.ph13.split.prol.preheader

.lr.ph13.split.prol.preheader:                    ; preds = %.lr.ph13.split.preheader
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol:                              ; preds = %.lr.ph13.split.prol, %.lr.ph13.split.prol.preheader
  %indvars.iv47.prol = phi i64 [ %indvars.iv.next48.prol, %.lr.ph13.split.prol ], [ 0, %.lr.ph13.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph13.split.prol ], [ %xtraiter, %.lr.ph13.split.prol.preheader ]
  %indvars.iv.next48.prol = add nuw nsw i64 %indvars.iv47.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.split.prol.loopexit.unr-lcssa, label %.lr.ph13.split.prol, !llvm.loop !1

.lr.ph13.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph13.split.prol
  br label %.lr.ph13.split.prol.loopexit

.lr.ph13.split.prol.loopexit:                     ; preds = %.lr.ph13.split.preheader, %.lr.ph13.split.prol.loopexit.unr-lcssa
  %indvars.iv47.unr = phi i64 [ 0, %.lr.ph13.split.preheader ], [ %indvars.iv.next48.prol, %.lr.ph13.split.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge14.loopexit94, label %.lr.ph13.split.preheader.new

.lr.ph13.split.preheader.new:                     ; preds = %.lr.ph13.split.prol.loopexit
  br label %.lr.ph13.split

.lr.ph13.split.us.preheader:                      ; preds = %.lr.ph13
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %.lr.ph13.split.us.preheader, %._crit_edge10.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge10.us ], [ 0, %.lr.ph13.split.us.preheader ]
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

._crit_edge10.us.loopexit:                        ; preds = %.lr.ph9.us.new
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit, %.prol.loopexit80
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %._crit_edge14.loopexit, label %.lr.ph13.split.us

.lr.ph9.us.new:                                   ; preds = %.lr.ph9.us.new.preheader, %.lr.ph9.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.3, %.lr.ph9.us.new ], [ %indvars.iv63.unr, %.lr.ph9.us.new.preheader ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.1
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.1
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.2
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.2
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next64.3 = add nsw i64 %indvars.iv63, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next64.3, %wide.trip.count61
  br i1 %exitcond66.3, label %._crit_edge10.us.loopexit, label %.lr.ph9.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph13.split.us
  %indvars.iv59 = phi i64 [ 0, %.lr.ph13.split.us ], [ %indvars.iv.next60, %._crit_edge.us.us ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %42, align 8
  br i1 %16, label %.prol.loopexit75, label %.prol.preheader74

.prol.preheader74:                                ; preds = %.lr.ph.us.us
  %43 = load double, double* %21, align 8
  %44 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %46, 0.000000e+00
  %sunkaddr87 = shl i64 %indvars.iv59, 3
  %sunkaddr88 = add i64 %sunkaddr, %sunkaddr87
  %sunkaddr89 = inttoptr i64 %sunkaddr88 to double*
  store double %47, double* %sunkaddr89, align 8
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.lr.ph.us.us, %.prol.preheader74
  %48 = phi double [ %47, %.prol.preheader74 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader74 ], [ 0, %.lr.ph.us.us ]
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit75
  %sunkaddr91 = shl i64 %indvars.iv59, 3
  %sunkaddr92 = add i64 %sunkaddr90, %sunkaddr91
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit75
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %.lr.ph9.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %49 = phi double [ %61, %.lr.ph.us.us.new ], [ %48, %.lr.ph.us.us.new.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv55
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %54, %49
  store double %55, double* %sunkaddr93, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next56
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %60, %55
  store double %61, double* %sunkaddr93, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count61
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph9.us:                                       ; preds = %._crit_edge.us.us
  br i1 %18, label %.prol.loopexit80, label %.prol.preheader79.preheader

.prol.preheader79.preheader:                      ; preds = %.lr.ph9.us
  br label %.prol.preheader79

.prol.preheader79:                                ; preds = %.prol.preheader79.preheader, %.prol.preheader79
  %indvars.iv63.prol = phi i64 [ %indvars.iv.next64.prol, %.prol.preheader79 ], [ 0, %.prol.preheader79.preheader ]
  %prol.iter83 = phi i32 [ %prol.iter83.sub, %.prol.preheader79 ], [ %xtraiter81, %.prol.preheader79.preheader ]
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv63.prol
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63.prol
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter83.sub = add nsw i32 %prol.iter83, -1
  %prol.iter83.cmp = icmp eq i32 %prol.iter83.sub, 0
  br i1 %prol.iter83.cmp, label %.prol.loopexit80.loopexit, label %.prol.preheader79, !llvm.loop !3

.prol.loopexit80.loopexit:                        ; preds = %.prol.preheader79
  br label %.prol.loopexit80

.prol.loopexit80:                                 ; preds = %.prol.loopexit80.loopexit, %.lr.ph9.us
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph9.us ], [ %12, %.prol.loopexit80.loopexit ]
  br i1 %19, label %._crit_edge10.us, label %.lr.ph9.us.new.preheader

.lr.ph9.us.new.preheader:                         ; preds = %.prol.loopexit80
  br label %.lr.ph9.us.new

.lr.ph13.split:                                   ; preds = %.lr.ph13.split, %.lr.ph13.split.preheader.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %.lr.ph13.split.preheader.new ], [ %indvars.iv.next48.7, %.lr.ph13.split ]
  %indvars.iv.next48.7 = add nsw i64 %indvars.iv47, 8
  %exitcond50.7 = icmp eq i64 %indvars.iv.next48.7, %wide.trip.count69
  br i1 %exitcond50.7, label %._crit_edge14.loopexit94.unr-lcssa, label %.lr.ph13.split

._crit_edge14.loopexit:                           ; preds = %._crit_edge10.us
  br label %._crit_edge14

._crit_edge14.loopexit94.unr-lcssa:               ; preds = %.lr.ph13.split
  br label %._crit_edge14.loopexit94

._crit_edge14.loopexit94:                         ; preds = %.lr.ph13.split.prol.loopexit, %._crit_edge14.loopexit94.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit94, %._crit_edge14.loopexit, %._crit_edge14._crit_edge
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond = icmp eq i64 %indvars.iv.next72, %9
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge14._crit_edge

._crit_edge.loopexit:                             ; preds = %._crit_edge14
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]*, [160 x double]*) unnamed_addr #2 {
.lr.ph21:
  br label %.lr.ph21.split.us

.lr.ph21.split.us:                                ; preds = %._crit_edge15.us, %.lr.ph21
  %indvars.iv56 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next57, %._crit_edge15.us ]
  br label %.lr.ph9.us.us

._crit_edge15.us:                                 ; preds = %._crit_edge10.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next57, 150
  br i1 %exitcond65, label %.lr.ph3.split.us.preheader, label %.lr.ph21.split.us

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge15.us
  br label %.lr.ph3.split.us

.lr.ph9.us.us:                                    ; preds = %.lr.ph21.split.us, %._crit_edge10.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge10.us.us ], [ 0, %.lr.ph21.split.us ]
  %2 = mul nuw nsw i64 %indvars.iv52, %indvars.iv56
  br label %._crit_edge61

._crit_edge10.us.us:                              ; preds = %._crit_edge61
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 140
  br i1 %exitcond55, label %._crit_edge15.us, label %.lr.ph9.us.us

._crit_edge61:                                    ; preds = %._crit_edge61, %.lr.ph9.us.us
  %indvars.iv48 = phi i64 [ 0, %.lr.ph9.us.us ], [ %indvars.iv.next49.1, %._crit_edge61 ]
  %3 = add nuw nsw i64 %2, %indvars.iv48
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 160
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv48
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %8 = add nuw nsw i64 %2, %indvars.iv.next49
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 160
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.600000e+02, double 1.600000e+02>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 160
  br i1 %exitcond51.1, label %._crit_edge10.us.us, label %._crit_edge61

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next.1, %._crit_edge63 ]
  %16 = mul nuw nsw i64 %indvars.iv45, %indvars.iv
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 160
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %21 = mul nuw nsw i64 %indvars.iv45, %indvars.iv.next
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, <double 1.600000e+02, double 1.600000e+02>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge63

._crit_edge.us:                                   ; preds = %._crit_edge63
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next46, 160
  br i1 %exitcond64, label %._crit_edge62, label %.lr.ph3.split.us

._crit_edge62:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]*) unnamed_addr #0 {
.lr.ph10:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %._crit_edge4.us, %.lr.ph10
  %indvars.iv37 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next38, %._crit_edge4.us ]
  %5 = trunc i64 %indvars.iv37 to i32
  %6 = mul i32 %5, 140
  br label %.lr.ph.us.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 150
  br i1 %exitcond, label %._crit_edge, label %.lr.ph10.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph10.split.us, %._crit_edge.us.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us.us ], [ 0, %.lr.ph10.split.us ]
  %7 = trunc i64 %indvars.iv33 to i32
  %tmp.us.us = add i32 %6, %7
  %tmp1.us.us = mul i32 %tmp.us.us, 160
  br label %._crit_edge41

._crit_edge.us.us:                                ; preds = %._crit_edge40
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond36, label %._crit_edge4.us, label %.lr.ph.us.us

._crit_edge41:                                    ; preds = %._crit_edge40, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %._crit_edge40 ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = add i32 %tmp1.us.us, %8
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge40

; <label>:12:                                     ; preds = %._crit_edge41
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge41, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond32, label %._crit_edge.us.us, label %._crit_edge41

._crit_edge:                                      ; preds = %._crit_edge4.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
