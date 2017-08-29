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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph31, label %._crit_edge32

.lr.ph31:                                         ; preds = %6
  %8 = add i32 %2, -1
  %9 = sext i32 %0 to i64
  %10 = and i32 %2, 3
  %11 = add nsw i32 %10, -1
  %12 = zext i32 %11 to i64
  %13 = add nuw nsw i64 %12, 1
  %14 = zext i32 %1 to i64
  %15 = zext i32 %2 to i64
  %xtraiter76 = and i32 %2, 1
  %16 = add nsw i64 %14, -1
  %17 = icmp sgt i32 %1, 0
  %18 = icmp sgt i32 %2, 0
  %19 = icmp eq i32 %xtraiter76, 0
  %20 = icmp eq i32 %8, 0
  %sunkaddr91 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %21 = icmp eq i32 %10, 0
  %22 = icmp ult i32 %8, 3
  %xtraiter = and i64 %14, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = icmp ult i64 %16, 7
  br label %24

; <label>:24:                                     ; preds = %._crit_edge14, %.lr.ph31
  %indvars.iv71 = phi i64 [ 0, %.lr.ph31 ], [ %indvars.iv.next72, %._crit_edge14 ]
  br i1 %17, label %.lr.ph13, label %._crit_edge14

.lr.ph13:                                         ; preds = %24
  br i1 %18, label %.lr.ph13.split.us.preheader, label %.lr.ph13.split.preheader

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
  br i1 %23, label %._crit_edge14.loopexit96, label %.lr.ph13.split.preheader.new

.lr.ph13.split.preheader.new:                     ; preds = %.lr.ph13.split.prol.loopexit
  br label %.lr.ph13.split

.lr.ph13.split.us.preheader:                      ; preds = %.lr.ph13
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %.lr.ph13.split.us.preheader, %._crit_edge9.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge9.us ], [ 0, %.lr.ph13.split.us.preheader ]
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us.new
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.prol.loopexit80
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next68, %14
  br i1 %exitcond86, label %._crit_edge14.loopexit, label %.lr.ph13.split.us

.lr.ph8.us.new:                                   ; preds = %.lr.ph8.us.new.preheader, %.lr.ph8.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.3, %.lr.ph8.us.new ], [ %indvars.iv63.unr, %.lr.ph8.us.new.preheader ]
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.1
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.1
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.2
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next64.2
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next64.3 = add nsw i64 %indvars.iv63, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next64.3, %15
  br i1 %exitcond66.3, label %._crit_edge9.us.loopexit, label %.lr.ph8.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph13.split.us
  %indvars.iv59 = phi i64 [ 0, %.lr.ph13.split.us ], [ %indvars.iv.next60, %._crit_edge.us.us ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %46, align 8
  br i1 %19, label %.prol.loopexit75, label %.prol.preheader74

.prol.preheader74:                                ; preds = %.lr.ph.us.us
  %47 = load double, double* %25, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %sunkaddr88 = shl i64 %indvars.iv59, 3
  %sunkaddr89 = add i64 %sunkaddr, %sunkaddr88
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to double*
  %51 = load double, double* %sunkaddr90, align 8
  %52 = fadd double %50, %51
  store double %52, double* %sunkaddr90, align 8
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.lr.ph.us.us, %.prol.preheader74
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader74 ], [ 0, %.lr.ph.us.us ]
  br i1 %20, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit75
  %sunkaddr92 = shl i64 %indvars.iv59, 3
  %sunkaddr93 = add i64 %sunkaddr91, %sunkaddr92
  %sunkaddr94 = inttoptr i64 %sunkaddr93 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit75
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next60, %15
  br i1 %exitcond85, label %.lr.ph8.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv55
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = load double, double* %sunkaddr94, align 8
  %59 = fadd double %57, %58
  store double %59, double* %sunkaddr94, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv.next56
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %64, %59
  store double %65, double* %sunkaddr94, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %15
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph8.us:                                       ; preds = %._crit_edge.us.us
  br i1 %21, label %.prol.loopexit80, label %.prol.preheader79.preheader

.prol.preheader79.preheader:                      ; preds = %.lr.ph8.us
  br label %.prol.preheader79

.prol.preheader79:                                ; preds = %.prol.preheader79.preheader, %.prol.preheader79
  %indvars.iv63.prol = phi i64 [ %indvars.iv.next64.prol, %.prol.preheader79 ], [ 0, %.prol.preheader79.preheader ]
  %prol.iter83 = phi i32 [ %prol.iter83.sub, %.prol.preheader79 ], [ %10, %.prol.preheader79.preheader ]
  %66 = getelementptr inbounds double, double* %5, i64 %indvars.iv63.prol
  %67 = bitcast double* %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv71, i64 %indvars.iv67, i64 %indvars.iv63.prol
  %70 = bitcast double* %69 to i64*
  store i64 %68, i64* %70, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter83.sub = add nsw i32 %prol.iter83, -1
  %prol.iter83.cmp = icmp eq i32 %prol.iter83.sub, 0
  br i1 %prol.iter83.cmp, label %.prol.loopexit80.loopexit, label %.prol.preheader79, !llvm.loop !3

