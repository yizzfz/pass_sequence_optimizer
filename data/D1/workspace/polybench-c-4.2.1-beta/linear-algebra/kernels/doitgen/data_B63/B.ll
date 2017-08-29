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
  br i1 %7, label %.lr.ph29, label %._crit_edge30

.lr.ph29:                                         ; preds = %6
  %wide.trip.count57 = zext i32 %1 to i64
  %wide.trip.count.3 = zext i32 %2 to i64
  %8 = add i32 %2, -1
  %9 = sext i32 %2 to i64
  %10 = sext i32 %0 to i64
  %xtraiter83 = and i32 %2, 3
  %11 = add nsw i32 %xtraiter83, -1
  %12 = zext i32 %11 to i64
  %13 = add nuw nsw i64 %12, 1
  %14 = add nsw i64 %wide.trip.count57, -1
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %2, 0
  %xtraiter98 = and i64 %9, 1
  %lcmp.mod99 = icmp eq i64 %xtraiter98, 0
  %sunkaddr.prol = ptrtoint double* %5 to i64
  %17 = icmp eq i32 %2, 1
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %18 = icmp eq i32 %xtraiter83, 0
  %19 = icmp ult i32 %8, 3
  %xtraiter = and i64 %wide.trip.count57, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %14, 7
  br label %21

; <label>:21:                                     ; preds = %._crit_edge21, %.lr.ph29
  %indvars.iv77 = phi i64 [ 0, %.lr.ph29 ], [ %indvars.iv.next78, %._crit_edge21 ]
  br i1 %15, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %21
  br i1 %16, label %.lr.ph20.split.us.preheader, label %.lr.ph20.split.preheader

.lr.ph20.split.preheader:                         ; preds = %.lr.ph20
  br i1 %lcmp.mod, label %.lr.ph20.split.prol.loopexit, label %.lr.ph20.split.prol.preheader

.lr.ph20.split.prol.preheader:                    ; preds = %.lr.ph20.split.preheader
  br label %.lr.ph20.split.prol

.lr.ph20.split.prol:                              ; preds = %.lr.ph20.split.prol, %.lr.ph20.split.prol.preheader
  %indvars.iv55.prol = phi i64 [ %indvars.iv.next56.prol, %.lr.ph20.split.prol ], [ 0, %.lr.ph20.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph20.split.prol ], [ %xtraiter, %.lr.ph20.split.prol.preheader ]
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph20.split.prol.loopexit.unr-lcssa, label %.lr.ph20.split.prol, !llvm.loop !1

.lr.ph20.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph20.split.prol
  br label %.lr.ph20.split.prol.loopexit

.lr.ph20.split.prol.loopexit:                     ; preds = %.lr.ph20.split.preheader, %.lr.ph20.split.prol.loopexit.unr-lcssa
  %indvars.iv55.unr = phi i64 [ 0, %.lr.ph20.split.preheader ], [ %indvars.iv.next56.prol, %.lr.ph20.split.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge21.loopexit96, label %.lr.ph20.split.preheader.new

.lr.ph20.split.preheader.new:                     ; preds = %.lr.ph20.split.prol.loopexit
  br label %.lr.ph20.split

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph20.split.us.preheader, %._crit_edge17.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge17.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv77, i64 %indvars.iv73, i64 0
  br label %.lr.ph.us.us

._crit_edge9.us:                                  ; preds = %._crit_edge.us.us
  br i1 %18, label %.prol.loopexit82, label %.prol.preheader81.preheader

.prol.preheader81.preheader:                      ; preds = %._crit_edge9.us
  br label %.prol.preheader81

.prol.preheader81:                                ; preds = %.prol.preheader81.preheader, %.prol.preheader81
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %.prol.preheader81 ], [ 0, %.prol.preheader81.preheader ]
  %prol.iter85 = phi i32 [ %prol.iter85.sub, %.prol.preheader81 ], [ %xtraiter83, %.prol.preheader81.preheader ]
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv69.prol
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv77, i64 %indvars.iv73, i64 %indvars.iv69.prol
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next70.prol = add nuw nsw i64 %indvars.iv69.prol, 1
  %prol.iter85.sub = add nsw i32 %prol.iter85, -1
  %prol.iter85.cmp = icmp eq i32 %prol.iter85.sub, 0
  br i1 %prol.iter85.cmp, label %.prol.loopexit82.loopexit, label %.prol.preheader81, !llvm.loop !3

.prol.loopexit82.loopexit:                        ; preds = %.prol.preheader81
  br label %.prol.loopexit82

.prol.loopexit82:                                 ; preds = %.prol.loopexit82.loopexit, %._crit_edge9.us
  %indvars.iv69.unr = phi i64 [ 0, %._crit_edge9.us ], [ %13, %.prol.loopexit82.loopexit ]
  br i1 %19, label %._crit_edge17.us, label %.lr.ph16.us.new.preheader

.lr.ph16.us.new.preheader:                        ; preds = %.prol.loopexit82
  br label %.lr.ph16.us.new

.lr.ph16.us.new:                                  ; preds = %.lr.ph16.us.new.preheader, %.lr.ph16.us.new
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.3, %.lr.ph16.us.new ], [ %indvars.iv69.unr, %.lr.ph16.us.new.preheader ]
  %28 = getelementptr inbounds double, double* %5, i64 %indvars.iv69
  %29 = bitcast double* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv77, i64 %indvars.iv73, i64 %indvars.iv69
  %32 = bitcast double* %31 to i64*
  store i64 %30, i64* %32, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %33 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv77, i64 %indvars.iv73, i64 %indvars.iv.next70
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70.1
  %39 = bitcast double* %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv77, i64 %indvars.iv73, i64 %indvars.iv.next70.1
  %42 = bitcast double* %41 to i64*
  store i64 %40, i64* %42, align 8
  %indvars.iv.next70.2 = add nsw i64 %indvars.iv69, 3
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next70.2
  %44 = bitcast double* %43 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv77, i64 %indvars.iv73, i64 %indvars.iv.next70.2
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  %exitcond72.3 = icmp eq i64 %indvars.iv.next70.3, %wide.trip.count.3
  br i1 %exitcond72.3, label %._crit_edge17.us.loopexit, label %.lr.ph16.us.new

