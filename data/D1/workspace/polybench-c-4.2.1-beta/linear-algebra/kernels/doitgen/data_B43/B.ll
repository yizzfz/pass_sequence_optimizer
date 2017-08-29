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
  br i1 %7, label %.lr.ph31, label %._crit_edge32

.lr.ph31:                                         ; preds = %6
  %8 = add i32 %2, -1
  %9 = sext i32 %0 to i64
  %xtraiter74 = and i32 %2, 1
  %wide.trip.count63.1 = zext i32 %2 to i64
  %xtraiter82 = and i32 %2, 3
  %wide.trip.count55 = zext i32 %1 to i64
  %10 = add nsw i32 %xtraiter82, -1
  %11 = zext i32 %10 to i64
  %12 = add nuw nsw i64 %11, 1
  %13 = add nsw i64 %wide.trip.count55, -1
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  %16 = icmp eq i32 %xtraiter74, 0
  %17 = icmp eq i32 %8, 0
  %wide.trip.count = zext i32 %2 to i64
  %18 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %19 = ptrtoint double* %5 to i64
  %20 = icmp eq i32 %xtraiter82, 0
  %21 = icmp ult i32 %8, 3
  %wide.trip.count95 = zext i32 %1 to i64
  %xtraiter = and i64 %wide.trip.count55, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %22 = icmp ult i64 %13, 7
  br label %23

; <label>:23:                                     ; preds = %._crit_edge14, %.lr.ph31
  %indvars.iv69 = phi i64 [ 0, %.lr.ph31 ], [ %indvars.iv.next70, %._crit_edge14 ]
  br i1 %14, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %23
  br i1 %15, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph13.split.preheader

.lr.ph13.split.preheader:                         ; preds = %.lr.ph13
  br i1 %lcmp.mod, label %.lr.ph13.split.prol.loopexit, label %.lr.ph13.split.prol.preheader

.lr.ph13.split.prol.preheader:                    ; preds = %.lr.ph13.split.preheader
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol:                              ; preds = %.lr.ph13.split.prol, %.lr.ph13.split.prol.preheader
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %.lr.ph13.split.prol ], [ 0, %.lr.ph13.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph13.split.prol ], [ %xtraiter, %.lr.ph13.split.prol.preheader ]
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.split.prol.loopexit.unr-lcssa, label %.lr.ph13.split.prol, !llvm.loop !1

.lr.ph13.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph13.split.prol
  br label %.lr.ph13.split.prol.loopexit

.lr.ph13.split.prol.loopexit:                     ; preds = %.lr.ph13.split.preheader, %.lr.ph13.split.prol.loopexit.unr-lcssa
  %indvars.iv53.unr = phi i64 [ 0, %.lr.ph13.split.preheader ], [ %indvars.iv.next54.prol, %.lr.ph13.split.prol.loopexit.unr-lcssa ]
  br i1 %22, label %._crit_edge14.loopexit92, label %.lr.ph13.split.preheader.new

.lr.ph13.split.preheader.new:                     ; preds = %.lr.ph13.split.prol.loopexit
  br label %.lr.ph13.split

.lr.ph.us.us.preheader.preheader:                 ; preds = %.lr.ph13
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge9.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv93 = phi i64 [ 0, %.lr.ph.us.us.preheader.preheader ], [ %indvars.iv.next94, %._crit_edge9.us ]
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv93, i64 0
  br label %.lr.ph.us.us

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.prol.loopexit81
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond96, label %._crit_edge14.loopexit, label %.lr.ph.us.us.preheader