.prol.loopexit80.loopexit:                        ; preds = %.prol.preheader79
  br label %.prol.loopexit80

.prol.loopexit80:                                 ; preds = %.prol.loopexit80.loopexit, %.lr.ph8.us
  %indvars.iv63.unr = phi i64 [ 0, %.lr.ph8.us ], [ %13, %.prol.loopexit80.loopexit ]
  br i1 %22, label %._crit_edge9.us, label %.lr.ph8.us.new.preheader

.lr.ph8.us.new.preheader:                         ; preds = %.prol.loopexit80
  br label %.lr.ph8.us.new

.lr.ph13.split:                                   ; preds = %.lr.ph13.split, %.lr.ph13.split.preheader.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %.lr.ph13.split.preheader.new ], [ %indvars.iv.next48.7, %.lr.ph13.split ]
  %indvars.iv.next48.7 = add nsw i64 %indvars.iv47, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next48.7, %14
  br i1 %exitcond.7, label %._crit_edge14.loopexit96.unr-lcssa, label %.lr.ph13.split

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit96.unr-lcssa:               ; preds = %.lr.ph13.split
  br label %._crit_edge14.loopexit96

._crit_edge14.loopexit96:                         ; preds = %.lr.ph13.split.prol.loopexit, %._crit_edge14.loopexit96.unr-lcssa
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit96, %._crit_edge14.loopexit, %24
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next72, %9
  br i1 %exitcond97, label %._crit_edge32.loopexit, label %24

._crit_edge32.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
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
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.lr.ph21:
  br label %.lr.ph21.split.us

.lr.ph21.split.us:                                ; preds = %._crit_edge15.us, %.lr.ph21
  %indvars.iv56 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next57, %._crit_edge15.us ]
  br label %.lr.ph9.us.us

._crit_edge15.us:                                 ; preds = %._crit_edge10.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next57, 150
  br i1 %exitcond70, label %.lr.ph3.split.us.preheader, label %.lr.ph21.split.us

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge15.us
  br label %.lr.ph3.split.us

.lr.ph9.us.us:                                    ; preds = %._crit_edge10.us.us, %.lr.ph21.split.us
  %indvars.iv52 = phi i64 [ 0, %.lr.ph21.split.us ], [ %indvars.iv.next53, %._crit_edge10.us.us ]
  %5 = mul nuw nsw i64 %indvars.iv52, %indvars.iv56
  br label %.lr.ph9.us.us.new

._crit_edge10.us.us:                              ; preds = %.lr.ph9.us.us.new
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 140
  br i1 %exitcond, label %._crit_edge15.us, label %.lr.ph9.us.us

.lr.ph9.us.us.new:                                ; preds = %.lr.ph9.us.us.new, %.lr.ph9.us.us
  %indvars.iv48 = phi i64 [ 0, %.lr.ph9.us.us ], [ %indvars.iv.next49.1, %.lr.ph9.us.us.new ]
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
  br i1 %exitcond51.1, label %._crit_edge10.us.us, label %.lr.ph9.us.us.new

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  br label %.lr.ph3.split.us.new

.lr.ph3.split.us.new:                             ; preds = %.lr.ph3.split.us.new, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next.1, %.lr.ph3.split.us.new ]
  %19 = mul nuw nsw i64 %indvars.iv, %indvars.iv45
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv45
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
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph3.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph3.split.us.new
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next46, 160
  br i1 %exitcond69, label %._crit_edge4, label %.lr.ph3.split.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.lr.ph11:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge5.us, %.lr.ph11
  %indvars.iv37 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next38, %._crit_edge5.us ]
  %8 = mul nuw nsw i64 %indvars.iv37, 140
  br label %.lr.ph.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge2.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next38, 150
  br i1 %exitcond43, label %._crit_edge12, label %.lr.ph11.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge2.us.us, %.lr.ph11.split.us
  %indvars.iv33 = phi i64 [ 0, %.lr.ph11.split.us ], [ %indvars.iv.next34, %._crit_edge2.us.us ]
  %9 = add nuw nsw i64 %indvars.iv33, %8
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge2.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond40, label %._crit_edge5.us, label %.lr.ph.us.us

; <label>:11:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %._crit_edge.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge2.us.us, label %11

._crit_edge12:                                    ; preds = %._crit_edge5.us
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