._crit_edge17.us.loopexit:                        ; preds = %.lr.ph16.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %.prol.loopexit82
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count57
  br i1 %exitcond76, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph20.split.us, %._crit_edge.us.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge.us.us ], [ 0, %.lr.ph20.split.us ]
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv65
  store double 0.000000e+00, double* %48, align 8
  br i1 %lcmp.mod99, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %49

; <label>:49:                                     ; preds = %.prol.preheader
  %50 = load double, double* %22, align 8
  %51 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv65
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %sunkaddr92.prol = shl i64 %indvars.iv65, 3
  %sunkaddr93.prol = add i64 %sunkaddr.prol, %sunkaddr92.prol
  %sunkaddr94.prol = inttoptr i64 %sunkaddr93.prol to double*
  %54 = load double, double* %sunkaddr94.prol, align 8
  %55 = fadd double %54, %53
  store double %55, double* %sunkaddr94.prol, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph.us.us, %49
  %indvars.iv63.unr.ph = phi i64 [ 1, %49 ], [ 0, %.lr.ph.us.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit
  %sunkaddr92 = shl i64 %indvars.iv65, 3
  %sunkaddr93 = add i64 %sunkaddr, %sunkaddr92
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to double*
  %sunkaddr92.1 = shl i64 %indvars.iv65, 3
  %sunkaddr93.1 = add i64 %sunkaddr.1, %sunkaddr92.1
  %sunkaddr94.1 = inttoptr i64 %sunkaddr93.1 to double*
  br label %56

._crit_edge.us.us.unr-lcssa:                      ; preds = %56
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count.3
  br i1 %exitcond68, label %._crit_edge9.us, label %.lr.ph.us.us

; <label>:56:                                     ; preds = %56, %.lr.ph.us.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv63.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next64.1, %56 ]
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv77, i64 %indvars.iv73, i64 %indvars.iv63
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv63, i64 %indvars.iv65
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = load double, double* %sunkaddr94, align 8
  %63 = fadd double %62, %61
  store double %63, double* %sunkaddr94, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv77, i64 %indvars.iv73, i64 %indvars.iv.next64
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next64, i64 %indvars.iv65
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = load double, double* %sunkaddr94.1, align 8
  %70 = fadd double %69, %68
  store double %70, double* %sunkaddr94.1, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next64.1, %9
  br i1 %exitcond.1, label %._crit_edge.us.us.unr-lcssa, label %56

.lr.ph20.split:                                   ; preds = %.lr.ph20.split, %.lr.ph20.split.preheader.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr, %.lr.ph20.split.preheader.new ], [ %indvars.iv.next56.7, %.lr.ph20.split ]
  %indvars.iv.next56.7 = add nsw i64 %indvars.iv55, 8
  %exitcond58.7 = icmp eq i64 %indvars.iv.next56.7, %wide.trip.count57
  br i1 %exitcond58.7, label %._crit_edge21.loopexit96.unr-lcssa, label %.lr.ph20.split

._crit_edge21.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge21

._crit_edge21.loopexit96.unr-lcssa:               ; preds = %.lr.ph20.split
  br label %._crit_edge21.loopexit96

._crit_edge21.loopexit96:                         ; preds = %.lr.ph20.split.prol.loopexit, %._crit_edge21.loopexit96.unr-lcssa
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit96, %._crit_edge21.loopexit, %21
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next78, %10
  br i1 %exitcond97, label %._crit_edge30.loopexit, label %21

._crit_edge30.loopexit:                           ; preds = %._crit_edge21
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #2 {
.lr.ph27:
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %._crit_edge21.us, %.lr.ph27
  %indvars.iv63 = phi i64 [ 0, %.lr.ph27 ], [ %indvars.iv.next64, %._crit_edge21.us ]
  br label %.lr.ph15.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next64, 150
  br i1 %exitcond69, label %.lr.ph8.split.us.preheader, label %.lr.ph27.split.us

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge21.us
  br label %.lr.ph8.split.us

.lr.ph15.us.us:                                   ; preds = %.lr.ph27.split.us, %._crit_edge16.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge16.us.us ], [ 0, %.lr.ph27.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv63, %indvars.iv59
  br label %6

._crit_edge16.us.us:                              ; preds = %6
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 140
  br i1 %exitcond62, label %._crit_edge21.us, label %.lr.ph15.us.us

; <label>:6:                                      ; preds = %6, %.lr.ph15.us.us
  %indvars.iv55 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next56.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv55
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv55
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next56
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, 160
  br i1 %exitcond58.1, label %._crit_edge16.us.us, label %6

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.lr.ph8.split.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph8.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv52, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv52, %indvars.iv.next
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
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next53, 160
  br i1 %exitcond68, label %._crit_edge9, label %.lr.ph8.split.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #0 {
.lr.ph12:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge6.us, %.lr.ph12
  %indvars.iv39 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge13, label %.lr.ph12.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph12.split.us, %._crit_edge.us.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us.us ], [ 0, %.lr.ph12.split.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv35
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge.us.us:                                ; preds = %18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %.lr.ph.us.us

; <label>:11:                                     ; preds = %18, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ 0, %.lr.ph.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %16, %11
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge.us.us, label %11

._crit_edge13:                                    ; preds = %._crit_edge6.us
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