.lr.ph8.us.new:                                   ; preds = %.lr.ph8.us.new.preheader, %.lr.ph8.us.new
  %indvars.iv65 = phi i64 [ %indvars.iv.next66.3, %.lr.ph8.us.new ], [ %indvars.iv65.unr, %.lr.ph8.us.new.preheader ]
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv65
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv93, i64 %indvars.iv65
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv93, i64 %indvars.iv.next66
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next66.1 = add nsw i64 %indvars.iv65, 2
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66.1
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv93, i64 %indvars.iv.next66.1
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next66.2 = add nsw i64 %indvars.iv65, 3
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66.2
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv93, i64 %indvars.iv.next66.2
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next66.3 = add nsw i64 %indvars.iv65, 4
  %exitcond68.3 = icmp eq i64 %indvars.iv.next66.3, %wide.trip.count63.1
  br i1 %exitcond68.3, label %._crit_edge9.us.loopexit, label %.lr.ph8.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next, %._crit_edge.us.us ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  store double 0.000000e+00, double* %45, align 8
  br i1 %16, label %.prol.loopexit73, label %.prol.preheader72

.prol.preheader72:                                ; preds = %.lr.ph.us.us
  %46 = load double, double* %24, align 8
  %47 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %sunkaddr44.prol = shl nsw i64 %indvars.iv, 3
  %sunkaddr45.prol = add i64 %19, %sunkaddr44.prol
  %sunkaddr46.prol = inttoptr i64 %sunkaddr45.prol to double*
  %50 = load double, double* %sunkaddr46.prol, align 8
  %51 = fadd double %50, %49
  store double %51, double* %sunkaddr46.prol, align 8
  br label %.prol.loopexit73

.prol.loopexit73:                                 ; preds = %.prol.preheader72, %.lr.ph.us.us
  %indvars.iv61.unr.ph = phi i64 [ 1, %.prol.preheader72 ], [ 0, %.lr.ph.us.us ]
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit73
  %sunkaddr44 = shl nsw i64 %indvars.iv, 3
  %sunkaddr45 = add i64 %18, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %.pre = load double, double* %sunkaddr46, align 8
  %sunkaddr88 = shl nsw i64 %indvars.iv, 3
  %sunkaddr89 = add i64 %sunkaddr, %sunkaddr88
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit73
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.lr.ph8.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %52 = phi double [ %64, %.lr.ph.us.us.new ], [ %.pre, %.lr.ph.us.us.new.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %.lr.ph.us.us.new ], [ %indvars.iv61.unr.ph, %.lr.ph.us.us.new.preheader ]
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv93, i64 %indvars.iv61
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv61, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %sunkaddr90, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %59 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv93, i64 %indvars.iv.next62
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next62, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %sunkaddr90, align 8
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next62.1, %wide.trip.count63.1
  br i1 %exitcond64.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph8.us:                                       ; preds = %._crit_edge.us.us
  br i1 %20, label %.prol.loopexit81, label %.prol.preheader80.preheader

.prol.preheader80.preheader:                      ; preds = %.lr.ph8.us
  br label %.prol.preheader80

.prol.preheader80:                                ; preds = %.prol.preheader80.preheader, %.prol.preheader80
  %indvars.iv65.prol = phi i64 [ %indvars.iv.next66.prol, %.prol.preheader80 ], [ 0, %.prol.preheader80.preheader ]
  %prol.iter84 = phi i32 [ %prol.iter84.sub, %.prol.preheader80 ], [ %xtraiter82, %.prol.preheader80.preheader ]
  %65 = getelementptr inbounds double, double* %5, i64 %indvars.iv65.prol
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv93, i64 %indvars.iv65.prol
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter84.sub = add nsw i32 %prol.iter84, -1
  %prol.iter84.cmp = icmp eq i32 %prol.iter84.sub, 0
  br i1 %prol.iter84.cmp, label %.prol.loopexit81.loopexit, label %.prol.preheader80, !llvm.loop !3

.prol.loopexit81.loopexit:                        ; preds = %.prol.preheader80
  br label %.prol.loopexit81

.prol.loopexit81:                                 ; preds = %.prol.loopexit81.loopexit, %.lr.ph8.us
  %indvars.iv65.unr = phi i64 [ 0, %.lr.ph8.us ], [ %12, %.prol.loopexit81.loopexit ]
  br i1 %21, label %._crit_edge9.us, label %.lr.ph8.us.new.preheader

.lr.ph8.us.new.preheader:                         ; preds = %.prol.loopexit81
  br label %.lr.ph8.us.new

.lr.ph13.split:                                   ; preds = %.lr.ph13.split, %.lr.ph13.split.preheader.new
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr, %.lr.ph13.split.preheader.new ], [ %indvars.iv.next54.7, %.lr.ph13.split ]
  %indvars.iv.next54.7 = add nsw i64 %indvars.iv53, 8
  %exitcond56.7 = icmp eq i64 %indvars.iv.next54.7, %wide.trip.count55
  br i1 %exitcond56.7, label %._crit_edge14.loopexit92.unr-lcssa, label %.lr.ph13.split

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit92.unr-lcssa:               ; preds = %.lr.ph13.split
  br label %._crit_edge14.loopexit92

._crit_edge14.loopexit92:                         ; preds = %.lr.ph13.split.prol.loopexit, %._crit_edge14.loopexit92.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit92, %._crit_edge14.loopexit, %23
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next70, %9
  br i1 %exitcond97, label %._crit_edge32.loopexit, label %23

._crit_edge32.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %6
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
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %15)
  br label %16

; <label>:16:                                     ; preds = %11, %14, %2
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

.lr.ph21.split.us:                                ; preds = %._crit_edge15.us, %.lr.ph21
  %indvars.iv66 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next67, %._crit_edge15.us ]
  br label %.lr.ph9.us.us

._crit_edge15.us:                                 ; preds = %._crit_edge10.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next67, 150
  br i1 %exitcond68, label %.lr.ph3.split.us.preheader, label %.lr.ph21.split.us

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge15.us
  br label %.lr.ph3.split.us

.lr.ph9.us.us:                                    ; preds = %._crit_edge10.us.us, %.lr.ph21.split.us
  %indvars.iv63 = phi i64 [ 0, %.lr.ph21.split.us ], [ %indvars.iv.next64, %._crit_edge10.us.us ]
  %5 = mul nuw nsw i64 %indvars.iv66, %indvars.iv63
  br label %.lr.ph9.us.us.new

._crit_edge10.us.us:                              ; preds = %.lr.ph9.us.us.new
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 140
  br i1 %exitcond65, label %._crit_edge15.us, label %.lr.ph9.us.us

.lr.ph9.us.us.new:                                ; preds = %.lr.ph9.us.us, %.lr.ph9.us.us.new
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.lr.ph9.us.us.new ], [ 0, %.lr.ph9.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv49
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv49
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next50
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 160
  br i1 %exitcond52.1, label %._crit_edge10.us.us, label %.lr.ph9.us.us.new

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv60 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next61, %._crit_edge.us ]
  br label %19

; <label>:19:                                     ; preds = %19, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next.1, %19 ]
  %20 = mul nuw nsw i64 %indvars.iv60, %indvars.iv
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 160
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv60, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %25 = mul nuw nsw i64 %indvars.iv60, %indvars.iv.next
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 160
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 1.600000e+02, double 1.600000e+02>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %19

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next61, 160
  br i1 %exitcond62, label %._crit_edge4, label %.lr.ph3.split.us

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

.lr.ph9.split.us:                                 ; preds = %._crit_edge3.us, %.lr.ph9
  %indvars.iv36 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next37, %._crit_edge3.us ]
  %8 = mul nuw nsw i64 %indvars.iv36, 140
  br label %.lr.ph.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 150
  br i1 %exitcond38, label %._crit_edge10, label %.lr.ph9.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph9.split.us
  %indvars.iv34 = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next35, %._crit_edge.us.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv34
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge.us.us:                                ; preds = %18
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 140
  br i1 %exitcond, label %._crit_edge3.us, label %.lr.ph.us.us

; <label>:11:                                     ; preds = %18, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ 0, %.lr.ph.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %16, %11
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond32, label %._crit_edge.us.us, label %11

._crit_edge10:                                    ; preds = %._crit_edge3.us
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
